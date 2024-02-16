import 'package:astro_guide/chat_ui/CustomShape.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/models/support/SupportChatModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class SReceivedMessageScreen extends StatelessWidget {
  final SupportChatModel chat;
  const SReceivedMessageScreen({
    Key? key, required this.chat,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 18, top: 15, bottom: 5),
      child: getMessageTextGroup(),
    );
  }

  getMessageTextGroup() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
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
                RichText(
                  text: TextSpan(
                    text: chat.message,
                    style: GoogleFonts.manrope(color: MyColors.labelColor(), fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat("dd MMM, yyyy  hh:mm a").format(DateTime.parse(chat.sent_at)),
                  textAlign: TextAlign.right,
                  style: GoogleFonts.manrope(
                      fontSize: 10,
                    color: MyColors.colorInfo,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getMessageTextGroup1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: CustomShape(Colors.grey[300]!),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: chat.message,
                    style: GoogleFonts.manrope(color: Colors.black, fontSize: 14),
                  ),
                ),
                // Text(
                //   chat.message,
                //   style: GoogleFonts.manrope(color: Colors.black, fontSize: 14),
                // ),
                SizedBox(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateFormat("dd MMM, yyyy  hh:mm a").format(DateTime.parse(chat.sent_at)),
                    style: GoogleFonts.manrope(
                        fontSize: 10
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
