import 'dart:io';

import 'package:astro_guide/controllers/rating/RatingController.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/MySize.dart';


class RatingDialog extends StatelessWidget {

  RatingDialog({Key? key, required SessionHistoryModel sessionHistory, required AstrologerModel astrologer}) {
    ratingController.sessionHistory = sessionHistory;
    ratingController.astrologer = astrologer;
    ratingController.review = TextEditingController(text: sessionHistory.review??"");
  }

  final RatingController ratingController = Get.put<RatingController>(RatingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatingController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        ratingController.back();
                      },
                      child: Image.asset(
                        "assets/common/close.png",
                        color: MyColors.colorInfoGrey,
                        height: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    ratingController.sessionHistory.astrologer??"",
                    style: GoogleFonts.manrope(
                        fontSize: 16,
                        color: MyColors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: MyColors.colorButton,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          ApiConstants.astrologerUrl+ratingController.astrologer.profile
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: MyColors.colorButton,
                        child: ratingController.sessionHistory.anonymous==1 || (ratingController.sessionHistory.user_profile??"").isEmpty ?
                        CircleAvatar(
                          radius: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              "assets/sign_up/profile.png",
                              color: MyColors.black,
                            ),
                          ),
                        )
                        : CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            ApiConstants.userUrl+(ratingController.sessionHistory.user_profile??"")
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0, bottom: 5),
                                  child: Text(
                                    ratingController.sessionHistory.anonymous==1 ? "Anonymous" : ratingController.sessionHistory.user??"",
                                    style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        color: MyColors.black,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "Reviews are public if you are not anonymous",
                                  style: GoogleFonts.manrope(
                                    fontSize: 10,
                                    color: MyColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: (ratingController.sessionHistory.anonymous??0)==1,
                                onChanged: (value) {
                                  ratingController.changeAnonymous(value==true ? 1 : 0);
                                },
                              ),
                              Text(
                                "Hide my name from all public reviews",
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: MyColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ratingBar(),
                  standardTFLabel(text: 'Review', optional: '\t(Optional)', optionalFontSize: 11,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      style: GoogleFonts.manrope(
                        fontSize: 16.0,
                        color: MyColors.black,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: ratingController.review,
                      maxLength: 300,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.colorButton,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "Describe your experience",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(ratingController.validate()) {
                        ratingController.manageRating();
                      }
                    },
                    child: standardButton(
                      context: context,
                      height: 40,
                      backgroundColor: ratingController.validate() ? MyColors.colorButton : MyColors.colorLightExpired,
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SUBMIT',
                            style: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: ratingController.validate() ? MyColors.white : MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget ratingBar() {
    return RatingBar.builder(
      initialRating: ratingController.sessionHistory.rating??0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
      itemSize: 30,
      itemBuilder: (context, index) => Image.asset(
        "assets/common/star.png",
        color: MyColors.colorButton,
      ),
      onRatingUpdate: (rating) {
        ratingController.updateRating(rating);
      },
    );
  }

}
