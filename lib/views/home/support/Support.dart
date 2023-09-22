import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/support/SupportController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Support extends StatelessWidget {
  Support({ Key? key }) : super(key: key);

  final SupportController supportController = Get.put<SupportController>(
      SupportController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SupportController>(
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
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  )
              ),
              child: SafeArea(
                  child: CustomAppBar('Support'.tr, options: GestureDetector(
                    onTap: () {
                      supportController.requestSupport();
                    },
                    child: Image.asset(
                      "assets/common/add.png",
                      height: 25,
                    ),
                  ),)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: supportController.onRefresh,
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
              child: supportController.supports.isNotEmpty ?
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: standardHorizontalPagePadding,
                    vertical: standardVerticalGap),
                itemCount: supportController.supports.length,
                separatorBuilder: (buildContext, index) {
                  return SizedBox(
                    height: standardVerticalGap,
                  );
                },
                itemBuilder: (buildContext, index) {
                  return getSupportDesign(
                      index, supportController.supports[index]);
                },
              )
              : Container(
                height: MySize.sizeh100(context) - standardUpperFixedDesignHeight - standardBottomBarHeight - standardVerticalGap,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "You have not asked for any support yet!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getSupportDesign(int index, SupportModel support) {
    return GestureDetector(
      onTap: () {
        supportController.goto(
            "/supportChat", arguments: {"sup_id": support.id, "status" : support.status});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
            color: MyColors.cardColor(),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: MyColors.colorBorder
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                Essential.getDateTime(support.sent_at??support.created_at),
                style: GoogleFonts.manrope(
                  fontSize: 10.0,
                  color: MyColors.colorGrey,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "#"+support.id.toString(),
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              support.status,
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: Essential.getSStatusColor(support.status),
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              support.reason,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              support.message??"",
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitleInfo(String title, String info, {Color? color, bool flex = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title+" : ",
          style: GoogleFonts.manrope(
            fontSize: 14.0,
            letterSpacing: 0,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: color,
              letterSpacing: 0,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }

}

