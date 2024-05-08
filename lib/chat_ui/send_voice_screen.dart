import 'dart:io';
import 'package:astro_guide/chat_ui/CustomShape.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class SentVoiceScreen extends StatelessWidget {
  final Color color;
  final ChatModel chat;
  final dynamic play, pause;
  final AudioPlayer player;
  final String playerUrl;
  const SentVoiceScreen({super.key, required this.color, required this.chat, this.play, this.pause, required this.player, required this.playerUrl});

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
                    getSeenStatus()<0 ?
                    Icon(
                        Icons.upload
                    )
                        : player.playing && playerUrl==ApiConstants.chatUrl+chat.message ?
                    GestureDetector(
                      onTap: () async {
                        pause();
                      },
                      child: Icon(
                          Icons.pause
                      ),
                    )
                        : (player.processingState==ProcessingState.loading || player.processingState==ProcessingState.buffering) && playerUrl==ApiConstants.chatUrl+chat.message ?
                        Container(
                            width: 20.0,
                            height: 20.0,
                            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                            child: CircularProgressIndicator(color: MyColors.colorPrimary,strokeWidth: 3,)
                        )
                        : GestureDetector(
                      onTap: () async {
                        // player.play();
                        // setState(() {
                        //
                        // });
                        play(ApiConstants.chatUrl+chat.message);
                      },
                      child: Icon(
                          Icons.play_arrow
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
                          style: GoogleFonts.manrope(
                              fontSize: 10,
                              color: MyColors.colorInfo
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
}

