import 'dart:async';
import 'dart:convert';
import 'package:astro_guide/constants/SupportConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/SupportRatingDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/support/SupportChatModel.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/models/support/SupportChatResponseModel.dart';
import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/providers/SupportProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SupportChatController extends GetxController {
  SupportChatController();

  final storage = GetStorage();

  final SupportProvider supportProvider = Get.find();
  ScrollController controller = ScrollController();



  // late SessionHistoryModel sessionHistory;

  List<SupportChatModel> chats = [];

  TextEditingController message = TextEditingController();

  late bool send;
  int id = -1;

  late IO.Socket socket;
  late UserModel user;
  late int sup_id;
  late String status;
  late String action;
  late SupportModel support;

  int cnt = 0;
  late bool load;

  @override
  void onInit() {
    super.onInit();
    load = false;
    send = false;
    sup_id = Get.arguments['sup_id'];
    status = Get.arguments['status'];
    start();
  }

  start() {
    print('start');
    print(status);
    if(status=="ENDED") {
      getSupportChat();
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
            SupportConstants.username : storage.read("access"),
            SupportConstants.sup_id : sup_id,
            SupportConstants.sender : "A",
          }).build(),
    );
    connectSocket();
    getSupportChat();
  }


  Future<void> getSupportChat() async {
    await supportProvider.fetchByID(storage.read("access"), sup_id.toString()).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        chats.addAll(response.data??[]);
        status = response.support?.status??status;
        support = response.support!;
        cnt = 0;
      }
      load = true;
      update();

    });
  }

  // sendMessage() {
  //   socket.emit('message', {
  //     'message': message.text.trim(),
  //     'sender': "user2"
  //   });
  //   message.clear();
  // }

  connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));

    socket.on(
      'support',
          (data) {
        SupportChatResponseModel supportChatResponseModel = SupportChatResponseModel.fromJson(json.decode(data));

        List<SupportChatModel> temp = [
          supportChatResponseModel.data!
        ];
        temp.addAll(chats);
        chats = temp;
        update();
        controller.jumpTo(controller.position.minScrollExtent);
      },
    );

    socket.on(
      'self',
          (data) {
        print(data);
            SupportChatResponseModel supportChatResponseModel = SupportChatResponseModel.fromJson(json.decode(data));


            for (int i=0; i<chats.length; i++) {
              if(chats[i].id==supportChatResponseModel.m_id) {
                if(supportChatResponseModel.code==1) {
                  chats[i] = supportChatResponseModel.data!;
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

    socket.on(
        'end_support', (data) async {
          print(data);
      ResponseModel endChatResponse = ResponseModel.fromJson(json.decode(data));


      if(endChatResponse.code==1) {
        cnt = 0;
        status = "ENDED";
        update();
      }
      else if(endChatResponse.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(endChatResponse.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3) {
              endChat();
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

  }

  Future<void> sendMessage() async {
    Map <String, dynamic> data = {
      SupportConstants.username : storage.read("access"),
      SupportConstants.sup_id : sup_id,
      SupportConstants.sender : SupportConstants.A,
      SupportConstants.message : message.text,
      SupportConstants.m_id : id,
    };
    int temp_id = id;

    List<SupportChatModel> temp = [
      SupportChatModel(id: id--, message: message.text, sender: SupportConstants.A, sent_at: DateTime.now().toString(), sup_id: sup_id)
    ];
    temp.addAll(chats);
    chats = temp;
    message.text = "";
    send = false;
    update();
    controller.jumpTo(controller.position.minScrollExtent);

    socket.emit('support', data);
    message.clear();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  void goto(String page) {
    Get.toNamed(page);
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

  void back() {
    Get.back();
  }

  void endChat() {
    print("hdhdh");
    Map <String, dynamic> data = {
      SupportConstants.username : storage.read("access"),
      SupportConstants.sup_id : sup_id,
      SupportConstants.sender : SupportConstants.A,
    };
    socket.emit('end_support', data);
  }

  void manageRating() {
    Get.dialog(
      SupportRatingDialog(
        support: support,
      ),
      barrierDismissible: true,
    ).then((value) {
      if(value!=null) {
        support = value;
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
      SupportConstants.sup_id : support.id,
      SupportConstants.rating : null,
      SupportConstants.review : null,
    };

    print(data);

    await supportProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
      if(response.code==1) {
        support = support.copyWith(rating: null, review: null, reviewed_at: null);
        update();
        Essential.showSnackBar("Review Deleted");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

}
