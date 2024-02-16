import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/blog/BlogsController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
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


class Blogs extends StatelessWidget {
  Blogs({ Key? key }) : super(key: key);

  final BlogsController blogsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<BlogsController>(
      builder: (controller) {
        return blogsController.load ?
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
                  image: Essential.getPlatform() ?
                  const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  ) : null
              ),
              child: SafeArea(
                  child: CustomAppBar('Blogs'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: blogsController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: blogsController.blogs.isNotEmpty ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child:
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                  itemCount: blogsController.blogs.length,
                  separatorBuilder: (buildContext, index) {
                    return SizedBox(
                      height: standardVerticalGap,
                    );
                  },
                  itemBuilder: (buildContext, index) {
                    return getBlogDesign(index, blogsController.blogs[index], context);
                  },
                )

            ) : Center(
              child: Text(
                "There are no blogs posted yet",
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

  Widget getBlogDesign(int ind, BlogModel blog, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // dashboardController.goto("/blog", arguments: blog.id);
      },
      child: Container(
        height: standardBlogHeight,
        width: MySize.size100(context),
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
                width: MySize.size100(context),
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
                      color: MyColors.black,
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
                blogsController.goto("/blog", arguments: blog.id);
              },
              child: standardButton(
                context: context,
                backgroundColor: MyColors.white,
                borderColor: MyColors.colorButton,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                child: Text(
                  'Read More'.tr,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.black,
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

}
