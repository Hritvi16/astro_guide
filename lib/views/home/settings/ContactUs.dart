import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/contactUs/ContactUsController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  ContactUs({ Key? key }) : super(key: key);

  final ContactUsController contactUsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ContactUsController>(
      builder: (controller) {
        return Scaffold(
          body: getBody(context),
        );
      },
    );
  }

  getBody(BuildContext context) {
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
                child: CustomAppBar("Contact Us".tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getInfoCard("HELP CENTER", "Got question? We are here to answer", "CALL NOW", "assets/contact_us/telephone.png", contactUsController.setting.mobile),
                  SizedBox(
                    height: 20,
                  ),
                  getInfoCard("EMAIL", "Typical reply time with in a day or two.", "EMAIL US", "assets/contact_us/email.png", contactUsController.setting.email),
                  SizedBox(
                    height: 20,
                  ),
                  getInfoCard("ADDRESS", "Our headquarter : ${contactUsController.setting.address}", "LOCATION", "assets/contact_us/location.png", contactUsController.setting.link),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getInfoCard(String title, String subTitle, String tab, String image, String info) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.cardColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: Get.isDarkMode ? null
            : const [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, .2),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 1.0,
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5),
              child: Image.asset(
                image,
                color: MyColors.colorButton,
              ),
            ),
          ),
          Flexible(
            flex: 7,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    color: MyColors.colorButton,
                  ),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.manrope()
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                if(tab=="CALL NOW") {
                  Essential.call(info);
                }
                else if(tab=="EMAIL US") {
                  Essential.email(info);
                }
                else if(tab=="LOCATION") {
                  print(info);
                  Essential.link(info);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(right: 10.0, left: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.colorButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  tab,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}