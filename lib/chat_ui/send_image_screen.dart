import 'dart:io';

import 'package:astro_guide/chat_ui/CustomShape.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SendImageScreen extends StatelessWidget {
  final Color color;
  final ChatModel chat;
  const SendImageScreen({
    Key? key, required this.chat, required this.color,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 50, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          getMessageTextGroup(context),
        ],
      ),
    );
  }

  getMessageTextGroup(BuildContext context) {
    return Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: MyColors.colorLightPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: getSeenStatus()>=0 ?
                      GestureDetector(
                        onTap: () {
                          goto("/photoView", arguments: [ApiConstants.chatUrl+chat.message]);
                        },
                        child: Image.network(
                          ApiConstants.chatUrl+chat.message,
                          height: MySize.size65(context),
                          width: MySize.size50(context),
                          fit: BoxFit.fill,
                          errorBuilder: (context, object, stackTrace) {
                            return GestureDetector(
                              onTap: () {
                              },
                              child: SizedBox(
                                height: MySize.size65(context),
                                width: MySize.size50(context),
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      : GestureDetector(
                        onTap: () {
                          goto("/photoView", arguments: [chat.message]);
                        },
                        child: Image.file(
                          File(chat.message),
                          height: MySize.size65(context),
                          width: MySize.size50(context),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Essential.getDateTime(chat.sent_at),
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          getSeenStatus()==-2 ? Icons.error_outline : getSeenStatus()==-1 ? Icons.timelapse : getSeenStatus()==0 ? Icons.done : Icons.done_all,
                          color: getSeenStatus()==-2 ? MyColors.colorError : getSeenStatus()==2 ? MyColors.colorChat : MyColors.colorGrey,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomPaint(painter: CustomShape(MyColors.colorLightPrimary)),
          ],
        ));
  }

  Color getColor() {
    return chat.type=='A' ? MyColors.red :MyColors.black;
  }

  int getSeenStatus() {
    if(chat.seen_at!=null) {
      return 2;
    }
    else if(chat.received_at!=null) {
      return 1;
    }
    else {
      if(chat.id<0) {
        return chat.error==1 ? -2 : -1;
      }
      return 0;
    }
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
    });
  }
}
