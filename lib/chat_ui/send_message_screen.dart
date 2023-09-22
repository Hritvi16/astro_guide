import 'package:astro_guide/chat_ui/CustomShape.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SentMessageScreen extends StatelessWidget {
  final Color color;
  final ChatModel chat;
  const SentMessageScreen({
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
          getMessageTextGroup(),
        ],
      ),
    );
  }

  getMessageTextGroup() {
    return Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(8),
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
                    Text(
                      chat.message,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: color, fontSize: 14),
                    ),
                    SizedBox(
                      height: 2,
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
                          getSeenStatus()==-2 ? Icons.error_outline : getSeenStatus()==-1? Icons.timelapse : getSeenStatus()==0 ? Icons.done : Icons.done_all,
                          color: getSeenStatus()==-2 ? MyColors.colorError :getSeenStatus()==2 ? MyColors.colorChat : MyColors.colorGrey,
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
}
