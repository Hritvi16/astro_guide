import 'package:astro_guide/essential/Essential.dart';
import 'package:flutter/material.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:google_fonts/google_fonts.dart';

class IconConfirmDialog extends StatelessWidget {
  final String title, text, btn1, btn2;
  final IconData icon1, icon2;

  const IconConfirmDialog({Key? key, required this.title, required this.text, required this.btn1, required this.btn2, required this.icon1, required this.icon2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
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
            // const SizedBox(height: 10),
            // Text(
            //   text,
            //   style: GoogleFonts.manrope(
            //     fontSize: 14,
            //     color: Colors.black87,
            //   ),
            // ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, btn1);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: MyColors.colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icon1,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          btn1,
                          style: GoogleFonts.manrope(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, btn2);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: MyColors.colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icon2,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          btn2,
                          style: GoogleFonts.manrope(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}