import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/review/ReviewController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class Review extends StatelessWidget {
  Review({ Key? key }) : super(key: key);

  final ReviewController reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ReviewController>(
      builder: (controller) {
        return reviewController.load ?
        Scaffold(
          body: getBody(context),
        )
            : LoadingScreen();
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeight,
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Rating and Reviews'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: reviewController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getRatings(),
                  reviewController.reviews.isNotEmpty ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                    itemCount: reviewController.reviews.length,
                    // itemCount: reviewController.reviews.length,
                    separatorBuilder: (buildContext, index) {
                      return SizedBox(
                        height: standardVerticalGap,
                      );
                    },
                    itemBuilder: (buildContext, index) {
                      return getReviewDesign(reviewController.reviews[index]);
                    },
                  ) : Container(
                    height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Astrologer have not been rated or reviewed by any user!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget getRatings() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 4),
      child: Column(
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
      ),
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
              reviewController.getAvgRating().toStringAsFixed(2),
              style: GoogleFonts.manrope(
                fontSize: 32.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
            showRatings(reviewController.getAvgRating(), itemSize: 16),
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
                  "${reviewController.reviews.length} ${'Reviews'.tr}",
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
          getRating(5, MyColors.colorSuccess, reviewController.rating.rating5),
          getRating(4, MyColors.colorSuccess, reviewController.rating.rating4),
          getRating(3, MyColors.colorSuccess, reviewController.rating.rating3),
          getRating(2, MyColors.colorButton, reviewController.rating.rating2),
          getRating(1, MyColors.colorError, reviewController.rating.rating1)
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
            percent: reviewController.getPercentage(total),
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
                          review.anonymous==1 ? "Anonymous" : review.user??"",
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

  Widget showRatings(double rating, {double? itemSize}) {
    return RatingBar.builder(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
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
}

