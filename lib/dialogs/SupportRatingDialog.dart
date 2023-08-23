import 'package:astro_guide/controllers/rating/SupportRatingController.dart';
import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro_guide/colors/MyColors.dart';


class SupportRatingDialog extends StatelessWidget {

  SupportRatingDialog({Key? key, required SupportModel support}) {
    supportRatingController.support = support;
    supportRatingController.review = TextEditingController(text: support.review??"");
  }

  final SupportRatingController supportRatingController = Get.put<SupportRatingController>(SupportRatingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportRatingController>(
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
                        supportRatingController.back();
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "Ticket No.: ",
                        style: GoogleFonts.manrope(
                            fontSize: 18,
                            color: MyColors.black,
                            fontWeight: FontWeight.w500
                        ),
                        children: [
                          TextSpan(
                            text: "#${supportRatingController.support.id}",
                            style: GoogleFonts.manrope(
                                fontSize: 18,
                                color: MyColors.black,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ratingBar(),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: standardTFLabel(text: 'Review', optional: '\t(Optional)', optionalFontSize: 11,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      style: GoogleFonts.manrope(
                        fontSize: 16.0,
                        color: MyColors.black,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: supportRatingController.review,
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
                      if(supportRatingController.validate()) {
                        supportRatingController.manageRating();
                      }
                    },
                    child: standardButton(
                      context: context,
                      height: 40,
                      backgroundColor: supportRatingController.validate() ? MyColors.colorButton : MyColors.colorLightExpired,
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SUBMIT',
                            style: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: supportRatingController.validate() ? MyColors.white : MyColors.black,
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
      initialRating: supportRatingController.support.rating??0,
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
        supportRatingController.updateRating(rating);
      },
    );
  }

}
