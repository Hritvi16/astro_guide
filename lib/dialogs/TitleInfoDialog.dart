import 'package:astro_guide/essential/Essential.dart';
import 'package:flutter/material.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleInfoDialog extends StatelessWidget {
  final String title, text, btn;

  const TitleInfoDialog({Key? key, required this.title, required this.text, required this.btn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: Essential.getPlatform() ?
          const DecorationImage(
              image: AssetImage(
                  "assets/essential/bg.png"
              ),
            fit: BoxFit.fitWidth
          ) : null,
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context, btn);
                },
                style: TextButton.styleFrom(
                  backgroundColor: MyColors.colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                  alignment: Alignment.center,
                  width: 80,
                  child: Text(
                    btn,
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}