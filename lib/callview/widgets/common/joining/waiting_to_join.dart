import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/views/home/call/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitingToJoin extends StatelessWidget {
  final String name, image;
  final String type, action;
  final dynamic cancel, accept, reject, back;
  const WaitingToJoin(this.name, this.image,this.cancel, this.type,  this.action, this.accept,  this.reject, this.back,  {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Container(
        width: MySize.size100(context),
        padding: EdgeInsets.only(top: MySize.sizeh15(context), bottom: MySize.sizeh5(context)),
        decoration: BoxDecoration(
          image: Essential.getPlatform() ?
            DecorationImage(
              image: AssetImage("assets/essential/bg.png")
            ) : null
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    ApiConstants.astrologerUrl+image
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(name,
                  style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    color: MyColors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            type=="WAITLISTED" || type=="REJECTED" ?
            displayMessage(type=="WAITLISTED" ? "You have been added to waitlist" : "$name rejected your call request")
                : type=="REQUESTED" ?
            Column(
              children: [
                Text("Connecting...",
                  style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    print("hdh");
                    cancel();
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: MyColors.colorError,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: MyColors.colorError,
                      child: Image.asset(
                          "assets/call/end.png"
                      ),
                    ),
                  ),
                )
              ],
            )
                : Column(
              children: [
                Text("Incoming Call Request",
                  style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("hdh");
                        accept();
                        // retry();
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: MyColors.colorSuccess,
                        child: Image.asset(
                          "assets/call/accept.png",
                          height: 26,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("hdh");
                        reject();
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: MyColors.colorError,
                        child: Image.asset(
                          "assets/call/end.png",
                          height: 35,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget displayMessage(message) {
    return Column(
      children: [
        Text(message,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            color: MyColors.black,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
                color: MyColors.colorButton,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
              "OK",
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.white,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
