import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/RatingDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/models/chat/ChatResponseModel.dart';
import 'package:astro_guide/models/session/CheckSessionResponseModel.dart';
import 'package:astro_guide/models/session/EndSessionResponseModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:path/path.dart';
// import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:record/record.dart' as r;
import 'package:just_audio/just_audio.dart' as p;

class ChatController extends GetxController {
  ChatController();

  final storage = GetStorage();

  final ChatProvider chatProvider = Get.find();
  ScrollController controller = ScrollController();


  int recordDuration = 0;
  Timer? recordTimer;
  late final r.Record audioRecorder;
  StreamSubscription<r.RecordState>? recordSub;
  r.RecordState recordState = r.RecordState.stop;
  StreamSubscription<r.Amplitude>? amplitudeSub;
  r.Amplitude? amplitude;

  Duration? position;
  Duration? duration;


  late AstrologerModel astrologer;

  List<ChatModel> chats = [];
  late SessionHistoryModel sessionHistory;

  TextEditingController message = TextEditingController();

  late bool send;
  int id = -1;
  int ch_id = -1;
  late String type, action;


  late IO.Socket socket;

  int cnt = 0;
  static Timer? timer;
  static String? timer_type;
  late tz.TZDateTime started_at;
  late int seconds;
  late int max;
  late tz.Location location;
  late double amount;
  late bool auto;
  late double wallet;
  late int rate;
  late String chat_type;
  late bool show;
  late bool cancel;
  late bool reject;
  late bool load;

  late Directory directory;
  late int ring;

  final player = p.AudioPlayer();

  late bool recording;
  late String playerUrl;

  @override
  void onInit() {
    super.onInit();
    initAudio();


    cancel = false;
    reject = false;
    recording = false;
    load = true;
    playerUrl = "";
    tz.initializeTimeZones();
    location = tz.getLocation("GMT");
    type = Get.arguments['type'];
    action = Get.arguments['action'];

    send = false;
    show = true;
    wallet = double.parse((storage.read("wallet")??0.0).toString());

    max = 0;

    print("actionmnnnn");
    print(action);

    if (action == "VIEW" || action=="ACTIVE") {
      load = false;
      sessionHistory = Get.arguments['session_history'];
      ch_id = sessionHistory.id;
      print("viewwww");
      astrologer = AstrologerModel(id: Get.arguments['astro_id'], name: "", mobile: "", email: "", experience: '', profile: "", about: "");

    }
    else {
      ch_id = Get.arguments['ch_id'];
      chat_type = Get.arguments['chat_type'];
      sessionHistory = SessionHistoryModel(id: ch_id, sess_id: 0, status: type, rate: 0, commission: 0, category: "CHAT", type: chat_type, requested_at: DateTime.now().toString(), updated_at: DateTime.now().toString());
      astrologer = Get.arguments['astrologer'];
    }
    start();
  }

  void initAudio() {
    audioRecorder = r.Record();

    recordSub = audioRecorder.onStateChanged().listen((recordState) {
      updateRecordState(recordState);
    });

    amplitudeSub = audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) {
      amplitude = amp;
      update();
    });

    // playerStateChangedSubscription =
    //     audioPlayer.onPlayerComplete.listen((state) async {
    //       await stop();
    //       update();
    //     });
    // positionChangedSubscription = audioPlayer.onPositionChanged.listen(
    //         (position) {
    //
    //       this.position = position;
    //       update();
    //     }
    // );
    // durationChangedSubscription = audioPlayer.onDurationChanged.listen(
    //         (duration) {
    //       this.duration = duration;
    //       update();
    //     }
    // );
  }


  start() async {
    directory = await getTemporaryDirectory();
    if(action == "VIEW") {
      getSessionHistory();
    }
    else {
      initializeSocket();
    }
  }

  initializeSocket() {
    socket = IO.io(
      ApiConstants.urlS,
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {
            SessionConstants.username : storage.read("access"),
            SessionConstants.ch_id : ch_id.toString(),
            SessionConstants.sender : "U",
            SessionConstants.user_id : astrologer.id.toString(),
          }).build(),
    );
    connectSocket();
    print(type);
    print(action);

    if(type=="REQUESTED") {
      if(action=="ACCEPT") {
        initiateChat();
      }
      else if(action=="REQUESTING"){
        // startRing(5);
        startRing(65);
      }
    }
    else if(type=="ACTIVE"){
      getSessionHistory();
    }
    else if(type=="RECONNECT"){
      if(action=="NOT DECIDED") {
        startRing(60);
      }
      else if(action=="ACCEPT") {
        initiateChat();
      }
    }
  }




  Future<void> getChats(int offset) async {
    String query = "";
    // if(search.text.isNotEmpty) {
    //   query = "UPPER(a.name) LIKE '%${search.text.toUpperCase()}%'";
    //   if(spec.id==-1) {
    //     query = " WHERE ${query}";
    //   }
    //   else {
    //     query = " AND ${query}";
    //   }
    // }

    Map <String, String> data = {
      ApiConstants.offset : offset.toString(),
      ApiConstants.search : query,
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : "U",
      SessionConstants.astro_id : astrologer.id.toString(),
    };


    await chatProvider.fetchByID(storage.read("access"), ApiConstants.history, data).then((response) async {
      if(response.code==1) {
        if(offset==0) {
          chats = [];
        }
        chats.addAll(response.data??[]);
      }
      load = true;
      update();

    });
  }


  Future<void> getSessionHistory() async {
    Map <String, String> data = {
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : "U",
      SessionConstants.astro_id : astrologer.id.toString(),
    };


    await chatProvider.fetchByID(storage.read("access"), ApiConstants.id, data).then((response) async {
      print("response.session_history?.toJson()");
      print(response.session_history?.toJson());
      if(response.code==1) {
        chats.addAll(response.data ?? []);
        astrologer = response.astrologer ?? astrologer;
        sessionHistory = response.session_history ?? sessionHistory;
        wallet = response.wallet ?? 0;

        cnt = 0;
        print(sessionHistory.started_at);
        started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at ?? ""}+0000");
        rate = sessionHistory.rate;
        chat_type = sessionHistory.type;
        load = false;

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

          startTimer();
        }
      }
      load = true;
      update();

    });
  }

  // sendMessage() {
  //   socket.emit('message', {
  //     'message': message.text.trim(),
  //     'sender': "user1"
  //   });
  //   message.clear();
  // }

  connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    socket.onError((data) {
      print('Socket.IO server error');
    });
    socket.on(
      'initiate', (data) async {
        CheckSessionResponseModel checkSessionResponse = CheckSessionResponseModel.fromJson(json.decode(data));

        if(checkSessionResponse.code==1) {
          stopTimer(false);
          type = "ACTIVE";
          if(storage.read("free")??false) {
            storage.write("free", false);
          }

          cnt = 0;
          print(checkSessionResponse.started_at);
          started_at = tz.TZDateTime.parse(location, "${checkSessionResponse.started_at??""}+0000");
          rate = checkSessionResponse.rate??0;
          chat_type = checkSessionResponse.type??"PAID";
          load = false;
          if(chat_type=="FREE") {
            show = false;
            update();
            max = 600;
          }
          else {
            show = true;
            update();
            calculateCountdown();
          }
          // started_at = DateTime.parse(checkSessionResponse.started_at??"");
          print("--------------------------------------------------------------------------------");

          // startTimer();
          print("-----------------------------================-----------------------------------");
          getSessionHistory();
        }
        else if(checkSessionResponse.code!=-1) {
          cnt = 0;
          Essential.showSnackBar(checkSessionResponse.message);
        }
        else {
          await Essential.getNewAccessToken().then((value) async {
            cnt++;
            update();
            if(value==true) {
              if(cnt<=3) {
                initiateChat();
              }
              else {
                Essential.logout();
              }
            }
            else {
              Essential.logout();
            }
          });
        }
      }
    );

    socket.on(
        'waitlist', (data) async {
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      if(timer!=null) {
        stopTimer(true);
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
    }
    );

    socket.on(
      'missed', (data) async {
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      print(response.toJson());

      if(timer!=null) {
        stopTimer(true);
      }

      if(response.code==1) {
        cnt = 0;
        type = "MISSED";
        update();
        back();
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3) {
              // waitlistChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );


    socket.on(
      'cancel', (data) async {
      EndSessionResponseModel endSessionResponse = EndSessionResponseModel.fromJson(json.decode(data));

      if(timer!=null) {
        stopTimer(true);
      }

      print("endSessionResponse.toJson()");
      print(endSessionResponse.toJson());

      if(endSessionResponse.code==1) {
        cnt = 0;
        type = "CANCELLED";
        if(cancel==false) {
          // stopTimer();
          back();
        }
        else {
          update();
        }
      }
      else if(endSessionResponse.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(endSessionResponse.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3 && cancel) {
              cancelChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );
    socket.on(
        'reject', (data) async {
          print(data);
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      print(response.toJson());

      if(timer!=null) {
        stopTimer(true);
      }

      if(response.code==1) {
        cnt = 0;
        type = "REJECTED";
        if(reject==false) {
          update();
        }
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3 && reject) {
              rejectChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );

    socket.on(
      'end', (data) async {
        EndSessionResponseModel endSessionResponse = EndSessionResponseModel.fromJson(json.decode(data));


        if(endSessionResponse.code==1) {
          cnt = 0;
          type = "COMPLETED";
          action = "COMPLETED";
          amount = endSessionResponse.amount??0;
          storage.write("wallet", endSessionResponse.wallet??storage.read(("wallet")));

          stopTimer(true);
          manageRating();
        }
        else if(endSessionResponse.code!=-1) {
          cnt = 0;
          Essential.showSnackBar(endSessionResponse.message);
        }
        else {
          await Essential.getNewAccessToken().then((value) async {
            cnt++;
            update();
            if(value==true) {
              if(cnt<=3) {
                endChat(auto);
              }
              else {
                Essential.logout();
              }
            }
            else {
              Essential.logout();
            }
          });
        }
      }
    );

    socket.on(
      'message',
          (data) {
        print("dataaa");
        ChatResponseModel chatResponseModel = ChatResponseModel.fromJson(json.decode(data));

        List<ChatModel> temp = [
          chatResponseModel.data!
        ];
        temp.addAll(chats);
        chats = temp;
        update();
        // controller.jumpTo(controller.position.minScrollExtent);
      },
    );
    socket.on(
      'self',
          (data) {
            print("dataggaa");
        ChatResponseModel chatResponseModel = ChatResponseModel.fromJson(json.decode(data));

        for (int i=0; i<chats.length; i++) {
          if(chats[i].id==chatResponseModel.m_id) {
            if(chatResponseModel.code==1) {
              chats[i] = chatResponseModel.data!;
            }
            else {
              chats[i] = chats[i].copyWith(error: 1);
            }
            update();
            break;
          }
        }
      },
    );
  }

  void sendText() {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.astro_id : astrologer.id.toString(),
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : SessionConstants.U,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.message : message.text,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "T"
    };

    sendMessage(data, "");
  }


  Future<void> sendImage(ImageSource source) async {
    Get.back();
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      imageQuality: 100, source: source,
    );

    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.astro_id : astrologer.id.toString(),
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : SessionConstants.U,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "I"
    };


    if (image != null) {
      File file = File(image.path!);
      List<int> fileBytes = await file.readAsBytes();

      data.addAll({SessionConstants.message : MultipartFile(File(file!.path), filename: image!.name), SessionConstants.ext : image.name.substring(image.name.lastIndexOf(".")+1)});
      // data.addAll({SessionConstants.message : fileBytes, SessionConstants.ext : image.name.substring(image.name.lastIndexOf(".")+1)});

      int size = await file.length();
      sendMessage(data, file.path);
    }
  }

  Future<void> sendVoice(String path) async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.astro_id : astrologer.id.toString(),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : SessionConstants.U,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "V",
    };


    if (path.isNotEmpty) {
      File file = File(path);
      // List<int> fileBytes = await file.readAsBytes();

      data.addAll({SessionConstants.message : MultipartFile(File(file!.path), filename: basename(path)), SessionConstants.ext : basename(path).substring(basename(path).lastIndexOf(".")+1)});
      // data.addAll({SessionConstants.message : fileBytes, SessionConstants.ext : image.name.substring(image.name.lastIndexOf(".")+1)});
      print("dataaaaaa");
      print(basename(path));
      sendMessage(data, file.path);
    }
  }

  Future<void> sendDocument() async {
    Get.back();
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['pdf']);

    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.astro_id : astrologer.id.toString(),
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : SessionConstants.U,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "D"
    };


    if (result != null) {
      File file = File(result.files.first.path??"");
      // List<int> fileBytes = await file.readAsBytes();

      data.addAll({SessionConstants.message : MultipartFile(File(file!.path), filename: basename(file!.path)), SessionConstants.ext : basename(file!.path).substring(basename(file!.path).lastIndexOf(".")+1)});

      // data.addAll({SessionConstants.message : fileBytes});

      sendMessage(data, file.path);
    }
  }


  Future<void> sendMessage(Map <String, dynamic> data, String path) async {
    List<ChatModel> temp = [
      ChatModel(id: id--, ch_id: ch_id, message: data['m_type']=="T" ? message.text : path, sender: SessionConstants.U, type: SessionConstants.M, m_type: data['m_type'], sent_at: DateTime.now().toString())
    ];
    temp.addAll(chats);
    chats = temp;
    message.text = "";
    send = false;
    update();
    controller.jumpTo(controller.position.minScrollExtent);

    if(data['m_type']=="T") {
      socket.emit('message', data);
      print(data);
      print("emittttteddd");
      message.clear();
    }
    else {
      sendFile(data);
    }
  }
  @override
  void dispose() {
    disposeObjects();
    super.dispose();
  }

  void goto(String page, {dynamic? arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      show = true;
      wallet = double.parse((storage.read("wallet")??0.0).toString());
      update();
      calculateCountdown();
    });
  }

  getSeenStatus(ChatModel chat) {
    if(chat.seen_at!=null) {
      return 2;
    }
    else if(chat.received_at!=null) {
      return 1;
    }
    else {
      if(chat.id<0) {
        return -1;
      }
      return 0;
    }
  }

  void changeSend() {
    if(message.text.isEmpty) {
      send = false;
      update();
    }
    else {
      if(!send) {
        send = true;
        update();
      }
    }
  }


  bool getDateDifference(String date1, String date2) {
    DateTime prev = DateTime.parse(date1);
    DateTime curr = DateTime.parse(date2);

    if(DateTime(prev.year, prev.month, prev.day).compareTo(DateTime(curr.year, curr.month, curr.day))==0) {
      return false;
    }
    return true;
  }

  Future<void> initiateChat() async {
    stopTimer(false);
    action = "ACCEPT";
    update();

    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
    };

    socket.emit('initiate', data);
  }

  void cancelChat() async {
    print("chat cancelled");
    // stopTimer();
    cancel = true;
    update();
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : "Chat was cancelled by user",
    };

    print(data);


    socket.emit('cancel', data);
    print("hello cancel");

    back();
  }

  void rejectChat() async {
    print("chat rejected");
    // stopTimer();
    reject = true;
    update();
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : "Chat was rejected by user",
    };


    socket.emit('reject', data);
    back();
  }

  void back() {
    stopTimer(true);
    Get.back();
  }

  void endChat(bool auto) async {
    this.auto = auto;
    update();
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : auto ? "Chat was ended automatically due to low wallet balance" : "User ended the chat",
      CommonConstants.seconds : seconds,
    };

    socket.emit('end', data);
  }

  void startTimer() {
    var gmt = tz.getLocation('GMT');
    tz.TZDateTime now = tz.TZDateTime.now(gmt);
    Duration duration = now.difference(started_at);
    print("startedddddd");
    print(timer);
    print(now);
    print(started_at);
    print(duration);
    seconds = duration.inSeconds;
    update();
    if(timer==null || (timer!=null && timer_type=="ring")) {
      timer_type = "chat";
      timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    }
    update();
  }

  void setCountDown() {
    seconds+=1;
    update();
    if(max<=seconds) {
      endChat(true);
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

  String getChatTime() {
    // return "${seconds} secs";
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  void stopTimer(bool dispose) {
    if(player.playing) {
      player.stop();
    }
    if(timer!=null) {
      timer!.cancel();
    }
    if(dispose) {
      disposeObjects();
    }
    update();
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
          print("completed");
        }
      });
    }
    update();
    if(timer==null) {
      timer_type = "ring";
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
      stopTimer(false);
      if(type=="REQUESTED") {
        waitlistChat();
      }
      else {
        missedChat();
      }
    }
  }

  void missedChat() async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "U",
      SessionConstants.reason : "User missed the chat.",
    };

    socket.emit('missed', data);
  }

  void waitlistChat() async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "Astrologer missed the chat and it is shifted to WAITLIST",
    };

    print("waittttlisttttt");
    socket.emit('waitlist', data);
  }

  void manageRating() {
    Get.dialog(
      RatingDialog(
        sessionHistory: sessionHistory,
        astrologer: astrologer,
      ),
      barrierDismissible: true,
    ).then((value) {
      if(value!=null) {
        sessionHistory = value;
        update();
        Essential.showSnackBar("Thank you for your feedback");
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

    await chatProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
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

  void chooseOption(ThemeData theme) {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.all(16),
          // height: 320,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Camera", style: theme.textTheme.bodyText1),
                onTap: () {
                  sendImage(ImageSource.camera);
                  // back();
                },
              ),
              ListTile(
                title: Text("Photo Gallery", style: theme.textTheme.bodyText1),
                onTap: () {
                  sendImage(ImageSource.gallery);
                  // back();
                },
              ),
              ListTile(
                title: Text("Document", style: theme.textTheme.bodyText1),
                onTap: () {
                  sendDocument();
                  // back();
                },
              ),
            ],
          ),
        )
    );
  }

  void sendFile(Map <String, dynamic> data) async {
    late FormData form = FormData(data);

    print(data);

    await chatProvider.send(form, storage.read("access")).then((response) async {
      if(response.code==1) {
        ChatResponseModel chatResponseModel = response;

        Map <String, dynamic> broadcast = chatResponseModel.toJson();
        broadcast.addAll({
          SessionConstants.username : storage.read("access"),
          SessionConstants.sender : "U",
        });

        print("broadcast");
        print(broadcast);
        // socket.emit('broadcast', broadcast);
        socket.emit('broadcastFile', broadcast);
        print("image emiteddd");

        for (int i=0; i<chats.length; i++) {
          if(chats[i].id==chatResponseModel.m_id) {
            chats[i] = chatResponseModel.data!;
            update();
            print(chats[i]);
            break;
          }
        }

        print(chats);

      }
      else {
        for (int i=0; i<chats.length; i++) {
          if(chats[i].id==response.m_id) {
            chats[i] = chats[i].copyWith(error: 1);
            update();
            break;
          }
        }
        Essential.showSnackBar(response.message);
      }
    });
  }


  Future<void> startRecording() async {
    try {
      bool permission = await audioRecorder.hasPermission();
      if (permission) {
        const encoder = r.AudioEncoder.wav;

        // We don't do anything with this but printing
        final isSupported = await audioRecorder.isEncoderSupported(
          encoder,
        );

        debugPrint('${encoder.name} supported: $isSupported');

        final devs = await audioRecorder.listInputDevices();
        debugPrint(devs.toString());

        // const config = RecordConfig(encoder: encoder, numChannels: 1);

        // Record to file
        String path;
        final dir = await getApplicationDocumentsDirectory();
        path = join(
          dir.path,
          '${sessionHistory.id}_audio_${DateTime.now().millisecondsSinceEpoch}.m4a',
        );
        await audioRecorder.start(path: path);

        recordDuration = 0;
        recording = true;
        update();

        startRecordTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<void> stopRecording(bool send) async {
    final path = await audioRecorder.stop();

    if(send) {
      if (path != null) {
        sendVoice(path);
      }
    }
    else {
      print("delete");
      File file = File(path!);
      await file.delete();
    }



    // Simple download code for web testing
    // final anchor = html.document.createElement('a') as html.AnchorElement
    //   ..href = path
    //   ..style.display = 'none'
    //   ..download = 'audio.wav';
    // html.document.body!.children.add(anchor);

    // // download
    // anchor.click();

    // // cleanup
    // html.document.body!.children.remove(anchor);
    // html.Url.revokeObjectUrl(path!);
  }

  Future<void> pause() => audioRecorder.pause();

  Future<void> resume() => audioRecorder.resume();

  void updateRecordState(r.RecordState recordState) {
    this.recordState = recordState;
    update();

    switch (recordState) {
      case r.RecordState.pause:
        recordTimer?.cancel();
        break;
      case r.RecordState.record:
        startRecordTimer();
        break;
      case r.RecordState.stop:
        recordTimer?.cancel();
        recordDuration = 0;
        update();
        break;
    }
  }


  void startRecordTimer() {
    recordTimer?.cancel();

    recordTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      recordDuration++;
      update();
    });
  }

  // Future<void> stop() => audioPlayer.stop();

  String getTime(int seconds) {
    // return "${seconds} secs";
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    String hoursStr = "";
    if(hours>0) {
      hoursStr = hours.toString().padLeft(2, '0')+":";
    }
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr$minutesStr:$secondsStr';
  }


  void disposeObjects() {
    print("disposeeee objectsss");
    timer = null;
    timer_type = null;
    update();
    print(timer);
    try {
      recordTimer?.cancel();
      recordSub?.cancel();
      amplitudeSub?.cancel();
      audioRecorder.dispose();
      // message.dispose();
      try {
        if(player!=null) {
          print("disposeddd it");
          player.dispose();
        }
        else {
          print("disposeddd");
        }
      }
      catch(ex) {
        print("disposeddd erroeee");
      }
      Future.delayed(const Duration(seconds: 3), () {
        socket.close();
        socket.dispose();
      });
    }
    catch(ex) {

    }
  }

  void recordingAction() {
    if(recording) {
      stopRecording(true);
      recording = false;
      update();
    }
    else {
      startRecording();
    }
  }

  void playAudio(String url) {
    print(url);
    try {
      if(url!=playerUrl) {
        player.setUrl(url);
        player.play();
        player.processingStateStream.listen((processingState) {
          print("processingState");
          print(processingState);
          if (processingState == ProcessingState.completed) {
            // player.seek(Duration.zero);
            player.stop();
            update();
            print("completed");
          }
        });
        playerUrl = url;
      }
      else {
        if(player.processingState==ProcessingState.ready) {
          player.play();
        }
        else {
          player.seek(Duration.zero);
          player.play();
        }
      }
      // audioPlayer.play(UrlSource(url));
    }
    catch(ex) {
      print("errorrr");
      print(ex);
    }
    update();
  }

  void pauseAudio() {
    player.pause();
    // playerUrl = "";
    update();
  }
}
