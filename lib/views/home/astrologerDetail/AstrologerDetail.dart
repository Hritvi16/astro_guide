import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/gallery/GalleryModel.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/astrologerDetail/AstrologerDetailController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AstrologerDetail extends StatelessWidget {
  AstrologerDetail({ Key? key }){
    astrologerDetailController.onInit();
  }

  final AstrologerDetailController astrologerDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<AstrologerDetailController>(
      builder: (controller) {
        return astrologerDetailController.load ? Scaffold(
          // bottomNavigationBar: getBottomDesign(),
          body : getBody(context),
        ) : LoadingScreen();
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          // color: MyColors.colorAstroBG,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeight,
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Astrologer Profile'.tr, options: getOptions()),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: astrologerDetailController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: MyColors.colorAstroBG,
                            width: MySize.size100(context),
                            child: Image.asset(
                              "assets/backgrounds/astro_bg.png",
                              height: standardAstroBGHeight,
                            ),
                          ),
                          Container(
                            width: MySize.size100(context),
                            padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getBasicDetails(),
                                getWorkAnalysis(context),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getAbout(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getLanguages(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getExpertise(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getReviews(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getRatings(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getLocation(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    thickness: 1.5,
                                    color: MyColors.dividerColor(),
                                  ),
                                ),
                                getSimilarAstrologers(context),
                                SafeArea(
                                  child: SizedBox(
                                    height: astrologerDetailController.show ? 70 : 20,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              astrologerDetailController.goto("/photoView", arguments: [ApiConstants.astrologerUrl+astrologerDetailController.astrologer.profile]);
                            },
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(standardImageRadius),
                                  topRight: Radius.circular(standardImageRadius),
                                  bottomLeft: const Radius.circular(8),
                                  bottomRight: const Radius.circular(8)
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(standardImageRadius),
                                    topRight: Radius.circular(standardImageRadius),
                                    bottomLeft: const Radius.circular(8),
                                    bottomRight: const Radius.circular(8)
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(standardImageRadius),
                                      topRight: Radius.circular(standardImageRadius),
                                      bottomLeft: const Radius.circular(8),
                                      bottomRight: const Radius.circular(8)
                                  ),
                                  child: Image.network(
                                    ApiConstants.astrologerUrl+astrologerDetailController.astrologer.profile,
                                    height: 116,
                                    // height: standardAstroListImageH,
                                    width: 92,
                                    // width: standardAstroImageW,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  astrologerDetailController.manageFollow();
                                },
                                child: Container(
                                  height: 37,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: MyColors.colorBorder
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      20
                                    )
                                  ),
                                  child: Text(
                                    astrologerDetailController.astrologer.follow==0 ? "Follow" : "Following",
                                    style: GoogleFonts.manrope(
                                      fontSize: 12.0,
                                      color: MyColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  astrologerDetailController.manageFavorite();
                                },
                                child: Image.asset(
                                  "assets/common/${astrologerDetailController.astrologer.fav==1 ? "fav" : "not_fav"}.png",
                                  height: 40,
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  width: MySize.size100(context),
                  child: getBottomDesign(context),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getOptions() {
    return Row(
      children: [
        Image.asset(
          "assets/common/share.png",
          height: 22,
        ),
        // const SizedBox(
        //   width: 23,
        // ),
        // Image.asset(
        //   "assets/common/more.png",
        //   height: 18,
        // )
      ],
    );
  }

  Widget getImageDesign(int index, GalleryModel gallery) {
    return GestureDetector(
      onTap: () {
        astrologerDetailController.goto("/photoView", arguments: astrologerDetailController.getImages(index));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          standardAstroMImageRadius
        ),
        child: Image.network(
          ApiConstants.astrologerUrl+gallery.image,
          height: standardAstroMImageH,
          width: standardAstroMImageW,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget getBoxDesign(String info) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: MyColors.colorLightPrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: MyColors.colorButton
          )
      ),
      child: Text(
        info,
        style: GoogleFonts.manrope(
          fontSize: 12.0,
          color: MyColors.black,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget getReviewDesign(ReviewModel review) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              standardAstroReviewRadius
          ),
          border: Border.all(
              color: MyColors.colorBorder
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: MyColors.colorButton,
            child: review.anonymous==1 || (review.user_profile??"").isEmpty ?
            CircleAvatar(
              radius: 24,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "assets/sign_up/profile.png",
                  color: MyColors.black,
                ),
              ),
            )
                : CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(
                  ApiConstants.userUrl+(review.user_profile??"")
              ),
            ),
          ),
          SizedBox(
            width: 12
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          review.user??"",
                          style: GoogleFonts.manrope(
                            fontSize: 18.0,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 2,
                // ),
                showRatings(review.rating, itemSize: 14),
                if((review.review??"").isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      review.review??"",
                      style: GoogleFonts.manrope(
                        fontSize: 14.0,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                if((review.reply??"").isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.colorPrimary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(
                            10
                        ),
                        border: Border.all(
                            color: MyColors.colorButton
                        )
                    ),
                    child: Text(
                      review.reply??"",
                      style: GoogleFonts.manrope(
                        fontSize: 14.0,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getBasicDetails() {
    return Padding(
        padding: const EdgeInsets.only(left: 123),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    astrologerDetailController.astrologer.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if((astrologerDetailController.astrologer.online??0)==1)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "assets/common/online.png",
                          height: 11,
                          width: 11,
                        )
                      ],
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              astrologerDetailController.getTypes(),
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.colorGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: astrologerDetailController.astrologer.experience.toStringAsFixed(1)+" ${'Years'.tr}",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.colorButton,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: " of Exp",
                      style: GoogleFonts.manrope(
                        fontSize: 14.0,
                        color: MyColors.colorGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]
              ),
            ),

          ],
        ),
      );
  }

  Widget getWorkAnalysis(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: standardInfoButton(
                  context: context,
                  backgroundColor: MyColors.colorPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total min chat'.tr,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        ((astrologerDetailController.astrologer.total_chat_sec??0)/60).round().toString(),
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: standardInfoButton(
                  context: context,
                  backgroundColor: MyColors.colorPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total min call'.tr,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        ((astrologerDetailController.astrologer.total_call_sec??0)/60).round().toString(),
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      );
  }

  Widget getAbout() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Astrologer".tr,
            style: GoogleFonts.manrope(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          if(astrologerDetailController.galleries.isNotEmpty)
            getGallery(),
          astrologerDetailController.read ? RichText(
            text: TextSpan(
              text: astrologerDetailController.astrologer.about,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.colorInfoGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
              : Text(
            astrologerDetailController.astrologer.about,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.manrope(
              fontSize: 16.0,
              color: MyColors.colorInfoGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              astrologerDetailController.changeRead();
            },
            child: Text(
              astrologerDetailController.read ? "- ${"Read Less".tr}" : "+ ${"Read More".tr}",
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.colorInfoBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
  }

  Widget getLanguages() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Languages Spoken".tr,
            style: GoogleFonts.manrope(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: standardAstroMInfoH,
            margin: EdgeInsets.only(top: 12),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: astrologerDetailController.languages.length,
                separatorBuilder: (BuildContext buildContext, index) {
                  return SizedBox(
                    width: standardAstroMHorizontalGap,
                  );
                },
                itemBuilder: (BuildContext buildContext, index) {
                  return getBoxDesign(astrologerDetailController.languages[index].lang);
                }
            ),
          ),
        ],
      );
  }

  Widget getExpertise() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Expertise".tr,
            style: GoogleFonts.manrope(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: standardAstroMInfoH,
            margin: EdgeInsets.only(top: 12),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: astrologerDetailController.specifications.length,
                separatorBuilder: (BuildContext buildContext, index) {
                  return SizedBox(
                    width: standardAstroMHorizontalGap,
                  );
                },
                itemBuilder: (BuildContext buildContext, index) {
                  return getBoxDesign(astrologerDetailController.specifications[index].spec);
                }
            ),
          ),
        ],
      );
  }

  Widget getReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  text: "User Reviews".tr,
                  style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: MyColors.labelColor()
                  ),
                  children: [
                    TextSpan(
                      text: " (${astrologerDetailController.reviews.length})",
                      style: GoogleFonts.manrope(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
              ),
            ),
            GestureDetector(
              onTap: () {
                astrologerDetailController.goto("/review", arguments: astrologerDetailController.astrologer);
              },
              child: Text(
                "View All Reviews".tr,
                style: GoogleFonts.manrope(
                  fontSize: 14.0,
                  color: MyColors.colorInfoBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: astrologerDetailController.reviews.length>5 ? 5 : astrologerDetailController.reviews.length,
            padding: EdgeInsets.only(top: 20),
            separatorBuilder: (BuildContext buildContext, index) {
              return SizedBox(
                height: standardAstroMHorizontalGap,
              );
            },
            itemBuilder: (BuildContext buildContext, index) {
              return getReviewDesign(astrologerDetailController.reviews[index]);
            }
        ),
      ],
    );
  }

  Widget getRatings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ratings".tr,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )
        ),
        Container(
          height: standardRatingBoxHeight,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: getRatingBox(),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: getRatingChart(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location".tr,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )
        ),
        Container(
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.colorGrey,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/sign_up/location.png",
                height: 18,
                color: MyColors.colorLocation,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${(astrologerDetailController.astrologer.state ?? "").toTitleCase()}, ${(astrologerDetailController.astrologer.country ?? "").toTitleCase()}",
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getRatingBox() {
    return Container(
      height: standardRatingBoxHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.colorGrey,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              astrologerDetailController.getAvgRating().toStringAsFixed(2),
              style: GoogleFonts.manrope(
                fontSize: 32.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
            showRatings(astrologerDetailController.getAvgRating(), itemSize: 16),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/sign_up/profile.png",
                  height: 16,
                  color: MyColors.colorButton,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${astrologerDetailController.reviews.length} ${'Reviews'.tr}",
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    letterSpacing: 0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getRatingChart() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getRating(5, MyColors.colorSuccess, astrologerDetailController.rating.rating5),
          getRating(4, MyColors.colorSuccess, astrologerDetailController.rating.rating4),
          getRating(3, MyColors.colorSuccess, astrologerDetailController.rating.rating3),
          getRating(2, MyColors.colorButton, astrologerDetailController.rating.rating2),
          getRating(1, MyColors.colorError, astrologerDetailController.rating.rating1)
        ],
      ),
    );
  }

  Widget getRating(int star, Color progressColor, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 10,
          child: Text(
            star.toString().tr,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: LinearPercentIndicator(
            lineHeight: 12.0,
            percent: astrologerDetailController.getPercentage(total),
            backgroundColor: MyColors.dividerColor(),
            progressColor: progressColor,
            barRadius: Radius.circular(10),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              total.toString().tr,
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getGallery() {
    return Container(
      height: standardAstroMImageH,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: astrologerDetailController.galleries.length,
          separatorBuilder: (BuildContext buildContext, index) {
            return SizedBox(
              width: standardHorizontalGap,
            );
          },
          itemBuilder: (BuildContext buildContext, index) {
            return getImageDesign(index, astrologerDetailController.galleries[index]);
          }
      ),
    );
  }

  Widget getSimilarAstrologers(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Similar Astrologers".tr,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "View all".tr,
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.colorInfoBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            height: standardListCardHeight,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: astrologerDetailController.similar.length,
                separatorBuilder: (BuildContext buildContext, index) {
                  return SizedBox(
                    width: standardHorizontalGap,
                  );
                },
                itemBuilder: (BuildContext buildContext, index) {
                  return getAstrologerDesign(index, astrologerDetailController.similar[index], context);
                }
            ),
          ),
        ),
      ],
    );
  }


  Widget getAstrologerDesign(int index, AstrologerModel astrologer, BuildContext context) {
    int rate = 0;
    return GestureDetector(
      onTap: () {
        astrologerDetailController.goto("/astrologerDetail", arguments: astrologer.id.toString());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: standardListCardHeight,
        width: MySize.size100(context) - (standardHorizontalPagePadding * 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.colorGrey,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            getLeftSection(astrologer),
            SizedBox(
              width: 8,
            ),
            getRightSection(index, astrologer),
          ],
        ),
      ),
    );
  }

  Widget getRatingDesign(double rating) {
    return Center(
      child: RatingBar.builder(
        initialRating: rating,
        direction: Axis.horizontal,
        unratedColor: MyColors.colorUnrated,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
        ignoreGestures: true,
        itemSize: 12,
        itemBuilder: (context, _) => Image.asset(
          "assets/common/star.png",
          color: MyColors.colorButton,
        ),
        onRatingUpdate: (rating) {
        },
      ),
    );
  }

  getLeftSection(AstrologerModel astrologer) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: MyColors.colorButton,
            width: 2
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardImageRadius),
            topRight: Radius.circular(standardImageRadius)
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(standardImageRadius),
                topRight: Radius.circular(standardImageRadius)
            ),
            child: Image.network(
              ApiConstants.astrologerUrl+astrologer.profile,
              height: 130,
              // height: standardAstroListImageH,
              width: standardAstroListImageW,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: standardAstroImageShadowH,
              width: standardAstroListImageW,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0, 2)
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            height: standardAstroImageShadowH,
            width: standardAstroListImageW,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: standardAstroListImageW,
                    height: 13,
                    padding: EdgeInsets.symmetric(horizontal: 10,),
                    child: getRatingDesign(astrologer.rating??0),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${'Reviews'.tr}: ${astrologer.total_rating??0}',
                    style: GoogleFonts.manrope(
                      fontSize: 12.0,
                      color: MyColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  getRightSection(int index, AstrologerModel astrologer) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            astrologer.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if(astrologer.online==1)
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/common/online.png",
                                height: 11,
                                width: 11,
                              )
                            ],
                          )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      astrologer.types??"-",
                      // "Vedic Astrologer",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.colorGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  astrologerDetailController.manageFavorite(index: index);
                },
                child: Image.asset(
                  "assets/common/${astrologer.fav==1 ? "fav" : "not_fav"}.png",
                  height: 40,
                  width: 40,
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                "assets/common/lang.png",
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                astrologer.languages??"-",
                style: GoogleFonts.manrope(
                  fontSize: 12.0,
                  color: MyColors.colorGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
          SizedBox(
            height: 16,
          ),
          getNewBottom(astrologer)
        ],
      ),
    );
  }

  getNewBottom(AstrologerModel astrologer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              if(astrologer.online==1) {
                double min = Essential.getCalculatedAmount(
                    astrologer.p_call ?? 0, minutes: 5);
                if ((astrologerDetailController.free && astrologer.free == 1) ||
                    (astrologerDetailController.wallet >= min)) {
                  astrologerDetailController.goto("/checkSession", arguments: {
                    "astrologer": astrologer,
                    "free": astrologerDetailController.free &&
                        astrologer.free == 1,
                    "controller": astrologerDetailController,
                    "category": "CALL"
                  });
                }
                else {
                  Essential.showBasicDialog(
                      "You must have minimum of ${CommonConstants.rupee}${min
                          .ceil()} balance in your wallet. Do you want to recharge?",
                      "Recharge Now", "No, Thanks").then((value) {
                    if (value == "Recharge Now") {
                      astrologerDetailController.goto("/wallet");
                    }
                  });
                }
              }
              else {
                Essential.showInfoDialog("${astrologer.name} is currently offline." , btn: "OK");
              }
              // astrologerDetailController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
            },
            child: Container(
                alignment: Alignment.center,
                height: standardShortButtonHeight,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: MyColors.colorSuccess.withOpacity(0.3),
                    border: Border.all(
                        color: MyColors.colorSuccess
                    ),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/dashboard/call_filled.png",
                      height: 16,
                      color: MyColors.colorSuccess,
                    ),
                    Flexible(
                      child: Text(
                        astrologerDetailController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: astrologerDetailController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              if(astrologer.online==1) {
                double min = Essential.getCalculatedAmount(
                    astrologer.p_chat ?? 0, minutes: 5);
                if ((astrologerDetailController.free && astrologer.free == 1) ||
                    (astrologerDetailController.wallet >= min)) {
                  astrologerDetailController.goto("/checkSession", arguments: {
                    "astrologer": astrologer,
                    "free": astrologerDetailController.free &&
                        astrologer.free == 1,
                    "controller": astrologerDetailController,
                    "category": "CHAT"
                  });
                }
                else {
                  Essential.showBasicDialog(
                      "You must have minimum of ${CommonConstants.rupee}${min
                          .ceil()} balance in your wallet. Do you want to recharge?",
                      "Recharge Now", "No, Thanks").then((value) {
                    if (value == "Recharge Now") {
                      astrologerDetailController.goto("/wallet");
                    }
                  });
                }
              }
              else {
                Essential.showInfoDialog("${astrologer.name} is currently offline." , btn: "OK");
              }
            },
            child: Container(
                alignment: Alignment.center,
                height: standardShortButtonHeight,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: MyColors.colorChat.withOpacity(0.3),
                    border: Border.all(
                        color: MyColors.colorChat
                    ),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/dashboard/chat_filled.png",
                      height: 16,
                      color: MyColors.colorChat,
                    ),
                    Flexible(
                      child: Text(
                        astrologerDetailController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: astrologerDetailController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }

  Widget showRatings(double rating, {double? itemSize}) {
    return RatingBar.builder(
      initialRating: rating??0,
      allowHalfRating: true,
      direction: Axis.horizontal,
      itemCount: 5,
      unratedColor: MyColors.colorUnrated,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      ignoreGestures: true,
      itemSize: itemSize??16,
      itemBuilder: (context, _) => Image.asset(
        "assets/common/star.png",
        color: MyColors.colorButton,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }

  Widget getBottomDesign(BuildContext context) {
    return astrologerDetailController.show ?
    getBottom(context)
    : GestureDetector(
      onTap: () {
        astrologerDetailController.changeShow();
      },
      child: Container(
        color: MyColors.backgroundColor(),
        child: SafeArea(
          top: false,
          child: Image.asset(
            "assets/common/chat_call_box.png",
            height: 80,
          ),
        ),
      ),
    );
  }


  getBottom(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyColors.backgroundColor(),
          margin: EdgeInsets.only(top: 30),
          width: MySize.size100(context),
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                astrologerDetailController.changeShow();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: MyColors.colorIconBG,
                child: Image.asset(
                  "assets/common/close.png",
                  height: 16,
                  color: MyColors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            child: getButtons(context)
        ),
      ],
    );
  }

  Widget getButtons(BuildContext context) {
    return Container(
      width: MySize.size100(context),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                if(astrologerDetailController.astrologer.online==1) {
                  double min = Essential.getCalculatedAmount(
                      astrologerDetailController.astrologer.p_call ?? 0,
                      minutes: 5);
                  if ((astrologerDetailController.free &&
                      astrologerDetailController.astrologer.free == 1) ||
                      (astrologerDetailController.wallet >= min)) {
                    astrologerDetailController.goto(
                        "/checkSession", arguments: {
                      "astrologer": astrologerDetailController.astrologer,
                      "free": astrologerDetailController.free &&
                          astrologerDetailController.astrologer.free == 1,
                      "controller": astrologerDetailController,
                      "category": "CALL"
                    });
                  }
                  else {
                    Essential.showBasicDialog(
                        "You must have minimum of ${CommonConstants.rupee}${min
                            .ceil()} balance in your wallet. Do you want to recharge?",
                        "Recharge Now", "No, Thanks").then((value) {
                      if (value == "Recharge Now") {
                        astrologerDetailController.goto("/wallet");
                      }
                    });
                  }
                }
                else {
                  Essential.showInfoDialog("${astrologerDetailController.astrologer.name} is currently offline." , btn: "OK");
                }
                // astrologerDetailController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
              },
              child: Container(
                  alignment: Alignment.center,
                  height: standardLongButtonHeight,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: MyColors.colorSuccess,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/dashboard/call_filled.png",
                            height: 20,
                            color: MyColors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Call",
                            style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.white,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          astrologerDetailController.free && astrologerDetailController.astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologerDetailController.astrologer.p_call}/${'min'.tr}",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.manrope(
                            fontSize: 14.0,
                            color: MyColors.white,
                            fontWeight: astrologerDetailController.free && astrologerDetailController.astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                if(astrologerDetailController.astrologer.online==1) {
                  double min = Essential.getCalculatedAmount(
                      astrologerDetailController.astrologer.p_chat ?? 0,
                      minutes: 5);
                  if ((astrologerDetailController.free &&
                      astrologerDetailController.astrologer.free == 1) ||
                      (astrologerDetailController.wallet >= min)) {
                    astrologerDetailController.goto(
                        "/checkSession", arguments: {
                      "astrologer": astrologerDetailController.astrologer,
                      "free": astrologerDetailController.free &&
                          astrologerDetailController.astrologer.free == 1,
                      "controller": astrologerDetailController,
                      "category": "CHAT"
                    });
                  }
                  else {
                    Essential.showBasicDialog(
                        "You must have minimum of ${CommonConstants.rupee}${min
                            .ceil()} balance in your wallet. Do you want to recharge?",
                        "Recharge Now", "No, Thanks").then((value) {
                      if (value == "Recharge Now") {
                        astrologerDetailController.goto("/wallet");
                      }
                    });
                  }
                }
                else {
                  Essential.showInfoDialog("${astrologerDetailController.astrologer.name} is currently offline." , btn: "OK");
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  height: standardLongButtonHeight,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: MyColors.colorChat,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/dashboard/chat_filled.png",
                            height: 20,
                            color: MyColors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Chat",
                            style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.white,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          astrologerDetailController.free && astrologerDetailController.astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologerDetailController.astrologer.p_chat}/${'min'.tr}",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.manrope(
                            fontSize: 14.0,
                            color: MyColors.white,
                            fontWeight: astrologerDetailController.free && astrologerDetailController.astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }


}