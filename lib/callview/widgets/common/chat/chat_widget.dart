import 'package:astro_guide/views/home/call/constants/colors.dart';
import 'package:astro_guide/views/home/call/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:videosdk/videosdk.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWidget extends StatelessWidget {
  final bool isLocalParticipant;
  final PubSubMessage message;
  const ChatWidget(
      {Key? key, required this.isLocalParticipant, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          isLocalParticipant ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: message.message));
          showSnackBarMessage(
              message: "Message has been copied", context: context);
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: black600,
          ),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLocalParticipant ? "You" : message.senderName,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.manrope(
                    color: black400,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.message,
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    DateFormat('h:i a').format(message.timestamp.toLocal()),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.manrope(
                        color: black400,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
