
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class PaymentMethod extends StatelessWidget {
  PaymentMethod({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: getBody(context),
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
                  image: Essential.getPlatform() ? const DecorationImage(
                      image: AssetImage(
                        "assets/essential/upper_bg.png",
                      ),
                  ) : null
              ),
              child: SafeArea(
                child: CustomAppBar('Select Payment Method'),
              ),
            ),
          ),
        ),
        Flexible(
          child: ListView.separated(
            itemCount: CommonConstants.paymentMethods.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (buildContext, index) {
              return getMethodDesign(CommonConstants.paymentMethods[index]);
            },
            separatorBuilder: (buildContext, index) {
              return Divider(thickness: 1,);
            },
          ),
        )
      ],
    );
  }

  Widget getMethodDesign(Map<String, String> paymentMethod) {
    return GestureDetector(
      onTap: () {
        Get.back(result: paymentMethod['name']);
      },
      child: Row(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              height: 40,
              padding: EdgeInsets.all(5),
              color: MyColors.white,
              child: Image.asset(
                "assets/payment_methods/${paymentMethod['icon']}",
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Text(
              "Payment with "+(paymentMethod['label']??""),
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}