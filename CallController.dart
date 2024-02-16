import 'dart:async';
import 'dart:developer';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/RatingDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:videosdk/videosdk.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CallController extends GetxController {
  CallController();

  final storage = GetStorage();

  final MeetingProvider meetingProvider = Get.find();


  late String type, action;
  late bool load;
  late bool ended;
  late bool show;
  late bool auto;

  late SessionHistoryModel sessionHistory;
  late AstrologerModel astrologer;

  late int seconds;
  late int max;
  late double wallet;
  late bool rated;



  Timer? timer;


  // Control Status
  // late bool isMicOn, isCameraOn;
  //
  late bool micEnabled, camEnabled, speakerEnabled;

  late bool isRecordingOn;

  late String recordingState;

  // Camera Controller
  CameraController? cameraController;

  // Meeting
  Room? meeting;
  late bool joined;

  // Streams
  Stream? shareStream;
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;


  late bool fullScreen;


  late tz.Location location;
  late tz.TZDateTime started_at;


  @override
  void onInit() {
    tz.initializeTimeZones();
    location = tz.getLocation("GMT");

    load = true;
    ended = false;
    show = true;
    auto = false;

    rated = false;

    // isMicOn = true;
    // isCameraOn = false;
    //
    micEnabled = false;
    camEnabled = false;
    speakerEnabled = false;

    isRecordingOn = false;
    recordingState = "RECORDING_STOPPED";

    joined = false;
    fullScreen = false;

    seconds = 0;
    wallet = 0;

    type = Get.arguments['type'];
    action = Get.arguments['action'];
    astrologer = Get.arguments['astrologer'];


    if(Get.arguments['wallet']!=null) {
      wallet = Get.arguments['wallet'];
    }

    if (action == "VIEW" || action=="ACTIVE") {
      load = false;
      sessionHistory = Get.arguments['session_history'];
      // astrologer = AstrologerModel(id: Get.arguments['astro_id'], name: "", mobile: "", email: "", experience: '', profile: "", about: "");
    }
    else {
      if(Get.arguments['session_history']==null) {
        sessionHistory = SessionHistoryModel(id: Get.arguments['ch_id'],
            sess_id: 0,
            status: type,
            category: "CALL",
            meeting_id: Get.arguments['meeting_id'],
            session_id: Get.arguments['session_id'],
            rate: int.parse(Get.arguments['rate']),
            commission: 0,
            type: Get.arguments['chat_type'],
            requested_at: DateTime.now().toString(),
            updated_at: DateTime.now().toString());
      }
      else {
        sessionHistory = Get.arguments['session_history'];
      }
      astrologer = Get.arguments['astrologer'];
    }

    start();
  }


  void start() {
    print("ssweb: starttt");

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if(action == "VIEW") {
      getSessionHistory();
    }
    else {
      initializeMeeting();
    }
  }


  void initializeMeeting() {
    print("ssweb: initialize ${type} ${action}");
    if(type=="REQUESTED") {
      if(action=="REQUESTING"){
        wallet = double.parse((storage.read("wallet")??0.0).toString());
        update();
        joinRoom();
        // startRing(65);
      }
    }
    else if(type=="ACTIVE"){
      getSessionHistory();
    }
    else if(type=="RECONNECT"){
      if(action=="NOT DECIDED") {
        wallet = double.parse((storage.read("wallet")??0.0).toString());
        update();
        // startRing(60);
      }
      else if(action=="ACCEPT") {
        print("ssweb: acceptttttt meetingggg");
        wallet = double.parse((storage.read("wallet")??0.0).toString());
        update();
        accept();
      }
    }
  }

  void joinRoom() async {
    print("ssweb: roommmmmmmm");
    try {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // CustomTrack customTrack = await VideoSDK.createCameraVideoTrack(
      //     encoderConfig: CustomVideoTrackConfig.h480p_w640p,
      //     facingMode: "environment",
      //     multiStream: true // false,  Default : true
      // );
      // Create instance of Room (Meeting)
      try {

        if(meeting==null) {
          meeting = VideoSDK.createRoom(
            roomId: sessionHistory.meeting_id ?? "",
            token: sessionHistory.token ?? "",
            displayName: astrologer.name,
            micEnabled: micEnabled,
            camEnabled: camEnabled,
            maxResolution: 'hd',
            multiStream: false,
            defaultCameraIndex: 1,
            notification: const NotificationInfo(
              title: "Video SDK",
              message: "Video SDK is sharing screen in the meeting",
              icon: "notification_share", // drawable icon name
            ),
            // customCameraVideoTrack: customTrack,
          );
          update();
          if (type == "RECONNECT") {
            stopTimer();
            type = "ACTIVE";
          }
          registerMeetingEvents();


          print("ssweb: joinedddd");

          // Join meeting
          meeting?.join();
        }
      }
      catch(ex) {
        print("ssweb: ex.toString()");
        print(ex.toString());
      }

    } catch (error) {

      //showSnackBarMessage(message: error.toString(), context: context);
      Essential.showSnackBar("Errorrrr: ${error.toString()}");
    }
  }


  void registerMeetingEvents() {
    // Called when joined in meeting
    meeting?.on(
      Events.roomJoined,
          () {
            print("ssweb: Events.roomJoined");
            print(meeting?.participants);
        if ((meeting?.participants.length??0) > 1) {
            meeting = meeting;
            update();
        } else {
          meeting = meeting;
          joined = true;
          update();
        }
      },
    );

    meeting?.on(
      Events.participantJoined,
          () {
            print("ssweb: Events.participantJoined");
            print(meeting?.participants);
        if ((meeting?.participants.length??-1) > 0) {
            stopTimer();
            meeting = meeting;
            type = "ACTIVE";
            update();
            calculateCountdown();
            startTimer();
        } else {
          meeting = meeting;
          joined = true;
          update();
        }
      },
    );

    // Called when meeting is ended
    meeting?.on(Events.roomLeft, (String? errorMsg) {
      print("ssweb: Events.roomLeft");
      if (errorMsg != null) {
        print("ssweb: Meeting left due to $errorMsg !!");
      }
      else {
        if(type=="COMPLETED" && ended==false) {
          ended = true;
          update();
          endMeeting("COMPLETED");
        }
        else {
          disposeObjects();
        }
      }
    });

    // Called when recording is started
    meeting?.on(Events.recordingStateChanged, (String status) {
      print("ssweb: Events.recordingStateChanged");
      print("Meeting recording ${status == "RECORDING_STARTING" ? "is starting" : status == "RECORDING_STARTED" ? "started" : status == "RECORDING_STOPPING" ? "is stopping" : "stopped"}");

      recordingState = status;
      update();
    });

    // Called when stream is enabled
    meeting?.localParticipant.on(Events.streamEnabled, (Stream stream) {
      print("ssweb: Events.streamEnabled");
      if (stream.kind == 'video') {
        videoStream = stream;
        update();
      }
      else if (stream.kind == 'audio') {
        audioStream = stream;
        update();
      }
      else if (stream.kind == 'share') {
        shareStream = stream;
        update();
      }
    });

    // Called when stream is disabled
    meeting?.localParticipant.on(Events.streamDisabled, (Stream stream) {
      print("ssweb: Events.streamDisabled");
      if (stream.kind == 'video' && videoStream?.id == stream.id) {
        videoStream = null;
        update();
      }
      else if (stream.kind == 'audio' && audioStream?.id == stream.id) {
        audioStream = null;

        update();
      }
      else if (stream.kind == 'share' && shareStream?.id == stream.id) {
        shareStream = null;
        update();
      }
    });

    meeting?.on(Events.participantLeft, (participant) {
      print("ssweb: Events.participantLeft");
              if(joined) {
                print("ssweb: Recordingggggg : Stop Participant Left");
                try {
                  meeting?.stopRecording();
                }
                catch(ex) {
                  print("ssweb: error ${ex.toString()}");
                }
                meeting?.end();
                endMeeting("COMPLETED");
              }
        });

    meeting?.on(
        Events.error,
            (error) {
            print("ssweb: Events.error");
          print("ssweb: ${error['name']} :: ${error['message']}");
        });
  }



  void initCameraPreview() {
    // Get available cameras
    availableCameras().then((availableCameras) {
      // stores selected camera id
      int selectedCameraId = availableCameras.length > 1 ? 1 : 0;

      cameraController = CameraController(
        availableCameras[selectedCameraId],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      log("Starting Camera");
      cameraController!.initialize().then((_) {
        update();
      });
    }).catchError((err) {
      log("Error: $err");
    });
  }


  Future<void> getSessionHistory() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : sessionHistory.id.toString(),
      SessionConstants.sender : "U",
      SessionConstants.astro_id : astrologer.id.toString(),
    };


    print(data);

    await meetingProvider.fetchByID(storage.read("access"), ApiConstants.id, data).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        astrologer = response.astrologer ?? astrologer;
        sessionHistory = response.session_history ?? sessionHistory;
        wallet = response.wallet ?? 0;

        started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at ?? ""}+0000");

        if (type == "ACTIVE") {
          if (sessionHistory.type == "FREE") {
            show = false;
            update();
            max = 600;
          }
          else {
            show = true;
            update();
            calculateCountdown();
          }
          joinRoom();

          startTimer();
          load = true;
          update();
        }
        else {
          load = true;
          update();
        }
      }
      else {
        load = true;
        update();
      }

    });
  }

  void startTimer() {
    try {
      var kolkata = tz.getLocation('GMT');
      Duration duration = tz.TZDateTime.now(kolkata).difference(started_at);
      seconds = duration.inSeconds;
      update();
      timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
      update();
    }
    catch(ex) {
      getSessionHistory();
    }
  }

  void setCountDown() {
    seconds+=1;
    update();
    // print(max);
    // print(seconds);
    if(max<=seconds) {
      print("ssweb: enddd");
      end(true);
    }
    if(show) {
      if ((max-seconds)<=120) {
        show = false;
        update();
        Essential.showBasicDialog("You are running low on balance. Recharge now or else your conversation will end soon. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
          if(value=="Recharge Now") {
            goto("/wallet");
          }
        });
      }
    }
  }



  void accept() {
    print("ssweb: accept");
    // stopTimer();
    // micEnabled = true;
    // camEnabled = false;
    // speakerEnabled = false;
    // update();
    // initCameraPreview();
    // print("ssweb: accepteddddd");
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    // validateMeeting("ACTIVE");
  }


  void reject() async {
    print("ssweb: reject meeting");
    // if(timer!=null) {
    //   stopTimer();
    // }
    //
    //
    // Map<String, dynamic> data = {
    //   SessionConstants.ch_id : ch_id,
    //   SessionConstants.sender : "U",
    //   SessionConstants.reason : "Call was rejected by user",
    // };
    // print("ssweb: "+data.toString());
    //
    // if(storage.read("calling")!=null) {
    //   storage.remove("calling");
    // }
    //
    // await meetingProvider.reject(data, storage.read("access")).then((response) async {
    //   if(response.code==1) {
    //     type = "REJECTED";
    //     update();
    //   }
    //   else if(response.code!=-1) {
    //     Essential.showSnackBar(response.message);
    //   }
    //   else {
    //     Essential.showSnackBar(response.message);
    //   }
    // });
    // back();
  }

  void cancelMeeting() async {
    print("ssweb: cancel meeting");
    if(timer!=null) {
      stopTimer();
    }

    if(sessionHistory.id!=null) {
      Map<String, dynamic> data = {
        SessionConstants.ch_id : sessionHistory.id.toString(),
        SessionConstants.sender : "U",
        SessionConstants.reason : "Chat was cancelled by user",
      };
      if(storage.read("calling")!=null) {
        storage.remove("calling");
      }

      await meetingProvider.cancel(data, storage.read("access")).then((response) async {
        if(response.code==1) {
          // type = "CANCELLED";
          // update();
        }
        else if(response.code!=-1) {
          Essential.showSnackBar(response.message);
        }
        else {
          Essential.showSnackBar(response.message);
        }
      });
      storage.remove("calling");
      back();
    }
  }


  void end(bool auto) async {
    print("ssweb: endddd");
    if(timer!=null) {
      stopTimer();
    }

    this.auto = auto;
    update();

    Map<String, dynamic> data = {
      SessionConstants.sender: "U",
      SessionConstants.ch_id: sessionHistory.id.toString(),
      SessionConstants.reason : auto ? "Call was ended automatically due to low wallet balance" : "User ended the call",
      CommonConstants.seconds : seconds,
    };
    print("ssweb: endddd"+data.toString());

    if(storage.read("calling")!=null) {
      storage.remove("calling");
    }

    try {
      meeting?.stopRecording();
      meeting?.end();
    }
    catch(ex) {
      print("ssweb: error ${ex.toString()}");
    }

    await meetingProvider.end(data, storage.read("access")).then((response) async {
      print("ssweb: response.toJson()");
      print(response.toJson());
      if (response.code == 1) {
        print("ssweb: Recordingggggg : Stop end");
        // meeting?.end();
        stopTimer();
        storage.remove("calling");
        type = "COMPLETED";
        update();
        disposeObjects();
        manageRating();
        // back();
      }
      else if (response.code == -2) {}
      else {
        // stopTimer();
        // storage.remove("calling");
        // type = "COMPLETED";
        // update();
        // disposeObjects();
        // manageRating();
        Essential.showSnackBar(response.message);
      }
    });
  }

  void endMeeting(String status) async {
    getSessionHistory();
    if(timer!=null) {
      stopTimer();
    }
    type = status;
    update();
    print("ssweb: Recordingggggg : Stop endd meetingggg");
    try {
      meeting?.stopRecording();
    }
    catch(ex) {
      print("ssweb: error ${ex.toString()}");
    }
    meeting?.end();
    disposeObjects();


    print("ssweb: statusssss");
    print(status);
    ended = true;
    update();
    if(status=="COMPLETED") {
      getSessionHistory();
      manageRating();
    }
  }

  void updateMic() {
    // micEnabled = !micEnabled;
    print("ssweb: audioStreammmmm");
    print(audioStream);
    print(meeting?.micEnabled);

    if (audioStream != null) {
      meeting?.muteMic();
      micEnabled = false;
      // isMicOn = false;
    } else {
      meeting?.unmuteMic();
      micEnabled = true;
      // isMicOn = true;
    }
    update();
  }

  void updateCamera() {
    // camEnabled = !camEnabled;
    print("ssweb: videoStreammmmm");
    print(videoStream);
    print(meeting?.camEnabled);
    if (videoStream != null) {
      // if (meeting?.camEnabled==true) {
      meeting?.disableCam();
      camEnabled = false;
    } else {
      meeting?.enableCam();
      camEnabled = true;
      print("ssweb: hellloooo");
    }
    update();
  }

  void updateSpeaker() {
    List<MediaDeviceInfo> outputDevices = meeting?.getAudioOutputDevices()??[];
    for (var element in outputDevices) {
      if(speakerEnabled) {
        if(element.deviceId!="speaker") {
          meeting?.switchAudioDevice(element);
          speakerEnabled = false;
          update();
          break;
        }
      }
      else {
        if(element.deviceId=="speaker") {
          meeting?.switchAudioDevice(element);
          speakerEnabled = true;
          update();
          break;
        }
      }
    }
  }

  void manageRating() {
    if(rated==false) {
      rated = true;
      update();
      Get.dialog(
        RatingDialog(
          sessionHistory: sessionHistory,
          astrologer: astrologer,
        ),
        barrierDismissible: true,
      ).then((value) {
        if (value != null) {
          sessionHistory = value;
          rated = false;
          update();
          Essential.showSnackBar("Thank you for your feedback");
        }
      });
    }
  }

  void confirmDelete() {
    Get.dialog(
      const BasicDialog(
        text: "Are you sure you want to delete your rating?",
        btn1: "Yes",
        btn2: "No",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Yes") {
        deleteRating();
      }
    });
  }

  Future<void> deleteRating() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : sessionHistory.id.toString(),
      SessionConstants.rating : null,
      SessionConstants.review : null,
      SessionConstants.anonymous : null,
    };

    print(data);

    await meetingProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
      if(response.code==1) {
        sessionHistory = sessionHistory.copyWith(rating: null, review: null, anonymous: null, reviewed_at: null);
        update();
        Essential.showSnackBar("Review Deleted");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void stopTimer() {
    // if(player.playing) {
    //   player.stop();
    // }
    if(timer!=null) {
      timer!.cancel();
    }
    update();
  }

  Future<bool> onWillPopScope() async {
    // if(joined) {
    //   meeting?.leave();
    // }
    return true;
  }


  void calculateCountdown() {
    max = 0;
    print(wallet);
    print(sessionHistory.rate);
    int minutes = (wallet/sessionHistory.rate).floor();
    print(minutes);
    if(minutes>0) {
      max = minutes * 60;
    }
    double rem = wallet%sessionHistory.rate;

    if(rem!=0) {
      double perSecRate = (sessionHistory.rate/60).toPrecision(2);
      if(rem>=perSecRate) {
        int secs = (rem/perSecRate).floor();
        max+=secs;
      }
    }
    print("ssweb: maxxxxx $max");
    update();
  }


  void updateFullScreen() {
    fullScreen = !fullScreen;
    update();
  }



  void goto(String page) {
    Get.toNamed(page)?.then((value) {
      show = true;
      wallet = double.parse((storage.read("wallet")??0.0).toString());
      update();
      calculateCountdown();
    });
  }

  void back() {
    if(timer!=null) {
      stopTimer();
    }
    disposeObjects();
    Get.back();
  }

  void disposeObjects() {
    print("ssweb: disposeeee objectsss");
    // cameraController?.dispose();
    // try {
    //   meeting?.stopLivestream();
    //   meeting?.stopHls();
    // }
    // catch(ex) {
    //   print("ssweb: errorrrrrrr");
    //   print(ex.toString());
    //   print(ex);
    //
    // }
    // meeting = null;
    // shareStream = videoStream = audioStream = remoteParticipantShareStream = null;
    // update();
  }
}