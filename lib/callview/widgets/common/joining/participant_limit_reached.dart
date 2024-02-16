import 'package:astro_guide/views/home/call/constants/colors.dart';
import 'package:astro_guide/views/home/call/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videosdk/videosdk.dart';

class ParticipantLimitReached extends StatelessWidget {
  final Room meeting;
   ParticipantLimitReached({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              "OOPS!!",
              style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
             VerticalSpacer(20),
             Text(
              "Maximun 2 participants can join this meeting",
              style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
             VerticalSpacer(10),
             Text(
              "Please try again later",
              style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
             VerticalSpacer(20),
            MaterialButton(
              onPressed: () {
                meeting.leave();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding:  EdgeInsets.symmetric(vertical: 12),
              color: purple,
              child:  Text("Ok", style: GoogleFonts.manrope(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
