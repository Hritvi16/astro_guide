import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialsController.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Testimonials extends StatelessWidget {
  Testimonials({ Key? key }) : super(key: key);

  final TestimonialsController testimonialsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<TestimonialsController>(
      builder: (controller) {
        return testimonialsController.load ?
        Scaffold(
          backgroundColor: MyColors.colorBG,
          body: getBody(context),
        )
        : LoadingScreen();
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
                  child: CustomAppBar('Testimonials'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: testimonialsController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: testimonialsController.testimonials.isNotEmpty ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child:
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                  itemCount: testimonialsController.testimonials.length,
                  separatorBuilder: (buildContext, index) {
                    return SizedBox(
                      height: standardVerticalGap,
                    );
                  },
                  itemBuilder: (buildContext, index) {
                    return getTestimonialDesign(index, testimonialsController.testimonials[index]);
                  },
                )

            ) : Center(
              child: Text(
                "There are no testimonials posted yet",
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
  
  Widget getTestimonialDesign(int ind, TestimonialModel testimonial) {
    return GestureDetector(
      onTap: () {
        testimonialsController.goto("/testimonial", arguments: testimonial.id);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: standardTestimonialHeight,
        width: standardTestimonialWidth,
        decoration: BoxDecoration(
          border: Border.all(
              color: (ind+1)%2==0 ? MyColors.colorBlueBorder : MyColors.colorButton
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardTestimonialTopRadius),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: standardTestimonialHeight,
              width: standardTestimonialImageWidth,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: (ind+1)%2==0 ? MyColors.colorBlueBG : MyColors.colorLightPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(standardTestimonialTopRadius),
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/astrology/galaxy.png",
                    // fit: BoxFit.fill,
                    height: standardTestimonialImageBGHeight,
                    width: standardTestimonialImageBGWidth,
                    color: (ind+1)%2==0 ? MyColors.colorBlueBorder : MyColors.colorButton,
                  ),
                  Positioned(
                    top: 24,
                    left: 24,
                    child: CircleAvatar(
                      radius: 35,
                      // backgroundImage: AssetImage(
                      //   "assets/test/user.jpg"
                      // ),
                      backgroundImage: NetworkImage(
                          ApiConstants.userUrl+testimonial.profile
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.name,
                      maxLines: 2,
                      style: GoogleFonts.manrope(
                        fontSize: 16.0,
                        color: MyColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ("${testimonial.state}, ${testimonial.country}").toTitleCase(),
                      maxLines: 1,
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.colorGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              testimonial.description,
                              // maxLines: 7,
                              style: GoogleFonts.manrope(
                                fontSize: 10.0,
                                color: MyColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
