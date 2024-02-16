import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/testimonial/MyTestimonialController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTestimonial extends StatelessWidget {
  MyTestimonial({ Key? key }) : super(key: key);

  final MyTestimonialController myTestimonialController = Get.put<MyTestimonialController>(
      MyTestimonialController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<MyTestimonialController>(
      builder: (controller) {
        return Scaffold(
          body: myTestimonialController.load ? getBody(context) : LoadingScreen(),
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
                  child: CustomAppBar('My Testimonials'.tr, options: GestureDetector(
                    onTap: () {
                      myTestimonialController.goto("/manageTestimonial");
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
            onRefresh: myTestimonialController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: myTestimonialController.testimonials.isNotEmpty ?
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: standardHorizontalPagePadding,
                    vertical: standardVerticalGap),
                itemCount: myTestimonialController.testimonials.length,
                separatorBuilder: (buildContext, index) {
                  return SizedBox(
                    height: standardVerticalGap,
                  );
                },
                itemBuilder: (buildContext, index) {
                  return getTestimonialDesign(
                      index, myTestimonialController.testimonials[index]);
                },
              )
              : Container(
                height: MySize.sizeh100(context) - standardUpperFixedDesignHeight - standardBottomBarHeight - standardVerticalGap,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "You have not written any testimonial yet!",
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

  Widget getTestimonialDesign(int ind, TestimonialModel testimonial) {
    return SwipeActionCell(
      key: ValueKey(testimonial.id),
      trailingActions: [
        SwipeAction(
            icon: Icon(
              Icons.delete,
              color: MyColors.inverseIconColor(),
            ),
            color: MyColors.colorOff,
            performsFirstActionWithFullSwipe: true,
            nestedAction: SwipeNestedAction(title: "Confirm"),
            onTap: (handler) async {
              if(await myTestimonialController.delete(testimonial.id)) {
                await handler(true);
                myTestimonialController.removeTestimonial(testimonial);
              }
            }),
        SwipeAction(
            icon: Icon(
              Icons.edit,
              color: MyColors.inverseIconColor(),
            ),
            color: Colors.grey,
            onTap: (handler) async {
              if(await myTestimonialController.goto("/manageTestimonial", arguments: testimonial)) {
                await handler(false);
              }
            }
        ),
      ],
      child: GestureDetector(
        onTap: () {
          myTestimonialController.goto("/testimonial", arguments: testimonial.id);
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
                      child: (testimonial.profile??"").isEmpty ?
                        CircleAvatar(
                          radius: 35,
                          child: Icon(
                            Icons.person,
                            color: (ind+1)%2==0 ? MyColors.colorBlueBorder : MyColors.colorButton,
                            size: 50,
                          ),
                          backgroundColor: (ind+1)%2==0 ? MyColors.colorBlueBG : MyColors.colorLightPrimary,
                        )
                        : CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            ApiConstants.userUrl+testimonial.profile!
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
      ),
    );
  }
}

