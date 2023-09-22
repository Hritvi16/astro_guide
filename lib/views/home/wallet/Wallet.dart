
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/wallet/WalletController.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Wallet extends StatelessWidget {
  Wallet({ Key? key }) : super(key: key);

  final WalletController walletController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    walletController.context = context;
    walletController.update();

    return GetBuilder<WalletController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: getPayDesign(context),
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
                        "assets/essential/upper_bg.png",
                      ),
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('My Wallet'),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: walletController.onRefresh,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getMyAmountDesign(),
                    SizedBox(
                      height: 28,
                    ),
                    getCustomAmountDesign(context)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getMyAmountDesign() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          color: MyColors.colorLightPrimary,
          child: Image.asset(
            "assets/common/my_wallet.png",
            height: 30,
            width: 30,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Available Balance".tr,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20.0,
                color: MyColors.labelColor(),
                letterSpacing: 0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${CommonConstants.rupee} ${walletController.wallet%1==0 ? walletController.wallet.toInt().toString() : walletController.wallet.toStringAsFixed(2)}",
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }


  Widget getCustomAmountDesign(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Custom Amount".tr,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            color: MyColors.labelColor(),
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          onChanged: (value) {
            walletController.selectPackage(null, context);
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          style: GoogleFonts.manrope(
            fontSize: 16.0,
            color: MyColors.labelColor(),
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          controller: walletController.amount,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.colorButton,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Enter Amount".tr,

            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
              child: Text(
                CommonConstants.rupee,
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  color: MyColors.labelColor(),
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
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
        Image.asset(
          "assets/common/or.png"
        ),
        Text(
          "Recharge Wallet".tr,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            color: MyColors.labelColor(),
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Choose from the available recharge packs.".tr,
          style: GoogleFonts.manrope(
            fontSize: 16.0,
            color: MyColors.colorGrey,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        GridView.custom(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: standardPackageCardHeight
            // childAspectRatio: 3/4,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
              return getPackageDesign(index, walletController.packages[index], context);
            },
            childCount: walletController.packages.length,
          ),
        )

      ],
    );
  }


  Widget getPackageDesign(int ind, PackageModel package, BuildContext context) {
    return GestureDetector(
      onTap: () {
        walletController.selectPackage(package, context);
      },
      child: Container(
        height: standardPackageCardHeight,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: walletController.package==package ? MyColors.colorPrimary : MyColors.cardColor(),
          border: Border.all(
            color: walletController.package==package ? MyColors.colorPrimary : MyColors.pcBorder(),
            width: 2
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardImageRadius),
            topRight: Radius.circular(standardImageRadius),
            bottomLeft: Radius.circular(standardPackageCardRadius),
            bottomRight: Radius.circular(standardPackageCardRadius),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: standardPackageCardSHeight,
              width: double.infinity,
              padding: EdgeInsets.only(top: 15, bottom: 5),
              decoration: BoxDecoration(
                color: walletController.package==package ? MyColors.colorButton : MyColors.pcBorder(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(standardImageRadius),
                  topRight: Radius.circular(standardImageRadius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/signs/"+((ind+1)%3==1 ? "star.png" : (ind+1)%3==2 ? "swastik.png" : "om.png"),
                    color: walletController.package==package ? MyColors.colorOrange : MyColors.colorGrey,
                    height: (ind+1)%3==1 ? standardPackageStarHeight : (ind+1)%3==2 ? standardPackageSwastikHeight : standardPackageOmHeight,
                  ),
                  Text(
                    "${package.amount.toString()} ${CommonConstants.rupee}",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: GoogleFonts.manrope(
                      fontSize: 18.0,
                      color: walletController.package==package ? MyColors.white : MyColors.labelColor(),
                      fontWeight: FontWeight.w700,
                      letterSpacing: -2
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              height: standardPackageCardOHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: walletController.package==package ? MyColors.colorSuccessDark : MyColors.colorSuccess,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                (package.discount??0)==0 ? "-" : package.discount.toString()+(package.type=="AMOUNT" ? CommonConstants.rupee : CommonConstants.per)+" ${"Extra".tr}",
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: GoogleFonts.manrope(
                    fontSize: 12.0,
                    color: MyColors.white,
                    fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? getPayDesign(BuildContext context) {
    return walletController.amount.text.isNotEmpty || walletController.package!=null ?
    PhysicalModel(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(standardBottomBarRadius),
          topRight: Radius.circular(standardBottomBarRadius)
      ),
      shadowColor: MyColors.black,
      color: MyColors.white,
      child: GestureDetector(
        onTap: () {
          walletController.proceed();
        },
        child: Container(
          height: standardBottomBarHeight,
          width: standardBottomBarWidth,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: MyColors.cardColor(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(standardBottomBarRadius),
                topRight: Radius.circular(standardBottomBarRadius)
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 46),
            child: standardButton(
              context: context,
              backgroundColor: MyColors.colorButton,
              child: Center(
                child: Text(
                  'Proceed to pay'.tr,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.white,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
    : null;
  }
}