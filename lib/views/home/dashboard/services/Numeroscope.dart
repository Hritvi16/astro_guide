import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/service/NumeroscopeController.dart';
import 'package:astro_guide/essential/Essential.dart';
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


class Numeroscope extends StatelessWidget {
  Numeroscope({ Key? key }) : super(key: key);

  final NumeroscopeController numeroscopeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<NumeroscopeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          body: numeroscopeController.numeroscopes.length>2 ? getBody(context) : LoadingScreen(),
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
                  child: CustomAppBar("Today's Numeroscope".tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: numeroscopeController.onRefresh,
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
                      itemCount: 9,
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
                    child: numeroscopeController.load ? SingleChildScrollView(
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
          numeroscopeController.changeDayTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: numeroscopeController.selectedDay==index ?
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
              color: numeroscopeController.selectedDay==index ? MyColors.colorButton : MyColors.labelColor(),
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
      child: getView(numeroscopeController.numeroscopes[numeroscopeController.selectedDay]),
    );
  }

  Widget getView(String numeroscope) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 2)
          ),
        ],
      ),
      child: Text(
        numeroscope,
        style: GoogleFonts.manrope(
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  Widget getZodiacCard(int index) {
    String number = (index+1).toString();
    Color color = MyColors.pastels[index%6];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            numeroscopeController.changeSign(index);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: numeroscopeController.selectedNumber==index ? MyColors.white : color,
              child: Text(
                number,
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
          number,
          style: GoogleFonts.playfairDisplay(
              color: MyColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }

}

