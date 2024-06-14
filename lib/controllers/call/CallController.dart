import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/RatingDialog.dart';
import 'package:astro_guide/dialogs/TokenDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/notifier/GlobalNotifier.dart';
import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/repositories/MeetingRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_internet_signal/flutter_internet_signal.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:videosdk/videosdk.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CallController extends GetxController {
  CallController();

  final storage = GetStorage();

  late MeetingProvider meetingProvider;

  final Connectivity connectivity = Connectivity();
  final FlutterInternetSignal internetSignal = FlutterInternetSignal();

  late String sessionID;


  CameraController? cameraController;
  late AstrologerModel astrologer;
  late bool ended, rated;
  late String meetingID, token;
  late bool micEnabled, camEnabled, speakerEnabled;
  late bool auto;

  late int poor;

  // Meeting
  Room? meeting;
  // late Room meeting;
  bool joined = false;
  bool failed = false;

  // Streams
  Stream? shareStream;
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;

  bool fullScreen = false;
  late int seconds;
  late int max;
  late int ring;
  static Timer? timer;
  late String type, action;
  late bool load;
  late bool show;
  late int ch_id;
  late String chat_type;
  late SessionHistoryModel sessionHistory;
  late double wallet;
  late tz.TZDateTime started_at;
  late tz.Location location;
  late int rate;
  late bool cancel;

  int cnt = 0;

  final player = AudioPlayer();
  final GlobalNotifier globalNotifier = Get.find();

  late int gift, rose, token_status;

  @override
  void onInit() {
    try {
      meetingProvider = Get.find();
    }
    catch(ex) {
      final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
      meetingProvider = Get.put(MeetingProvider(meetingRepository));
    }

    gift = rose = token_status = 0;
    globalNotifier.updateCallInit(true);
    ended = false;
    rated = false;
    print("ssweb: hellloooo callllll");
    wallet = 0;
    seconds = 0;
    poor = 1;
    ring = 0;

    try {
      astrologer = Get.arguments['astrologer'];
      print("ssweb: hellloooo callllll1");
      type = Get.arguments['type'];
      action = Get.arguments['action'];
      print("ssweb: hellloooo callllll2");
      if (Get.arguments['wallet'] != null) {
        wallet = Get.arguments['wallet'];
      }
    }
    catch(ex) {
      print(ex.toString());
    }
    tz.initializeTimeZones();
    location = tz.getLocation("GMT");
    micEnabled = true;
    camEnabled = false;
    speakerEnabled = false;
    sessionID = "";
    load = true;
    auto=false;
    show = true;
    cancel = false;

    try {
      if (action == "VIEW" || action == "ACTIVE") {
        load = false;
        sessionHistory = Get.arguments['session_history'];
        ch_id = sessionHistory.id;
        meetingID = sessionHistory.meeting_id ?? "";
        sessionID = sessionHistory.session_id ?? "";
        token = sessionHistory.token ?? "";
        // astrologer = AstrologerModel(id: Get.arguments['astro_id'], name: "", mobile: "", email: "", experience: 0, profile: "", about: "");

      }
      else {
        try {
          ch_id = Get.arguments['ch_id'];
          chat_type = Get.arguments['chat_type'];
          if (Get.arguments['session_history'] == null) {
            sessionHistory = SessionHistoryModel(id: ch_id,
                sess_id: 0,
                status: type,
                category: "CALL",
                call_type: Get.arguments['call_type'],
                meeting_id: Get.arguments['meeting_id'],
                session_id: Get.arguments['session_id'],
                rate: int.parse(Get.arguments['rate']),
                commission: 0,
                type: chat_type,
                requested_at: DateTime.now().toString(),
                updated_at: DateTime.now().toString());
          }
          else {
            sessionHistory = Get.arguments['session_history'];
          }
          meetingID = sessionHistory.meeting_id ?? "";
          sessionID = sessionHistory.session_id ?? "";
          token = sessionHistory.token ?? "";
          // sessionHistory = SessionHistoryModel(id: ch_id, sess_id: 0, status: type, rate: 0, commission: 0, type: chat_type, requested_at: DateTime.now().toString(), updated_at: DateTime.now().toString());
          astrologer = Get.arguments['astrologer'];
        }
        catch (ex) {
          print(ex.toString());
        }
      }
    }
    catch(ex) {
      print(ex.toString());
    }

    print("ssweb: inittttttt");
    start();
    super.onInit();
  }

  void start() {print("ssweb: ssweb: starttt");

    try {
      if (action == "VIEW") {
        getSessionHistory("start");
      }
      else {
        initCameraPreview();

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        initializeMeeting();
      }
    }
    catch(ex) {
      ch_id = int.parse(storage.read("ch_id").toString());
      astrologer = AstrologerModel.fromJson(json.decode(storage.read("astrologer")));
      type = "VIEW";
      getSessionHistory("start no action");
    }
  }
  
  Future<void> initCameraPreview() async {
    availableCameras().then((availableCameras) async {
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

  void updateMic() {
    // micEnabled = !micEnabled;
    print("ssweb: audioStreammmmm");
    print(audioStream);
    print(meeting?.micEnabled);

    if (audioStream != null) {
      meeting?.muteMic();
      micEnabled = true;
    } else {
      meeting?.unmuteMic();
      micEnabled = false;
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

  Future<void> createAndJoinMeeting() async {
    failed = false;
    update();
    Map<String, dynamic> data = {
      SessionConstants.astro_id : astrologer.id.toString(),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
    };

    await meetingProvider.create(data, storage.read("access")).then((response) async {
      print("ssweb: ssweb: createeee meetingggg");
      if(response.code==1) {
        token = response.token??"";
        meetingID = response.meetingID??"";
        sessionID = response.sessionID??"";
        // ch_id = response.meet_id;
        timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown("create"));
        update();
        joinRoom();
      }
      else if(response.code==-2) {
        failed = true;
        update();
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });

    // token = await fetchToken();
    // meetingID = await createMeeting(token);
    // update();
  }

  joinRoom() async {
    print("ssweb: ssweb: ssweb: roommmmmmmm");
    print("ssweb: ssweb: ssweb: meeting ${meeting}");
    try {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      CustomTrack customTrack = await VideoSDK.createCameraVideoTrack(
          encoderConfig: CustomVideoTrackConfig.h240p_w320p,
          facingMode: "environment",
          multiStream: false // false,  Default : true
      );
      // Create instance of Room (Meeting)
      try {
        if(meeting==null) {
          meeting = VideoSDK.createRoom(
            roomId: meetingID,
            token: token,
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
            customCameraVideoTrack: customTrack,
            participantId: "U"
          );

          update();
          // Join meeting
          if (type == "RECONNECT") {
            stopTimer();
            type = "ACTIVE";
            if(storage.read("free")??false) {
              await storage.write("free", false);
            }
            update();
          }
          registerMeetingEvents();

          meeting?.join();


          print("ssweb: ssweb: joinedddd");
        }
      }
      catch(ex) {
        print("ssweb: ssweb: ex.toString()");
        print(meetingID);
        print(ex.toString());
      }

    } catch (error) {

      //showSnackBarMessage(message: error.toString(), context: context);
      Essential.showSnackBar("Errorrrr: ${error.toString()}");
    }
  }

  void registerMeetingEvents() {
    print("ssweb: ssweb: ssweb: inittttt");
    print(meeting);
    // Called when joined in meeting
    meeting?.on(
      Events.roomJoined,
          () async {
            print("ssweb: joinedddd Room");
            print("ssweb: room joineddddd $type $action");
            print(meeting?.participants.length);
            if((meeting?.participants??{}).isNotEmpty) {
              print("ssweb: local participant ${meeting?.localParticipant.id}");
              print("ssweb: participants ${meeting?.participants.keys}");
            }
        if ((meeting?.participants.length??0) > 1) {
          if (joined == false) {
            stopTimer();
            joined = true;
            seconds = 0;
            type = "ACTIVE";
            if(storage.read("free")??false) {
              await storage.write("free", false);
            }
            // started_at = Essential.getCurrentDate();
            calculateCountdown();
            update();
            startTimer("room");
            Map<String, dynamic> config = {
              "layout": {
                "type": "GRID",
                "priority": "SPEAKER",
                "gridSize": 4,
              },
              "theme": "DARK",
              "mode": "video-and-audio",
              "quality": "high",
              "orientation": "portrait",
            };

            print("ssweb: ssweb: Recordingggggg : Start Joined");
            meeting?.startRecording(config: config);
          } else {
            // print("ssweb: ssweb: stop");
            // stopTimer();
            // print("ssweb: ssweb: calculate");
            // seconds = 0;
            // update();
            // calculateCountdown();
            // print("ssweb: ssweb: start");
            // startTimer();
          }
        }
      },
    );

    meeting?.on(
      Events.participantJoined,
          (Participant participant) async {
            print("ssweb: joinedddd Participant");
            print("ssweb: ssweb: participant joined $type $action");
            print(meeting?.participants.length);
            print("ssweb: participant ${participant.id}");
            print("ssweb: local participant ${meeting?.localParticipant.id}");
            print("ssweb: participants ${meeting?.participants.keys}");

            // if ((meeting?.participants.length??-1) > 0) {
            if(participant.id=="A") {
              if (joined == false) {
                stopTimer();
                joined = true;
                seconds = 0;
                type = "ACTIVE";
                if(storage.read("free")??false) {
                  await storage.write("free", false);
                }
                // started_at = Essential.getCurrentDate();
                calculateCountdown();
                update();
                startTimer("participate");
                Map<String, dynamic> config = {
                  "layout": {
                    "type": "GRID",
                    "priority": "SPEAKER",
                    "gridSize": 4,
                  },
                  "theme": "DARK",
                  "mode": "video-and-audio",
                  "quality": "high",
                  "orientation": "portrait",
                };

                print("ssweb: ssweb: Recordingggggg : Start Joined");
                meeting?.startRecording(config: config);
              }
              else {
                joined = true;
                update();
              }
            }
      },
    );

    meeting?.on(
      Events.participantLeft,
          (Participant participant) {
            print("ssweb: partttt leftttttt");
        if(joined) {
          print("ssweb: ssweb: Recordingggggg : Stop Participant Left");
          try {
            // meeting?.stopRecording();
          }
          catch(ex) {
            print("ssweb: ssweb: error ${ex.toString()}");
          }
          try {
            if (meeting != null) {
              meeting!.end();
              meeting!.leave();
            }
          }
          catch(ex) {
            print("error meeting");
            print(ex);
          }
          disposeObjects();
        }
      },
    );


    meeting?.on(
      Events.recordingStateChanged,
          (String status) {
        print("ssweb: ssweb: Recordingggggg : State Changed - "+status);
      },
    );


    // Called when meeting is ended
    meeting?.on(Events.roomLeft, (String? errorMsg) {
      print("ssweb: room leftttttt");
      print(meeting);
      print(meeting?.localParticipant.id);
      print(meeting?.localParticipant.isLocal);
      print(meeting?.participants.length);
      print(ended);
      print(type);
      if (errorMsg != null) {
        // Essential.showSnackBar("Meeting left due to $errorMsg !!");
        print("Meeting left due to $errorMsg !!");
      }

      // if(ended==false) {
      if((type=="COMPLETED" && ended==false) || joined==true) {
        ended = true;
        update();
        endMeeting("COMPLETED");
      }
      else {
        disposeObjects();
      }
    });


    // Called when stream is enabled
    meeting?.localParticipant.on(Events.streamEnabled, (Stream _stream) {
      print("ssweb: enableStreammmmm");
      if (_stream.kind == 'video') {
        videoStream = _stream;
      } else if (_stream.kind == 'audio') {
        audioStream = _stream;
      } else if (_stream.kind == 'share') {
        shareStream = _stream;
      }
      update();
    });

    // Called when stream is disabled
    meeting?.localParticipant.on(Events.streamDisabled, (Stream _stream) {
      print("ssweb: disableStreammmmm");
      if (_stream.kind == 'video' && videoStream?.id == _stream.id) {
        videoStream = null;
      } else if (_stream.kind == 'audio' && audioStream?.id == _stream.id) {
        audioStream = null;
      } else if (_stream.kind == 'share' && shareStream?.id == _stream.id) {
        shareStream = null;
      }
    });

    // Called when presenter is changed
    meeting?.on(Events.presenterChanged, (_activePresenterId) {
      Participant? activePresenterParticipant =
      meeting?.participants[_activePresenterId];

      // Get Share Stream
      Stream? _stream = activePresenterParticipant?.streams.values
          .singleWhere((e) => e.kind == "share");

      remoteParticipantShareStream = _stream;
      update();
    });

    // meeting?.on(
    //     Events.participantLeft,
    //         (participant) => {
    //       if (meeting?.participants.length < 2)
    //         {
    //           // joined = true,
    //           // update(),
    //           // subscribeToChatMessages(meeting),
    //           endMeeting()
    //         }
    //
    //     });


    meeting?.on(
        Events.error,
            (error)  {
          // Essential.showSnackBar("${error['name']} :: ${error['message']}");

          print("ssweb: ssweb: ssweb: overr  inittttt");
          print("ssweb: ${error['name']} :: ${error['message']}");
          print(meeting);
          try {
            if (meeting != null) {
              meeting!.end();
              meeting!.leave();
            }
          }
          catch(ex) {
            print("error meeting");
            print(ex);
          }
        });
    print("ssweb: ssweb: ssweb: overr out inittttt");
  }

  void subscribeToChatMessages(Room meeting) {
    meeting?.pubSub.subscribe("CHAT", (message) {
      if (message.senderId != meeting?.localParticipant.id) {
         Essential.showSnackBar("${message.senderName}: ${message.message}",);
      }
    });
  }

  Future<bool> onWillPopScope() async {
    if(joined) {
      joined = false;
      update();
      meeting?.leave();
    }
    if(player.playing) {
      player.stop();
    }
    return true;
  }

  void accept() {
    print("ssweb: ssweb: accept");
    stopTimer();
    micEnabled = true;
    camEnabled = false;
    speakerEnabled = false;
    update();
    initCameraPreview();
    print("ssweb: ssweb: accepteddddd");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    validateMeeting("ACTIVE");
  }

  Future<void> validateMeeting(String status) async {
    Map<String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.meetingID : meetingID,
      SessionConstants.type : status,
    };
    print("ssweb: ssweb: validateeee meetingggg");
    print(data);

    await meetingProvider.validate(data, storage.read("access")).then((response) async {
      if(response.code==1) {
        token = response.token??"";
        type = response.data?.status??type;
        update();

        print("ssweb: type res ${response.data?.status}");
        print("ssweb: type $type");
        if(type=="REQUESTED" || type=="ACTIVE" || type=="RECONNECT") {
          joinRoom();
        }
        else {
          endMeeting(type);
        }
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });

    // token = await fetchToken();
    // meetingID = await createMeeting(token);
    // update();
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
      SessionConstants.ch_id: ch_id.toString(),
      SessionConstants.reason : auto ? "Call was ended automatically due to low wallet balance" : "User ended the call",
      CommonConstants.seconds : seconds,
    };
    print("ssweb: ssweb: ssweb: endddd"+data.toString());

    if(globalNotifier.callController.value!=null) {
      globalNotifier.updateCallController(null);
    }

    try {
      // meeting?.stopRecording();
    }
    catch(ex) {
      print("ssweb: ssweb: error ${ex.toString()}");
    }

    await meetingProvider.end(data, storage.read("access")).then((response) async {
      print("ssweb: ssweb: ssweb: response.toJson()");
      print(response.toJson());
      if (response.code == 1) {
        print("ssweb: ssweb: Recordingggggg : Stop end");
        stopTimer();
        globalNotifier.updateCallController(null);
        type = "COMPLETED";
        try {
          if (meeting != null) {
            meeting!.end();
            meeting!.leave();
          }
        }
        catch(ex) {
          print("error meeting");
          print(ex);
        }
        update();
        disposeObjects();
        getSessionHistory("end");
        print("hellooooo");
        manageRating();
        // back();
      }
      else if (response.code == -2) {}
      else {
        back();
        Essential.showSnackBar(response.message);
      }
    });
  }

  void cancelCall(bool auto) async {
    if(timer!=null) {
      stopTimer();
    }

    this.auto = auto;
    update();

    Map<String, dynamic> data = {
      // SessionConstants.meetingID: meetingID,
      // SessionConstants.sessionID: sessionID,
      SessionConstants.sender: "U",
      SessionConstants.ch_id: ch_id.toString(),
      SessionConstants.reason : "Call was cancelled by user",
    };
    print("ssweb: ssweb: ssweb: "+data.toString());

    if(globalNotifier.callController.value!=null) {
      globalNotifier.updateCallController(null);
    }

    await meetingProvider.cancel(data, storage.read("access")).then((response) async {
      print("ssweb: ssweb: ssweb: response.toJson()");
      print(response.toJson());
      if (response.code == 1) {
        if(meeting!=null) {
          try {
            if (meeting != null) {
              meeting!.end();
              meeting!.leave();
            }
          }
          catch(ex) {
            print("error meeting");
            print(ex);
          }
        }
        disposeObjects();
        globalNotifier.updateCallController(null);
        // back();
      }
      else if (response.code == -2) {}
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void reject() async {
    if(timer!=null) {
      stopTimer();
    }


    Map<String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : "Call was rejected by user",
    };
    print("ssweb: ssweb: ssweb: "+data.toString());

    if(globalNotifier.callController.value!=null) {
      globalNotifier.updateCallController(null);
    }

    await meetingProvider.reject(data, storage.read("access")).then((response) async {
      if(response.code==1) {
        type = "REJECTED";
        update();
      }
      else if(response.code!=-1) {
        Essential.showSnackBar(response.message);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });

    if(meeting!=null) {
      try {
        if (meeting != null) {
          meeting!.end();
          meeting!.leave();
        }
      }
      catch(ex) {
        print("error meeting");
        print(ex);
      }
    }
    back();
  }

  void endMeeting(String status) async {
    print("hello");
    getSessionHistory("endMeeting");
    if(timer!=null) {
      stopTimer();
    }
    type = status;
    if(type=="COMPLETED") {
      action="VIEW";
    }
    update();
    print("ssweb: ssweb: Recordingggggg : Stop endd meetingggg");
    try {
      // meeting?.stopRecording();
    }
    catch(ex) {
      print("ssweb: ssweb: error ${ex.toString()}");
    }
    if(meeting!=null) {
      try {
        if (meeting != null) {
          meeting!.end();
          meeting!.leave();
        }
      }
      catch(ex) {
        print("error meeting");
        print(ex);
      }
    }
    disposeObjects();


    print("ssweb: statusssss");
    print(status);
    ended = true;
    update();
    if(status=="COMPLETED") {
      getSessionHistory("endMeeting Completed");
      manageRating();
    }

    // back();
  }

  void cancelMeeting() async {
    if(timer!=null) {
      stopTimer();
    }

    if(ch_id!=null) {
      Map<String, dynamic> data = {
        SessionConstants.ch_id : ch_id,
        SessionConstants.sender : "U",
        SessionConstants.reason : "Chat was cancelled by user",
      };
      if(globalNotifier.callController.value!=null) {
        globalNotifier.updateCallController(null);
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
      globalNotifier.updateCallController(null);

      if(meeting!=null) {
        try {
          if (meeting != null) {
            meeting!.end();
            meeting!.leave();
          }
        }
        catch(ex) {
          print("error meeting");
          print(ex);
        }
      }
      back();
    }
  }

  void updateFullScreen() {
    fullScreen = !fullScreen;
    update();
  }

  @override
  void dispose() {
    print("ssweb: disposeeeeeee");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  void updateValues() {
    print("sswebnotifier: before chat ${globalNotifier.showSession}");
    if(globalNotifier.showSession.value=="notification") {
      globalNotifier.updateValue("session");
    }
    globalNotifier.updateCallInit(false);
    print("sswebnotifier: after chat ${globalNotifier.showSession}");
  }

  void storeCalling(CallController callController) {
    globalNotifier.updateCallController(callController);
  }

  void startRing(int time) {
    ring = time;
    if(type=="RECONNECT") {
      player.setAsset("assets/audio/notification.mp3");
      player.play();
      player.processingStateStream.listen((processingState) {
        if (processingState == ProcessingState.completed && type == "RECONNECT") {
          player.seek(Duration.zero);
          player.play();
          update();
          print("ssweb: completed");
        }
      });
    }
    update();
    if(timer==null) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setRing();
      });
    }
    update();
  }

  void setRing() {
    print(ring);
    ring-=1;
    update();
    if(ring<=0) {
      stopTimer();
      if(type=="REQUESTED") {
        print("ssweb: ssweb: ssweb: waitlist");
        waitlistCall();
      }
      else {
        print("ssweb: ssweb: ssweb: missed");
        missedCall();
      }
    }
  }

  void startTimer(String type) {
    print("typeeeee");
    print(type);
    try {
      var kolkata = tz.getLocation('GMT');
      Duration duration = tz.TZDateTime.now(kolkata).difference(started_at);
      seconds = duration.inSeconds;
      update();
      timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown(type));
      update();
    }
    catch(ex) {
      getSessionHistory("start Timer");
    }
  }

  void setCountDown(String type) {
    seconds+=1;
    update();

    if(seconds%3==0) {
      checkInternet();
    }
    print("ssweb: ssweb: max");
    print(max);
    print("ssweb: ssweb: total");
    print(seconds);
    if(max<=seconds) {
      print("ssweb: ssweb: ssweb: enddd");
      if(sessionHistory.call_type!="IVR") {
        end(true);
      }
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

  void stopTimer() {
    print("ssweb: backkkkkkkkk stopppppp");
    if(player.playing) {
      player.stop();
    }
    if(timer!=null) {
      timer!.cancel();
    }
    update();
  }

  Future<void> getSessionHistory(String from) async {
    print("ssweb: from: $from");

    Map <String, String> data = {
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : "U",
      SessionConstants.astro_id : astrologer.id.toString(),
    };


    print("ssweb: data");
    print(data);

    await meetingProvider.fetchByID(storage.read("access"), ApiConstants.id, data).then((response) async {
      print(response.toJson());
      print("response.toJson()");
      print(response.session_history);
      if(response.code==1) {
        astrologer = response.astrologer ?? astrologer;
        sessionHistory = response.session_history ?? sessionHistory;
        wallet = response.wallet ?? 0;
        gift = response.gift ?? 0;
        rose = response.rose ?? 0;
        token_status = response.token_status ?? 0;

        cnt = 0;
        started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at ?? ""}+0000");
        rate = sessionHistory.rate;
        chat_type = sessionHistory.type;
        token = sessionHistory.token??"";
        meetingID = sessionHistory.meeting_id??"";
        load = false;


        if(type=="REQUESTED" && sessionHistory.status=="ACTIVE") {
          type = sessionHistory.status;
          stopTimer();
          startTimer("ss history");
        }

        if (type == "ACTIVE") {
          if (chat_type == "FREE") {
            show = false;
            update();
            max = 600;
          }
          else {
            show = true;
            update();
            calculateCountdown();
          }
          if(sessionHistory.call_type=="VIDEO") {
            joinRoom();
          }

          stopTimer();
          startTimer("history");
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

  void goto(String page) {
    Get.toNamed(page)?.then((value) {
      show = true;
      wallet = double.parse((storage.read("wallet")??0.0).toString());
      update();
      calculateCountdown();
    });
  }

  void calculateCountdown() {
    max = 0;
    int minutes = (wallet/rate).floor();
    if(minutes>0) {
      max = minutes * 60;
    }
    double rem = wallet%rate;

    if(rem!=0) {
      double perSecRate = (rate/60).toPrecision(2);
      if(rem>=perSecRate) {
        int secs = (rem/perSecRate).floor();
        max+=secs;
      }
    }
    update();
  }

  void

  initializeMeeting() {
    print("ssweb: ssweb: initialize ${type} ${action}");
    if(type=="REQUESTED") {
      // if(action=="ACCEPT") {
      //   createAndJoinMeeting();
      // }
      if(action=="REQUESTING"){
        token = sessionHistory.token??"";
        meetingID = sessionHistory.meeting_id??"";
        sessionID = sessionHistory.session_id??"";
        wallet = double.parse((storage.read("wallet")??0.0).toString());
        rate = sessionHistory.rate;
        update();
        joinRoom();
        startRing(sessionHistory.call_type=="IVR" ? 125 : 65);
      }
    }
    else if(type=="ACTIVE"){
      getSessionHistory("initializw");
    }
    else if(type=="RECONNECT"){
      if(action=="NOT DECIDED") {
        wallet = double.parse((storage.read("wallet")??0.0).toString());
        rate = sessionHistory.rate;
        update();
        startRing(sessionHistory.call_type=="IVR" ? 120 : 60);
      }
      else if(action=="ACCEPT") {
        print("ssweb: ssweb: acceptttttt meetingggg");
        wallet = double.parse((storage.read("wallet")??0.0).toString());
        rate = sessionHistory.rate;
        update();
        accept();
      }
    }
  }

  void waitlistCall() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : "Astrologer missed the call and it is shifted to WAITLIST",
    };


    if(globalNotifier.callController.value!=null) {
      globalNotifier.updateCallController(null);
    }

    await meetingProvider.waitlist(data, storage.read("access")).then((response) async {
      if(timer!=null) {
        stopTimer();
      }

      if(response.code==1) {
        cnt = 0;
        type = "WAITLISTED";
        update();
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void missedCall() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : "User missed the reconnect call.",
    };


    if(globalNotifier.callController.value!=null) {
      globalNotifier.updateCallController(null);
    }

    await meetingProvider.missed(data, storage.read("access")).then((response) async {
      if(timer!=null) {
        stopTimer();
      }

      // Get.back();

      if(meeting!=null) {
        try {
          if (meeting != null) {
            meeting!.end();
            meeting!.leave();
          }
        }
        catch(ex) {
          print("error meeting");
          print(ex);
        }
      }
      back();
      if(response.code==1) {
        cnt = 0;
        type = "MISSED";
        update();
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void back() {
    if(player.playing) {
      player.stop();
    }
    if(timer!=null) {
      stopTimer();
    }

    print("ssweb: backkkkkkkkk ${timer}");
    print("ssweb: backkkkkkkkk ${meeting}");
    disposeObjects();
    Get.back();
    // Get.offAllNamed("/home");
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

        print("token_status");
        print(token_status);
        print(sessionHistory.token_type??"");
        // if(auto) {
          if(token_status==1 && (sessionHistory.token_type??"").isEmpty) {
            manageToken();
          }
        // }
      });
    }
  }

  void manageToken() {
    Get.dialog(
      TokenDialog(
          sessionHistory: sessionHistory,
          astrologer: astrologer,
          token_amount: {"GIFT" : gift.toString(), "ROSE" : rose.toString(), "CUSTOM" : ""}
      ),
      barrierDismissible: true,
    ).then((value) {
      print("valueeeee");
      print(value);
      if(value!=null) {
        sessionHistory = value;
        update();
        Essential.showSnackBar("Thank you for giving appreciation token");
      }
    });
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
      SessionConstants.ch_id : sessionHistory.id,
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

  void disposeObjects() {
    print("ssweb: disposeeee objectsss");
    if(timer!=null) {
      timer?.cancel();
      timer = null;
      update();
      print(timer);
    }
    meeting = null;
    shareStream = videoStream = audioStream = remoteParticipantShareStream = null;
    update();

    try {
      cameraController?.stopImageStream();
      cameraController?.stopVideoRecording();
      cameraController?.dispose();
      print(cameraController);
      cameraController = null;
      update();
      print(cameraController);
      print("disposeeee objectsss overrrr");
    }
    catch(ex) {
      print(ex.toString());
    }
    try {
      meeting?.stopLivestream();
      meeting?.stopHls();
    }
    catch(ex) {
      print("ssweb: errorrrrrrr");
      print(ex.toString());
      print(ex);

    }

  }


  Future<void> checkInternet() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      print("Resulttt connectivity none");
      poor = 0;
      // Mobile network available.
    }
    else if (connectivityResult.contains(ConnectivityResult.mobile)) {
      print("Resulttt connectivity mobile");
      final int? strength = await internetSignal.getMobileSignalStrength();
      print('Resulttt mobile dBm -> $strength');
      if (strength == null) {
        print('No mobile connection');
        poor = 0;
      }

      if ((strength??0) >= -50) {
        print('Excellent mobile signal');
        poor = 1;
      } else if ((strength??0) >= -70) {
        print('Good mobile signal');
        poor = 1;
      } else if ((strength??0) >= -90) {
        print('Fair mobile signal');
        poor = 1;
      } else {
        print('Poor mobile signal');
        poor = 2;
      }
      // Mobile network available.
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      print("Resulttt connectivity wifi");
      final int? rssi = await internetSignal.getWifiSignalStrength();
      print('Resulttt wifi dBm -> $rssi');
      if (rssi == null) {
        print('No Wi-Fi connection');
        poor = 0;
      }

      if ((rssi??0) >= -30) {
        print('Excellent Wi-Fi signal');
        poor = 1;
      } else if ((rssi??0) >= -67) {
        print('Good Wi-Fi signal');
        poor = 1;
      } else if ((rssi??0) >= -70) {
        print('Fair Wi-Fi signal');
        poor = 1;
      } else {
        print('Poor Wi-Fi signal');
        poor = 2;
      }
      update();
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    }
  }
}
