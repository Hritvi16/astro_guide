import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/custom/CustomController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Custom extends StatelessWidget {
  Custom({ Key? key }) : super(key: key);

  final CustomController customController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<CustomController>(
      builder: (controller) {
        return Scaffold(
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
                  image: Essential.getPlatform() ?
                  const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  ) : null
              ),
              child: SafeArea(
                child: Padding(
                  // color: Colors.white,
                  padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            customController.title.tr,
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
                                  customController.goto("/wallet");
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
                                  customController.goto("/language");
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
                              customController.stopTimer();
                              customController.getAstrologers(0);
                            }
                            else {
                              customController.startTimer();
                            }
                          },
                          keyboardType: TextInputType.name,
                          controller: customController.search,
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                          ),
                          // controller: customController.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyColors.cardColor(),
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
                                customController.showFilters(context);
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
            onRefresh: customController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  getSpecs(),
                  customController.astrologers.isNotEmpty ?
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                    itemCount: customController.astrologers.length,
                    separatorBuilder: (buildContext, index) {
                      return SizedBox(
                        height: standardVerticalGap,
                      );
                    },
                    itemBuilder: (buildContext, index) {
                      return getAstrologerDesign(index, customController.astrologers[index]);
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
        itemCount: customController.specs.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemBuilder: (buildContext, index) {
          return getSpecDesign(index, customController.specs[index]);
        },
      ),
    );
  }

  Widget getSpecDesign(int ind, SpecModel spec) {
    return GestureDetector(
      onTap: () {
        customController.changeSpec(spec);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==customController.specs.length-1 ? 20 : 0),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: customController.spec==spec ? MyColors.colorLightPrimary : MyColors.cardColor(),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: customController.spec==spec ? MyColors.colorButton : MyColors.colorGrey
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
                color: customController.spec==spec ? MyColors.black : MyColors.colorGrey,
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
    int rate = 0;
    return GestureDetector(
      onTap: () {
        // customController.goto("/astrologerDetail", arguments: astrologer.id.toString());
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

  // Widget getRatingDesign(int rate, int index) {
  //   return Image.asset(
  //     "assets/common/star.png",
  //     color: (index+1)<=rate ? MyColors.colorButton : MyColors.colorGrey,
  //   );
  // }
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
                    child: getRatingDesign(astrologer.rating??0),
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
                  customController.manageFavorite(index);
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
              if((customController.free && astrologer.free==1) || (customController.wallet>=min)) {
                customController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": customController.free && astrologer.free == 1,
                  "controller" : customController,
                  "category" : "CALL"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    customController.goto("/wallet");
                  }
                });
              }
              // customController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
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
                        customController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: customController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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
              if((customController.free && astrologer.free==1) || (customController.wallet>=min)) {
                customController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": customController.free && astrologer.free == 1,
                  "controller" : customController,
                  "category" : "CHAT"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    customController.goto("/wallet");
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
                        customController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: customController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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

