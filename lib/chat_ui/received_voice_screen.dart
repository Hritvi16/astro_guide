import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';


class ReceivedVoiceScreen extends StatelessWidget {
  final ChatModel chat;
  final dynamic play, pause;
  final AudioPlayer player;
  final String playerUrl;
  const ReceivedVoiceScreen({super.key, required this.chat, this.play, this.pause, required this.player, required this.playerUrl});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 18, top: 15, bottom: 5),
      child: getMessageTextGroup(context),
    );
  }

  Widget getMessageTextGroup(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: MyColors.receiverColor(),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player.playing && playerUrl==ApiConstants.chatUrl+chat.message  ?
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
                    play(ApiConstants.chatUrl+chat.message);
                  },
                  child: Icon(
                      Icons.play_arrow
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    Essential.getDateTime(chat.sent_at),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      color: MyColors.colorInfo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}