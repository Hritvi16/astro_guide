import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/blog/BlogController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Blog extends StatelessWidget {
  Blog({ Key? key }) : super(key: key);

  final BlogController blogController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<BlogController>(
      builder: (controller) {
        return blogController.load ?
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
          height: MySize.sizeh40(context),
          width: MySize.size100(context),
          child: Image.network(
            ApiConstants.blogUrl+blogController.blog.image,
            fit: BoxFit.fill,
            height: standardBlogImageHeight,
            width: standardBlogWidth,
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
              color: MyColors.white,
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
        blogController.blog.title,
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
          RichText(
            text: TextSpan(
              text: "${"Written by".tr} ",
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.black,
              ),
              children: [
                TextSpan(
                  text: blogController.blog.name,
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]
            ),
          ),
          Text(
            Essential.getDate(blogController.blog.created_at),
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
        blogController.blog.description,
        style: GoogleFonts.manrope(
          fontSize: 14.0,
          color: MyColors.black,
        ),
      ),
    );
  }
}
