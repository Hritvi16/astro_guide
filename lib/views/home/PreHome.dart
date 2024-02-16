import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/home/PreHomeController.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PreHome extends StatelessWidget {
  PreHome({ Key? key }) : super(key: key);

  final PreHomeController preHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<PreHomeController>(
      builder: (controller) {
        return Scaffold(
          body: getBody(context)
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
              ),
              child: SafeArea(
                child: CustomAppBar('Choose Area of Counselling'.tr, arrow: false),
              ),
            ),
          ),
        ),
        Container(
          width: MySize.size100(context),
          height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
          child: GridView.custom(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: 20
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: standardLangCardHeight
              // childAspectRatio: 3/4,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                return getSpecDesign(index, preHomeController.specs[index], context);
              },
              childCount: preHomeController.specs.length,
            ),
          ),
        )
      ],
    );
  }

  Widget getSpecDesign(int index, SpecModel spec, BuildContext context) {
    return GestureDetector(
      onTap: () {
        preHomeController.goto("/home", arguments: {"index" : 0, "title" : null, "spec" : spec});
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            color: MyColors.colorPrimary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: MyColors.colorButton
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              spec.imageFullUrl,
              height: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              spec.spec,
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              )
            ),
          ],
        ),
      ),
    );
  }

}