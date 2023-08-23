import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/talk/TalkController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Talk extends StatelessWidget {
  Talk({ Key? key }) : super(key: key);

  final TalkController talkController = Get.put<TalkController>(TalkController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<TalkController>(
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
          height: standardUpperFixedDesignHeightWithSearch,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeightWithSearch,
              padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding),
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: Padding(
                  // color: Colors.white,
                  padding: const EdgeInsets.only(top: 25.0, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Talk with Astrologer'.tr,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 22.0,
                              color: MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/common/notification.png",
                                height: 25,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  talkController.goto("/wallet");
                                },
                                child: Image.asset(
                                  "assets/common/wallet.png",
                                  height: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  talkController.goto("/language");
                                  // dashboardController.logout();
                                },
                                child: Image.asset(
                                  "assets/common/lang.png",
                                  height: 25,
                                  color: MyColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.isEmpty) {
                              talkController.stopTimer();
                              talkController.getAstrologers(0);
                            }
                            else {
                              talkController.startTimer();
                            }
                          },
                          keyboardType: TextInputType.name,
                          controller: talkController.search,
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.black,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                          ),
                          // controller: talkController.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyColors.white,
                            hintText: "Search Astrologer".tr,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              child: Image.asset(
                                "assets/common/search.png",
                                height: 10,
                                color: MyColors.colorButton,
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                talkController.showFilters(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                child: Image.asset(
                                  "assets/common/filter.png",
                                  height: 14,
                                  color: MyColors.colorGrey,
                                ),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if ((value??"").isEmpty) {
                              return "* Required";
                            }  else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: talkController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  getSpecs(),
                  talkController.astrologers.isNotEmpty ?
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                    itemCount: talkController.astrologers.length,
                    separatorBuilder: (buildContext, index) {
                      return SizedBox(
                        height: standardVerticalGap,
                      );
                    },
                    itemBuilder: (buildContext, index) {
                      return getAstrologerDesign(index, talkController.astrologers[index]);
                    },
                  )
                  : SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getSpecs() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: talkController.specs.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemBuilder: (buildContext, index) {
          return getSpecDesign(index, talkController.specs[index]);
        },
      ),
    );
  }

  Widget getSpecDesign(int ind, SpecModel spec) {
    return GestureDetector(
      onTap: () {
        talkController.changeSpec(spec);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==talkController.specs.length-1 ? 20 : 0),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: talkController.spec==spec ? MyColors.colorLightPrimary : MyColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: talkController.spec==spec ? MyColors.colorButton : MyColors.colorGrey
          )
        ),
        child: Row(
          children: [
            Image.network(
              ApiConstants.specificationUrl+spec.icon,
              height: 16,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              spec.spec,
              style: GoogleFonts.manrope(
                fontSize: 12.0,
                color: talkController.spec==spec ? MyColors.black : MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAstrologerDesign(int index, AstrologerModel astrologer) {
    return GestureDetector(
      onTap: () {
        talkController.goto("/astrologerDetail", arguments: astrologer.id.toString());
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
        unratedColor: MyColors.colorGrey,
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
                  talkController.manageFavorite(index);
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              double min = Essential.getCalculatedAmount(astrologer.p_call??0, minutes: 5);
              if((talkController.free && astrologer.free==1) || (talkController.wallet>=min)) {
                talkController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": talkController.free && astrologer.free == 1,
                  "controller" : talkController,
                  "category" : "CALL"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    talkController.goto("/wallet");
                  }
                });
              }
              // talkController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
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
                        talkController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          color: MyColors.black,
                          fontWeight: talkController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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
              double min = Essential.getCalculatedAmount(astrologer.p_chat??0, minutes: 5);
              if((talkController.free && astrologer.free==1) || (talkController.wallet>=min)) {
                talkController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": talkController.free && astrologer.free == 1,
                  "controller" : talkController,
                  "category" : "CHAT"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    talkController.goto("/wallet");
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
                        talkController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          color: MyColors.black,
                          fontWeight: talkController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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

