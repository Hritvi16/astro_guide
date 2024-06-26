import 'package:flutter/material.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:google_fonts/google_fonts.dart';


class InfoDialog extends StatelessWidget {
  final String text, btn;
  const InfoDialog({Key? key, required this.text, required this.btn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 10, top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
              style: GoogleFonts.manrope(
                  fontSize: 16
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, btn);
                  },
                  child: Text(btn,
                    style: GoogleFonts.manrope(
                        color: MyColors.colorPrimary
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
