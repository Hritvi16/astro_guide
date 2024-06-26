import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/following/FollowingController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Following extends StatelessWidget {
  Following({ Key? key }) : super(key: key);

  final FollowingController followingController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<FollowingController>(
      builder: (controller) {
        return Scaffold(
          body: followingController.load ? getBody(context) : LoadingScreen(),
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
                child: CustomAppBar('Following'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: followingController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: followingController.astrologers.isNotEmpty ? SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child:
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                itemCount: followingController.astrologers.length,
                separatorBuilder: (buildContext, index) {
                  return SizedBox(
                    height: standardVerticalGap,
                  );
                },
                itemBuilder: (buildContext, index) {
                  return getAstrologerDesign(index, followingController.astrologers[index]);
                },
              )
            ) : Center(
              child: Text(
                "You have not followed any ${Essential.getPlatformWord()}",
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
        followingController.goto("/astrologerDetail/${astrologer.id}", arguments: astrologer.id.toString());
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
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    print(astrologer.toJson());
                    followingController.manageFollow(index);
                  },
                  child: Container(
                    height: 37,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyColors.colorButton,
                        borderRadius: BorderRadius.circular(
                            20
                        )
                    ),
                    child: Text(
                      "Following".tr,
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
    Color call = astrologer.conline==1 ? MyColors.colorSuccess : MyColors.colorGrey;
    Color chat = astrologer.online==1 ? MyColors.colorChat : MyColors.colorGrey;

    print(followingController.free && astrologer.free==1);
    print('astrologer.free');
    print(astrologer.free);
    print("followingController.free");
    print(followingController.free);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              if(astrologer.conline==1) {
                print(followingController.wallet);
                double min = Essential.getCalculatedAmount(
                    astrologer.p_call ?? 0, minutes: 5);
                if ((followingController.free && astrologer.free == 1) || (followingController.wallet >= min)) {
                  if(followingController.ivr==1 && astrologer.ivr==1 && followingController.video==1 && astrologer.video==1) {
                    followingController.selectCallType(followingController, astrologer);
                  }
                  else {
                    followingController.goto("/checkSession", arguments: {
                      "astrologer": astrologer,
                      "free": followingController.free && astrologer.free == 1,
                      "controller": followingController,
                      "category": "CALL",
                      "call_type": (followingController.ivr==1 && astrologer.ivr==1) ? "IVR" : "VIDEO",

                    });
                  }
                }
                else {
                  Essential.showBasicDialog(
                      "You must have minimum of ${CommonConstants.rupee}${min
                          .ceil()} balance in your wallet. Do you want to recharge?",
                      "Recharge Now", "No, Thanks").then((value) {
                    if (value == "Recharge Now") {
                      followingController.goto("/wallet");
                    }
                  });
                }
              }
              else {
                Essential.showInfoDialog("${astrologer.name} is currently unavailable for call." , btn: "OK");
              }
              // followingController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
            },
            child: Container(
                alignment: Alignment.center,
                height: standardShortButtonHeight,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: call.withOpacity(0.3),
                    border: Border.all(
                        color: call
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
                      color: call,
                    ),
                    Flexible(
                      child: Text(
                        followingController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: followingController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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
                print(followingController.wallet);
                double min = Essential.getCalculatedAmount(
                    astrologer.p_chat ?? 0, minutes: 5);
                if ((followingController.free && astrologer.free == 1) ||
                    (followingController.wallet >= min)) {
                  followingController.goto("/checkSession", arguments: {
                    "astrologer": astrologer,
                    "free": followingController.free && astrologer.free == 1,
                    "controller": followingController,
                    "category": "CHAT"
                  });
                }
                else {
                  Essential.showBasicDialog(
                      "You must have minimum of ${CommonConstants.rupee}${min
                          .ceil()} balance in your wallet. Do you want to recharge?",
                      "Recharge Now", "No, Thanks").then((value) {
                    if (value == "Recharge Now") {
                      followingController.goto("/wallet");
                    }
                  });
                }
              }
              else {
                Essential.showInfoDialog("${astrologer.name} is currently unavailable for chat." , btn: "OK");
              }
            },
            child: Container(
                alignment: Alignment.center,
                height: standardShortButtonHeight,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: chat.withOpacity(0.3),
                    border: Border.all(
                        color: chat
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
                      color: chat,
                    ),
                    Flexible(
                      child: Text(
                        followingController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: followingController.free && astrologer.free==1 ? FontWeight.w600 : FontWeight.w500,
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



