import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/video/VideosController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Videos extends StatelessWidget {
  Videos({ Key? key }) : super(key: key);

  final VideosController videosController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<VideosController>(
      builder: (controller) {
        return videosController.load ?
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
                  child: CustomAppBar('Videos'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: videosController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: videosController.videos.isNotEmpty ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child:
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                  itemCount: videosController.videos.length,
                  separatorBuilder: (buildContext, index) {
                    return SizedBox(
                      height: standardVerticalGap,
                    );
                  },
                  itemBuilder: (buildContext, index) {
                    return getVideoDesign(index, videosController.videos[index], context);
                  },
                )

            ) : Center(
              child: Text(
                "There are no videos posted yet",
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

  Widget getVideoDesign(int ind, VideoModel video, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // videosController.goto("/customYoutubePlayer", arguments: "https://www.youtube.com/watch?v=mqqft2x_Aa4");
        videosController.goto("/customYoutubePlayer", arguments: video);
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
                top: 60,
                left: 150,
                child: Image.asset(
                  "assets/player/play.png",
                  height: 48,
                  width: 48,
                ),
              ),
              Positioned(
                bottom: 0,
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
                        width: MySize.size55(context),
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
              )
            ],
          ),
        ),
      ),
    );
  }

}
