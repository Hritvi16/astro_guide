import 'dart:math';

import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/service/HoroscopeController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/horoscope/horoscope/HoroscopeModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Horoscope extends StatelessWidget {
  Horoscope({ Key? key }) : super(key: key);

  final HoroscopeController horoscopeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<HoroscopeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          body: horoscopeController.horoscopes.length>2 ? getBody(context) : LoadingScreen(),
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
                  child: CustomAppBar("Today's Horoscope".tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: horoscopeController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      itemCount: CommonConstants.zodiac_signs.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (buildContext, index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                      itemBuilder: (buildContext, index) {
                        return getZodiacCard(index);
                      },
                    ),
                  ),
                  getTabs(),
                  Flexible(
                    flex: 1,
                    child: horoscopeController.load ? SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: getTabBody(context),
                    ) : LoadingScreen(),
                  )
                ],
              ),
            ),
        ),
      ],
    );
  }

  Widget getTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getTabDesign(0, CommonConstants.horoscope_day[0].tr),
          const SizedBox(
            width: 8,
          ),
          getTabDesign(1, CommonConstants.horoscope_day[1].tr),
          const SizedBox(
            width: 8,
          ),
          getTabDesign(2, CommonConstants.horoscope_day[2].tr),
        ],
      ),
    );
  }

  Widget getTabDesign(int index, String title) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          horoscopeController.changeDayTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: horoscopeController.selectedDay==index ?
          BoxDecoration(
              color: MyColors.colorLightPrimary,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: MyColors.colorButton
              )
          )
              : BoxDecoration(
              color: MyColors.cardColor(),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: MyColors.borderColor()
              )
          ),
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              letterSpacing: 0,
              color: horoscopeController.selectedDay==index ? MyColors.colorButton : MyColors.labelColor(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getTabBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
      child: getView(horoscopeController.horoscopes[horoscopeController.selectedDay]),
    );
  }

  Widget getView(HoroscopeModel horoscope) {
    Map<String, dynamic> predictions = horoscope.prediction.toJson();
    List<String> title = horoscope.prediction.toJson().keys.where((element) => element!="luck").toList();
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getLuckyCard(horoscope),
          SizedBox(height: 10),
          Text(
            "Daily Horoscope",
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          ListView.separated(
            itemCount: title.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (buildContext, index) {
              return SizedBox(
                height: 15,
              );
            }, 
            itemBuilder: (buildContext, index) {
              return getCard(title[index], predictions[title[index]]);
            }, 
          )
        ],
      ),
    );
  }

  Widget getCard(String title, String info) {
    Color color = MyColors.horoscopeColor(title);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(
          color: color
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toTitleCase(),
            style: GoogleFonts.manrope(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 14
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            info,
            style: GoogleFonts.manrope(
              color: MyColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }

  Widget getZodiacCard(int index) {
    String sign = CommonConstants.zodiac_signs[index];
    Color color = MyColors.pastels[index%6];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            horoscopeController.changeSign(index);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: horoscopeController.selectedSign==index ? MyColors.white : color,
              child: Text(
                sign.characters.first.toUpperCase(),
                style: GoogleFonts.playfairDisplay(
                  color: MyColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          sign,
          style: GoogleFonts.playfairDisplay(
              color: MyColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }

  Widget getLuckyCard(HoroscopeModel horoscope) {
    String num = horoscope.prediction.luck.firstWhere((element) => element.toLowerCase().contains("number")).replaceAll(" ", "");
    String alpha = horoscope.prediction.luck.firstWhere((element) => element.toLowerCase().contains("alphabets")).replaceAll(" ", "");
    print("horoscope.prediction.luck.contains");
    List<String> numbers = num.substring(num.lastIndexOf(":")+1).split(",");
    List<String> alphabets = alpha.substring(alpha.lastIndexOf(":")+1).split(",");

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/astrology/galaxy.jpg"),
          fit: BoxFit.fill
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            horoscopeController.getDate(),
            style: GoogleFonts.manrope(
              color: MyColors.white,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getLuckyColourDesign(horoscope.special.lucky_color_codes),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        getLuckyItemDesign("Numbers", numbers),
                        getLuckyItemDesign("Alphabets", alphabets),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: MyColors.pastels[horoscopeController.selectedSign%6],
                child: Text(
                  CommonConstants.zodiac_signs[horoscopeController.selectedSign].characters.first.toUpperCase(),
                  style: GoogleFonts.playfairDisplay(
                      color: MyColors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getLuckyColourDesign(List<String> colours) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lucky Colours",
          style: GoogleFonts.manrope(
              color: MyColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12
          ),
        ),
        SizedBox(
          height: 30,
          child: ListView.separated(
            itemCount: colours.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            separatorBuilder: (buildContext, index) {
              return SizedBox(
                width: 5,
              );
            },
            itemBuilder: (buildContext, index) {
              return getColourCard(colours[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget getColourCard(String colour) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: MyColors.white,
      child: CircleAvatar(
        radius: 9,
        backgroundColor: MyColors.getColorFromHex(colour.trim().substring(1)),
      ),
    );
  }

  Widget getLuckyItemDesign(String title, List<String> items) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lucky $title",
            style: GoogleFonts.manrope(
                color: MyColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12
            ),
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 30,
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              separatorBuilder: (buildContext, index) {
                return getItemCard(", ");
              },
              itemBuilder: (buildContext, index) {
                return getItemCard(items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getItemCard(String item) {
    return Text(
      item,
      style: GoogleFonts.manrope(
          color: MyColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
    );
  }

}

