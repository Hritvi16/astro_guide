import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Testimonial extends StatelessWidget {
  Testimonial({ Key? key }) : super(key: key);

  final TestimonialController testimonialController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<TestimonialController>(
      builder: (controller) {
        return testimonialController.load ?
        Scaffold(
          backgroundColor: MyColors.colorBG,
          body: getBody(context),
        )
        : LoadingScreen();
      },
    );
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getImageDesign(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitleDesign(),
                getWriterDesign(),
                Divider(
                  thickness: 1,
                  color: MyColors.black,
                ),
                getDescriptionDesign(),
              ],
            ),
          )
        ],
      ),
    );
  }

  getImageDesign(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MySize.sizeh35(context),
          width: MySize.size100(context),
          padding: EdgeInsets.symmetric(vertical: MySize.sizeh7(context), horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: (testimonialController.testimonial.id)%2==0 ? MyColors.colorBlueBG : MyColors.colorLightPrimary,
          ),
          child: Stack(
            children: [
              Image.asset(
                "assets/astrology/galaxy.png",
                fit: BoxFit.fitHeight,
                color: (testimonialController.testimonial.id)%2==0 ? MyColors.colorBlueBG : MyColors.colorLightPrimary,
              ),
                Positioned(
                  top: MySize.sizeh5_3(context),
                  left: MySize.sizeh4_7(context),
                  child: (testimonialController.testimonial.profile??"").isEmpty ?
                    CircleAvatar(
                      radius: MySize.sizeh5_5(context),
                      child: Icon(
                        Icons.person,
                        color: (testimonialController.testimonial.id)%2==0 ? MyColors.colorBlueBorder : MyColors.colorButton,
                        size: 50,
                      ),
                      backgroundColor: (testimonialController.testimonial.id)%2==0 ? MyColors.colorBlueBG : MyColors.colorLightPrimary,
                    )
                    : CircleAvatar(
                    radius: MySize.sizeh5_5(context),
                    backgroundImage: NetworkImage(
                        ApiConstants.userUrl+testimonialController.testimonial.profile!
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: MySize.sizeh5(context),
          left: MySize.size5(context),
          child: InkWell(
            onTap: () {
              print("hhl");
              Essential.back();
            },
            child: Image.asset(
              "assets/controls/arrow_previous.png",
              color: MyColors.black,
              height: standardBackPressButtonHeight,
              width: standardBackPressButtonWidth,
            ),
          ),
        )
      ],
    );
  }

  getTitleDesign() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        testimonialController.testimonial.name,
        style: GoogleFonts.playfairDisplay(
          fontSize: 26.0,
          color: MyColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  getWriterDesign() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ("${testimonialController.testimonial.state}, ${testimonialController.testimonial.country}").toTitleCase(),
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: MyColors.black,
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            Essential.getDate(testimonialController.testimonial.created_at),
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: MyColors.black,
            ),
          ),
        ],
      ),
    );
  }

  getDescriptionDesign() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        testimonialController.testimonial.description,
        style: GoogleFonts.manrope(
          fontSize: 14.0,
          color: MyColors.black,
        ),
      ),
    );
  }
}
