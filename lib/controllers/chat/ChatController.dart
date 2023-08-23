import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:astro_guide/constants/AstrologerConstants.dart';
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
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/repositories/ChatRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:record/record.dart';
import 'package:path/path.dart';

class ChatController extends GetxController {
  ChatController();

  final storage = GetStorage();

  final ChatProvider chatProvider = Get.find();
  ScrollController controller = ScrollController();

  final record = Record();

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
  Timer? timer;
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

  @override
  void onInit() {
    super.onInit();
    cancel = false;
    reject = false;
    load = true;
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
      astrologer = AstrologerModel(id: Get.arguments['astro_id'], name: "", mobile: "", email: "", experience: 0, profile: "", about: "");

    }
    else {
      ch_id = Get.arguments['ch_id'];
      chat_type = Get.arguments['chat_type'];
      sessionHistory = SessionHistoryModel(id: ch_id, sess_id: 0, status: type, rate: 0, commission: 0, type: chat_type, requested_at: DateTime.now().toString(), updated_at: DateTime.now().toString());
      astrologer = Get.arguments['astrologer'];
    }
    start();
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
    socket.on(
      'initiate', (data) async {
        CheckSessionResponseModel checkSessionResponse = CheckSessionResponseModel.fromJson(json.decode(data));

        if(checkSessionResponse.code==1) {
          stopTimer();
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
    }
    );

    socket.on(
      'missed', (data) async {
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      print(response.toJson());

      if(timer!=null) {
        stopTimer();
      }

      if(response.code==1) {
        cnt = 0;
        type = "MISSED";
        update();
        Get.back();
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
        stopTimer();
      }

      print("endSessionResponse.toJson()");
      print(endSessionResponse.toJson());

      if(endSessionResponse.code==1) {
        cnt = 0;
        type = "CANCELLED";
        if(cancel==false) {
          // stopTimer();
          Get.back();
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
        stopTimer();
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

          stopTimer();
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
      print("dataaaaaa");
      print(image.name.substring(image.name.lastIndexOf(".")+1));
      print(image.mimeType);
      int size = await file.length();
      print(size);
      print('${size / 1024} KB');

      sendMessage(data, file.path);
    }
  }

  Future<void> sendDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

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
    message.dispose();
    super.dispose();
  }

  void goto(String page) {
    Get.toNamed(page)?.then((value) {
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
    stopTimer();
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


    socket.emit('cancel', data);
    Get.back();
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
    Get.back();
  }

  void back() {
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
    print(now);
    print(started_at);
    print(duration);
    seconds = duration.inSeconds;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    update();
  }

  void setCountDown() {
    seconds+=1;
    update();
    print(max);
    print(seconds);
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

  void stopTimer() {
    timer!.cancel();
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
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setRing();
    });
    update();
  }

  void setRing() {
    print(ring);
    ring-=1;
    update();
    if(ring<=0) {
      stopTimer();
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


  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      try {
        print(directory);
        await record.start(
          path: '${directory}/myFile.m4a',
          encoder: AudioEncoder.aacLc, // by default
          bitRate: 128000, // by default
          samplingRate: 44100, // by default
        );
      }
      catch (e) {
        print(e);
      }
    }
    else {
      if(await Essential.requestPermission()) {
        startRecording();
      }
      else {
        Essential.showSnackBar("Please allow permissions");
      }
    }
  }

  Future<void> stopRecording() async {
    record.stop();
    print(File('${directory}/myFile.m4a'));
    AudioPlayer audioPlayer = AudioPlayer();
    String filePath = '${directory}/myFile.m4a';
    audioPlayer.setSourceDeviceFile(filePath);
    await audioPlayer.play(DeviceFileSource(filePath));

    Future.delayed(const Duration(seconds: 10), () {
      audioPlayer.stop(); // Prints after 1 second.
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
                  Get.back();
                },
              ),
              ListTile(
                title: Text("Photo Gallery", style: theme.textTheme.bodyText1),
                onTap: () {
                  sendImage(ImageSource.gallery);
                  Get.back();
                },
              ),
              ListTile(
                title: Text("Document", style: theme.textTheme.bodyText1),
                onTap: () {
                  sendDocument();
                  Get.back();
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
        socket.emit('broadcastFile', broadcast);
        print("emiteddd");

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

      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }
}
