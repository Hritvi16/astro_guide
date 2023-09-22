import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/dashboard/DashboardController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/banner/BannerModel.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class Dashboard extends StatelessWidget {
  Dashboard({ Key? key }) : super(key: key);

  // final DashboardController dashboardController = Get.find();
  final DashboardController dashboardController = Get.put<DashboardController>(DashboardController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<DashboardController>(
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
          height: standardUpperFixedDesignHeightWithSearch,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeightWithSearch,
              padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding),
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  )
              ),
              child: SafeArea(
                child: Padding(
                  // color: Colors.white,
                  padding: const EdgeInsets.only(top: 25.0, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dashboard'.tr,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 22.0,
                              color: MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/common/notification.png",
                                height: 25,
                                color: MyColors.black,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  dashboardController.goto("/wallet");
                                },
                                child: Image.asset(
                                  "assets/common/wallet.png",
                                  height: 25,
                                  color: MyColors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  dashboardController.goto("/language");
                                  // dashboardController.logout();
                                },
                                child: Image.asset(
                                  "assets/common/lang.png",
                                  height: 25,
                                  color: MyColors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          onTap: () {
                            dashboardController.gotoOff("/home", arguments: {"index" : 1, "title" : "Search Astrologer"});
                          },
                          keyboardType: TextInputType.name,
                          readOnly: true,
                          controller: dashboardController.search,
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                          ),
                          // controller: dashboardController.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyColors.cardColor(),
                            hintText: "${'Search Astrologer'.tr}...",
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              child: Image.asset(
                                "assets/common/search.png",
                                height: 10,
                                color: MyColors.colorButton,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Image.asset(
                                "assets/common/filter.png",
                                height: 14,
                                color: MyColors.colorGrey,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: dashboardController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  if(dashboardController.session!=null)
                    getActiveSession(context),
                  getServices(),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Column(
                      children: [
                        if(dashboardController.banners.isNotEmpty)
                          getBanners(),
                        getSpecs(),
                        getLiveAstrologers(),
                        getNewAstrologers(),
                        getBlogs(context),
                        getTestimonials(),
                        getNewVideos(),
                        getAppOptions(),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getActiveSession(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(dashboardController.session?.category=="CHAT") {
          dashboardController.goto(
              "/chat",
              arguments: {
                "type" : dashboardController.session?.status,
                "action" : dashboardController.session?.status,
                "astro_id" : dashboardController.session?.astro_id,
                "session_history" : dashboardController.session
              }
          );
        }
        else {
          dashboardController.goto("/call", arguments: {
            "type": dashboardController.session?.status,
            "action": dashboardController.session?.status,
            "astro_id": dashboardController.session?.astro_id,
            "session_history": dashboardController.session,
            'astrologer': AstrologerModel(
                id: dashboardController.session?.astro_id ?? -1,
                name: dashboardController.session?.astrologer ?? "",
                profile: dashboardController.session?.astro_profile ?? "",
                mobile: '',
                email: '',
                experience: 0,
                about: ''
            )
          });
        }
      },
      child: Container(
        width: MySize.size100(context),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.only(bottom: 20, top: 10, left: standardHorizontalPagePadding, right: standardHorizontalPagePadding),
        decoration: BoxDecoration(
          color: (dashboardController.session?.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess).withOpacity(0.2),
          border: Border.all(
            color: dashboardController.session?.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      ApiConstants.astrologerUrl+(dashboardController.session?.astro_profile??"")
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dashboardController.session?.astrologer??"",
                      style: GoogleFonts.manrope(
                        color: MyColors.labelColor(),
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                    Text(
                      dashboardController.session?.category??"",
                      style: GoogleFonts.manrope(
                        color: dashboardController.session?.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget getServices() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getServiceDesign("kundali_circle.png", "Free Kundali".tr, () {
            // dashboardController.goto("/kundli");
          }),
          getServiceDesign("match_circle.png", "Match Kundali".tr, () {
            // dashboardController.goto("/match_kundli");
          }),
          getServiceDesign("horoscope_circle.png", "Daily Horoscope".tr, () {
            dashboardController.goto("/horoscope");
          }),
        ],
      ),
    );
  }

  Widget getServiceDesign(String image, String title, void Function() onTap, ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: standardServiceOCRadius,
            backgroundColor: MyColors.backgroundColor(),
            child: Image.asset(
              "assets/astrology/$image",
              height: standardServiceHeight,
              width: standardServiceWidth,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget getBanners() {
    return Container(
      height: standardBannerHeight,
      margin: EdgeInsets.symmetric(vertical: standardVerticalPadding),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.banners.length,
        separatorBuilder: (BuildContext buildContext, index) {
          return SizedBox(
            width: standardHorizontalGap,
          );
        },
        itemBuilder: (BuildContext buildContext, index) {
          return getBannerDesign(index, dashboardController.banners[index]);
        }
      ),
    );
  }

  Widget getBannerDesign(int ind, BannerModel banner) {
    return Padding(
        padding: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.banners.length-1 ? 20 : 0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              standardBannerRadius
          ),
        ),
        child: Container(
          // margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.banners.length-1 ? 20 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              standardBannerRadius
            )
          ),
          child: Image.network(
            ApiConstants.bannerUrl+banner.image,
            height: standardBannerHeight,
            width: standardBannerWidth,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
  
  Widget getSpecs() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.specs.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemBuilder: (buildContext, index) {
          return getSpecDesign(index, dashboardController.specs[index]);
        },
      ),
    );
  }
  
  Widget getSpecDesign(int ind, SpecModel spec) {
    return GestureDetector(
      onTap: () {
        dashboardController.changeSpec(spec);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.specs.length-1 ? 20 : 0),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: dashboardController.spec==spec ? MyColors.colorLightPrimary : MyColors.cardColor(),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: dashboardController.spec==spec ? MyColors.colorButton : MyColors.colorGrey
            )
        ),
        child: Row(
          children: [
            Image.network(
              ApiConstants.specificationUrl+spec.icon,
              height: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              spec.spec,
              style: GoogleFonts.manrope(
                fontSize: 12.0,
                color: dashboardController.spec==spec ? MyColors.black : MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLiveAstrologers() {
    return Padding(
      padding: EdgeInsets.only(top: standardVerticalPadding),
      child: Column(
        children: [
          getListHeading("Currently Live Astrologers".tr, "/home", arguments: {"index" : 1, "title" : "Live Astrologers"}),
          const SizedBox(
            height: 14,
          ),
          getLiveAstrologersDesign()
        ],
      ),
    );
  }

  Widget getLiveAstrologersDesign() {
    return SizedBox(
      height: standardLiveAstroHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.live.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (buildContext, index) {
          return getLiveAstrologerDesign(index, dashboardController.live[index]);
        },
      ),
    );
  }

  Widget getLiveAstrologerDesign(int ind, AstrologerModel astrologer) {
    return GestureDetector(
      onTap: () {
        dashboardController.goto("/astrologerDetail", arguments: astrologer.id.toString());
      },
      child: Container(
        height: standardLiveAstroHeight,
        width: standardLiveAstroWidth,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.astrologers.length-1 ? 20 : 0),
        decoration: BoxDecoration(
          color: MyColors.colorPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardLiveAstroTopRadius),
            topRight: Radius.circular(standardLiveAstroTopRadius),
            bottomLeft: Radius.circular(standardLiveAstroBottomRadius),
            bottomRight: Radius.circular(standardLiveAstroBottomRadius)
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 134,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: MyColors.colorButton,
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/test/bg.png"
                      )
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(standardLiveAstroTopRadius),
                        topRight: Radius.circular(standardLiveAstroTopRadius),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.white
                    ),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 66,
                      backgroundImage: NetworkImage(
                        ApiConstants.astrologerUrl+astrologer.profile
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/signs/om_right.png",
                      height: 48,
                      alignment: Alignment.centerLeft,
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          astrologer.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.manrope(
                            fontSize: 18.0,
                            color: MyColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/signs/om_left.png",
                      height: 48,
                      alignment: Alignment.centerRight,
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 122,
              left: (standardLiveAstroWidth-59)/2,
              child: Container(
                height: 24,
                width: 59,
                decoration: BoxDecoration(
                  color: MyColors.cardColor(),
                  borderRadius: BorderRadius.circular(standardShortButtonRadius)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/common/online.png",
                      height: 11,
                      width: 11,
                    ),
                    Text(
                      "Live".tr,
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget getNewAstrologers() {
    return Padding(
      padding: EdgeInsets.only(top: standardVerticalPadding),
      child: Column(
        children: [
          getListHeading("New Arrival Astrologers".tr, "/home", arguments: {"index" : 1, "title" : "New Astrologers"}),
          const SizedBox(
            height: 14,
          ),
          getNewAstrologersDesign()
        ],
      ),
    );
  }

  Widget getNewAstrologersDesign() {
    return SizedBox(
      height: standardNewAstroHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.news.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (buildContext, index) {
          return getNewAstrologerDesign(index, dashboardController.news[index]);
        },
      ),
    );
  }

  Widget getNewAstrologerDesign(int ind, AstrologerModel astrologer) {
    int rate = math.Random().nextInt(5);
    int review = math.Random().nextInt(10000);
    return GestureDetector(
      onTap: () {
        dashboardController.goto("/astrologerDetail", arguments: astrologer.id.toString());
      },
      child: Container(
        height: standardNewAstroHeight,
        width: standardNewAstroWidth,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.astrologers.length-1 ? 20 : 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.colorDivider
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(standardNewAstroTopRadius),
              topRight: Radius.circular(standardNewAstroTopRadius),
              bottomLeft: Radius.circular(standardNewAstroBottomRadius),
              bottomRight: Radius.circular(standardNewAstroBottomRadius)
          ),
        ),
        child: Column(
          children: [
            Container(
                height: standardNewAstroInnerHeight,
                width: standardNewAstroInnerWidth,
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.colorPrimary,
                  width: 2
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(standardNewAstroInnerRadius),
                  topRight: Radius.circular(standardNewAstroInnerRadius),
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(standardNewAstroInnerRadius),
                      topRight: Radius.circular(standardNewAstroInnerRadius),
                    ),
                    child: Image.network(
                      ApiConstants.astrologerUrl+astrologer.profile,
                      fit: BoxFit.fill,
                      height: standardNewAstroInnerHeight,
                      width: standardNewAstroInnerWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: standardAstroImageShadowH,
                      width: standardNewAstroInnerWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 10,
                              spreadRadius: 10,
                              offset: const Offset(0, 2)
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    height: standardAstroImageShadowH,
                    width: standardNewAstroInnerWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: standardNewAstroInnerWidth,
                            height: 13,
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getRatingDesign(rate, 0),
                                const SizedBox(
                                  width: 3,
                                ),
                                getRatingDesign(rate, 1),
                                const SizedBox(
                                  width: 3,
                                ),
                                getRatingDesign(rate, 2),
                                const SizedBox(
                                  width: 3,
                                ),
                                getRatingDesign(rate, 3),
                                const SizedBox(
                                  width: 3,
                                ),
                                getRatingDesign(rate, 4),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${'Reviews'.tr}: $review',
                            style: GoogleFonts.manrope(
                              fontSize: 12.0,
                              color: MyColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Text(
                    astrologer.name,
                    maxLines: 1,
                    style: GoogleFonts.manrope(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  getNewBottom(astrologer)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBlogs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: standardVerticalPadding),
      child: Column(
        children: [
          getListHeading("New Updates and Blogs".tr, "/blogs"),
          const SizedBox(
            height: 14,
          ),
          getBlogsDesign(context)
        ],
      ),
    );
  }

  Widget getBlogsDesign(BuildContext context) {
    return SizedBox(
      height: standardBlogHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.blogs.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (buildContext, index) {
          return getBlogDesign(index, dashboardController.blogs[index], context);
        },
      ),
    );
  }

  Widget getBlogDesign(int ind, BlogModel blog, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // dashboardController.goto("/blog", arguments: blog.id);
      },
      child: Container(
        height: standardBlogHeight,
        width: standardBlogWidth,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.blogs.length-1 ? 20 : 0),
        decoration: BoxDecoration(
          border: Border.all(
              color: MyColors.colorDivider
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(standardBlogTopRadius),
              topRight: Radius.circular(standardBlogTopRadius),
              bottomLeft: Radius.circular(standardBlogBottomRadius),
              bottomRight: Radius.circular(standardBlogBottomRadius)
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(standardBlogTopRadius),
                topRight: Radius.circular(standardBlogTopRadius),
              ),
              child: Image.network(
                ApiConstants.blogUrl+blog.image,
                fit: BoxFit.fill,
                height: standardBlogImageHeight,
                width: standardBlogWidth,
              ),
              // child: Image.asset(
              //   "assets/test/banner1.png",
              //   fit: BoxFit.fill,
              //   height: standardBlogImageHeight,
              //   width: standardBlogWidth,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    maxLines: 2,
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        blog.name,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 14.0,
                          color: MyColors.colorGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        DateFormat("dd MMM, yyyy").format(DateTime.parse(blog.created_at)),
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 14.0,
                          color: MyColors.colorGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                dashboardController.goto("/blog", arguments: blog.id);
              },
              child: standardButton(
                context: context,
                backgroundColor: MyColors.cardColor(),
                borderColor: MyColors.colorButton,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                child: Text(
                  'Read More'.tr,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTestimonials() {
    return Padding(
      padding: EdgeInsets.only(top: standardVerticalPadding),
      child: Column(
        children: [
          getListHeading("User Testimonials".tr, "/testimonials"),
          const SizedBox(
            height: 14,
          ),
          getTestimonialsDesign()
        ],
      ),
    );
  }

  Widget getTestimonialsDesign() {
    return SizedBox(
      height: standardTestimonialHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.testimonials.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (buildContext, index) {
          return getTestimonialDesign(index, dashboardController.testimonials[index]);
        },
      ),
    );
  }

  Widget getTestimonialDesign(int ind, TestimonialModel testimonial) {
    return GestureDetector(
      onTap: () {
        dashboardController.goto("/testimonial", arguments: testimonial.id);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: standardTestimonialHeight,
        width: standardTestimonialWidth,
        margin: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.testimonials.length-1 ? 20 : 0),
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

  Widget getNewVideos() {
    return Padding(
      padding: EdgeInsets.only(top: standardVerticalPadding),
      child: Column(
        children: [
          getListHeading("New Videos".tr, "/videos"),
          const SizedBox(
            height: 14,
          ),
          getNewVideosDesign()
        ],
      ),
    );
  }

  Widget getNewVideosDesign() {
    return SizedBox(
      height: standardNewVideoHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dashboardController.videos.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (buildContext, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (buildContext, index) {
          return getNewVideoDesign(index, dashboardController.videos[index]);
        },
      ),
    );
  }

  Widget getNewVideoDesign(int ind, VideoModel video) {
    return Padding(
      padding: EdgeInsets.only(left: ind==0 ? 20 : 0, right: ind==dashboardController.videos.length-1 ? 20 : 0, bottom: 20),
      child: GestureDetector(
        onTap: () {
          // dashboardController.goto("/customYoutubePlayer", arguments: "https://www.youtube.com/watch?v=mqqft2x_Aa4");
          dashboardController.goto("/customYoutubePlayer", arguments: video);
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(standardNewVideoRadius),
            ),
          ),
          child: Container(
            height: standardNewVideoHeight,
            width: standardNewVideoWidth,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    ApiConstants.videoUrl+video.image
                  )
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(standardNewVideoRadius),
              ),
              boxShadow: [
                BoxShadow(
                  color: MyColors.black.withOpacity(0.9),
                ),
                BoxShadow(
                  color: Colors.white70,
                  spreadRadius: -30.0,
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/app_icon/icon_box.png",
                            height: 28,
                            width: 28,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    video.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.manrope(
                                      fontSize: 16.0,
                                      color: MyColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: MyColors.white,
                    )
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 125,
                  child: Image.asset(
                    "assets/player/play.png",
                    height: 48,
                    width: 48,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: standardNewVideoWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '00:00',
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.manrope(
                            fontSize: 12.0,
                            color: MyColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            "assets/player/progress_bar.png",
                            width: 172,
                          ),
                        ),
                        Image.asset(
                          "assets/player/youtube.png",
                          width: 46,
                          height: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/player/max.png",
                          width: 16,
                          height: 16,
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
    );
  }

  Widget getListHeading(String title, String path, {dynamic? arguments}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {
              if(path.contains("home")) {
                dashboardController.gotoOff(path, arguments: arguments);
              }
              else {
                dashboardController.goto(path, arguments: arguments);
              }
              // if(title.contains("Astrologer".tr)) {
              // dashboardController.goto("/custom", arguments: arguments);
              // }
              // else if(title.contains("Blog")) {
              //   dashboardController.goto("/blogs");
              // }
              // else if(title.contains("Testimonial")) {
              //   dashboardController.goto("/testimonials");
              // }
              // else {
              //   dashboardController.goto("/videos");
              // }
            },
            child: Text(
              "View all".tr,
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                // color: MyColors.colorGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getRatingDesign(int rate, int index) {
    return Image.asset(
      "assets/common/star.png",
      color: (index+1)<=rate ? MyColors.colorButton : MyColors.colorGrey,
    );
  }

  getNewBottom(AstrologerModel astrologer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              print(dashboardController.wallet);
              double min = Essential.getCalculatedAmount(astrologer.p_call??0, minutes: 5);
              if((dashboardController.free && astrologer.free==1) || (dashboardController.wallet>=min)) {
                dashboardController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": dashboardController.free && astrologer.free == 1,
                  "controller" : dashboardController,
                  "category" : "CALL"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    dashboardController.goto("/wallet");
                  }
                });
              }
              // dashboardController.goto("/call", arguments: {"astrologer" : astrologer, "type" : "REQUESTED", "action" : });
            },
            child: Container(
                alignment: Alignment.center,
                height: standardShortButtonHeight,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: MyColors.colorSuccess.withOpacity(0.3),
                    border: Border.all(
                        color: MyColors.colorSuccess
                    ),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/dashboard/call_filled.png",
                      height: 13,
                      color: MyColors.colorSuccess,
                    ),
                    Flexible(
                      child: Text(
                        dashboardController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_call}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              print(dashboardController.wallet);
              double min = Essential.getCalculatedAmount(astrologer.p_chat??0, minutes: 5);
              if((dashboardController.free && astrologer.free==1) || (dashboardController.wallet>=min)) {
                dashboardController.goto("/checkSession", arguments: {
                  "astrologer": astrologer,
                  "free": dashboardController.free && astrologer.free == 1,
                  "controller" : dashboardController,
                  "category" : "CHAT"
                });
              }
              else {
                Essential.showBasicDialog("You must have minimum of ${CommonConstants.rupee}${min.ceil()} balance in your wallet. Do you want to recharge?", "Recharge Now", "No, Thanks").then((value) {
                  if(value=="Recharge Now") {
                    dashboardController.goto("/wallet");
                  }
                });
              }
            },
            child: Container(
                alignment: Alignment.center,
                height: standardShortButtonHeight,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: MyColors.colorChat.withOpacity(0.3),
                    border: Border.all(
                        color: MyColors.colorChat
                    ),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/dashboard/chat_filled.png",
                      height: 13,
                      color: MyColors.colorChat,
                    ),
                    Flexible(
                      child: Text(
                        dashboardController.free && astrologer.free==1 ? "FREE" : "${CommonConstants.rupee}${astrologer.p_chat}/${'min'.tr}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: GoogleFonts.manrope(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }

  Widget getAppOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Why AstroGuide?'.tr,
              overflow: TextOverflow.fade,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 16),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: MyColors.colorPCBorder
                )
            ),
            child: Column(
              children: [
                getOptionDesign("connection.png", "Easily connect with Astro".tr, "You can easily connect with astrologer with the help of AstroGuide.".tr),
                getOptionDesign("approved.png", "Privacy guarantee 100%".tr, "AstroGuide provide 100% privacy guarantee to your personal data.".tr),
                getOptionDesign("privacy_policy.png", "Approved Astrologer".tr, "You can talk with 100% verified and approved Astrologer.".tr)
              ],
            ),
          ),
        ],
      ),
    );
  }

  getOptionDesign(String image, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: standardServiceOCRadius,
          backgroundColor: MyColors.backgroundColor(),
          child: Image.asset(
            "assets/astrology/$image",
            height: standardServiceHeight,
            width: standardServiceWidth,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  description,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.manrope(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
