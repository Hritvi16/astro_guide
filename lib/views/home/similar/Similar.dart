import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/similar/SimilarController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Similar extends StatelessWidget {
  Similar({ Key? key }) : super(key: key);

  final SimilarController similarController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SimilarController>(
      builder: (controller) {
        return Scaffold(
          body: similarController.load ? getBody(context) : LoadingScreen(),
        );
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
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: Essential.getPlatform() ?
                  const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  ) : null
              ),
              child: SafeArea(
                child: CustomAppBar('Similar Astrologers'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: similarController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: similarController.astrologers.isNotEmpty ? SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child:
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                itemCount: similarController.astrologers.length,
                separatorBuilder: (buildContext, index) {
                  return SizedBox(
                    height: standardVerticalGap,
                  );
                },
                itemBuilder: (buildContext, index) {
                  return getAstrologerDesign(index, similarController.astrologers[index]);
                },
              )

            ) : Center(
              child: Text(
                "You have not similared any ${Essential.getPlatformWord()}",
                textAlign: TextAlign.center,
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
        similarController.goto("/astrologerDetail/${astrologer.id}", arguments: astrologer.id.toString());
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
                    '${'Reviews'.tr}: ${astrologer.reviews??0}',
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
                    if(Essential.getPlatform())
                      Text(
                        astrologer.types??"-",
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
                  similarController.manageFavorite(index);
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
            height: 7,
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
              Flexible(
                child: Text(
                  astrologer.languages??"-",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                    fontSize: 12.0,
                    color: MyColors.colorGrey,
                    fontWeight: FontWeight.w500,
                  ),
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
    print(similarController.free && astrologer.free==1);
    print('astrologer.free');
    print(astrologer.free);
    print("similarController.free");
    print(similarController.free);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              print(similarController.wallet);
              double min = Essential.getCalculatedAmount(astrologer.p_call??0, minutes: 5);
              if((similarController.free && astrologer.free==1) || (similarController.wallet>=min)) {
                if(similarController.ivr==1 && astrologer.ivr==1 && similarController.video==1 && astrologer.video==1) {
                  similarController.selectCallType(similarController, astrologer);
                }
                else {
                  similarController.goto("/checkSession", arguments: {
                    "astrologer": astrologer,
                    "free": similarController.free && astrologer.free == 1,
                    "controller": similarController,
                    "category": "CALL",
                    "call_type": (similarController.ivr==1 && astrologer.ivr==1) ? "IVR" : "VIDEO",
                  });
                }
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    similarController.goto("/wallet");
                  }
                });
              }
              // similarController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
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
                        similarController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: similarController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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
              print(similarController.wallet);
              double min = Essential.getCalculatedAmount(astrologer.p_chat??0, minutes: 5);
              if((similarController.free && astrologer.free==1) || (similarController.wallet>=min)) {
                similarController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": similarController.free && astrologer.free == 1,
                  "controller" : similarController,
                  "category" : "CHAT"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    similarController.goto("/wallet");
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
                        similarController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: similarController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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


