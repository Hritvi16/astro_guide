import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/testimonial/ManageTestimonialController.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ManageTestimonial extends StatelessWidget {
  ManageTestimonial({ Key? key }) : super(key: key);

  final ManageTestimonialController manageTestimonialController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ManageTestimonialController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.colorBG,
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
                  child: CustomAppBar('${manageTestimonialController.testimonial==null ? 'Add'.tr : 'Update'.tr} ${'Testimonial'.tr}')
              ),
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Form(
              key: manageTestimonialController.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    standardTFLabel(text: 'Testimonial Description'.tr, optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.newline,
                        controller: manageTestimonialController.description,
                        maxLines: 10,
                        style: GoogleFonts.notoColorEmoji(
                          fontSize: 16.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.colorButton,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Write your testimonial description".tr,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        manageTestimonialController.manage();
                      },
                      child: standardButton(
                        context: context,
                        backgroundColor: MyColors.colorButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: standardHTIS),
                              child: Text(
                                manageTestimonialController.testimonial==null ? 'Post'.tr : 'Update'.tr,
                                style: GoogleFonts.manrope(
                                  fontSize: 16.0,
                                  color: MyColors.white,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/controls/arrow_next.png",
                              height: standardArrowH,
                              width: standardArrowW,
                              color: MyColors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
