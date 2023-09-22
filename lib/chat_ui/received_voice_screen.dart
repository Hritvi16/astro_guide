import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';


class ReceivedVoiceScreen extends StatefulWidget {
  final ChatModel chat;
  const ReceivedVoiceScreen({
    Key? key, required this.chat,
  }) : super(key: key);

  @override
  State<ReceivedVoiceScreen> createState() => _ReceivedVoiceScreenState();
}

class _ReceivedVoiceScreenState extends State<ReceivedVoiceScreen> {
  late ChatModel chat;

  final player = AudioPlayer();
  late Duration duration;


  @override
  void initState() {
    super.initState();
    chat = widget.chat;
    start();
  }

  Future<void> start() async {
    duration = await player.setUrl(ApiConstants.chatUrl+chat.message) ?? Duration();

    player.durationStream.listen((duration) {
      // Update UI with total audio duration
      print('Total Duration: $duration');
    });

    player.processingStateStream.listen((processingState) {
      if (processingState == ProcessingState.completed) {
        player.seek(Duration.zero);
        player.pause();
        setState(() {

        });
        print("completed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 18, top: 15, bottom: 5),
      child: getMessageTextGroup(context),
    );
  }

  getMessageTextGroup(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              // color: MyColors.receiverColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player.playing ?
                GestureDetector(
                  onTap: () async {
                    player.pause();
                    setState(() {

                    });
                  },
                  child: Icon(
                      Icons.pause
                  ),
                )
                    : GestureDetector(
                  onTap: () async {
                    player.play();
                    setState(() {

                    });
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
                    style: TextStyle(
                      fontSize: 10,
                      // color: MyColors.colorInfo,
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

