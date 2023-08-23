import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/wishlist/WishlistController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Wishlist extends StatelessWidget {
  Wishlist({ Key? key }) : super(key: key);

  final WishlistController wishlistController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<WishlistController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          body: getBody(context),
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Wishlist'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: wishlistController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: wishlistController.astrologers.isNotEmpty ? SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child:
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                itemCount: wishlistController.astrologers.length,
                separatorBuilder: (buildContext, index) {
                  return SizedBox(
                    height: standardVerticalGap,
                  );
                },
                itemBuilder: (buildContext, index) {
                  return getAstrologerDesign(index, wishlistController.astrologers[index]);
                },
              )

            ) : Center(
              child: Text(
                "You have not wishlisted any astrologer",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getAstrologerDesign(int index, AstrologerModel astrologer) {
    int rate = 0;
    return GestureDetector(
      onTap: () {
        // wishlistController.goto("/astrologerDetail", arguments: astrologer.id.toString());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: standardListCardHeight,
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

  Widget getRatingDesign(int rate, int index) {
    return Image.asset(
      "assets/common/star.png",
      color: (index+1)<=rate ? MyColors.colorButton : MyColors.colorGrey,
    );
  }

  getLeftSection(AstrologerModel astrologer) {
    int rate = math.Random().nextInt(5);
    int review = math.Random().nextInt(10000);
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        getRatingDesign(rate, 0),
                        getRatingDesign(rate, 1),
                        getRatingDesign(rate, 2),
                        getRatingDesign(rate, 3),
                        getRatingDesign(rate, 4),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${'Reviews'.tr}: $review',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        astrologer.name,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18.0,
                          color: MyColors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "assets/common/online.png",
                        height: 11,
                        width: 11,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Vedic Astrologer",
                    style: GoogleFonts.manrope(
                      fontSize: 12.0,
                      color: MyColors.colorGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  wishlistController.manageFavorite(index);
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
                "Hindi, English, Telegu",
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
    print(wishlistController.free && astrologer.free==1);
    print('astrologer.free');
    print(astrologer.free);
    print("wishlistController.free");
    print(wishlistController.free);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              print(wishlistController.wallet);
              double min = Essential.getCalculatedAmount(astrologer.p_call??0, minutes: 5);
              if((wishlistController.free && astrologer.free==1) || (wishlistController.wallet>=min)) {
                wishlistController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": wishlistController.free && astrologer.free == 1,
                  "controller" : wishlistController,
                  "category" : "CALL"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    wishlistController.goto("/wallet");
                  }
                });
              }
              // wishlistController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
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
                        wishlistController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          color: MyColors.black,
                          fontWeight: wishlistController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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
              print(wishlistController.wallet);
              double min = Essential.getCalculatedAmount(astrologer.p_chat??0, minutes: 5);
              if((wishlistController.free && astrologer.free==1) || (wishlistController.wallet>=min)) {
                wishlistController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": wishlistController.free && astrologer.free == 1,
                  "controller" : wishlistController,
                  "category" : "CHAT"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    wishlistController.goto("/wallet");
                  }
                });
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
                        wishlistController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          color: MyColors.black,
                          fontWeight: wishlistController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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
}


getOldBottom(AstrologerModel astrologer) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${CommonConstants.rupee} 50000/${'min'.tr}",
            // "${CommonConstants.rupee} ${astrologer.chat_rate}/${'min'.tr}",
            style: GoogleFonts.playfairDisplay(
              fontSize: 16.0,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "First 5 minutes free",
            style: GoogleFonts.manrope(
              fontSize: 12.0,
              color: MyColors.colorButton,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        height: standardShortButtonHeight,
        decoration: BoxDecoration(
          color: MyColors.colorLightPrimary,
          border: Border.all(
            color: MyColors.colorButton
          ),
          borderRadius: BorderRadius.circular(standardShortButtonRadius)
        ),
        child: Text(
          "Chat",
          style: GoogleFonts.manrope(
            fontSize: 12.0,
            color: MyColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}
