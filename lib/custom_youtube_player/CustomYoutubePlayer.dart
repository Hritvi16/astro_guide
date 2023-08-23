import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/custom_youtube_player/CustomYoutubePlayerController.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatelessWidget {
  CustomYoutubePlayer({ Key? key }) : super(key: key);

  final CustomYoutubePlayerController customYoutubePlayerController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<CustomYoutubePlayerController>(
      builder: (controller) {
        print(customYoutubePlayerController.video.link);
        return SafeArea(
          child: Scaffold(
            backgroundColor: MyColors.colorBG,
            body: Stack(
              children: [
                YoutubePlayer(
                  controller: customYoutubePlayerController.youtubePlayerController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: MyColors.colorButton,
                  progressColors: ProgressBarColors(
                    playedColor: MyColors.colorButton,
                    handleColor: MyColors.colorPrimary,
                  ),
                  topActions: [
                    GestureDetector(
                      onTap: () {
                        customYoutubePlayerController.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: MyColors.black,
                            shape: BoxShape.circle
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                // if(customYoutubePlayerController.youtubePlayerController.value.isControlsVisible)
                //   Positioned(
                //   top: MySize.sizeh1(context),
                //   left: MySize.size2(context),
                //   child: GestureDetector(
                //     child: Container(
                //       padding: EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //         color: MyColors.colorButton,
                //         shape: BoxShape.circle
                //       ),
                //       child: Icon(
                //         Icons.arrow_back_ios_new_outlined
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          customYoutubePlayerController.video.title,
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: MyColors.black
          ),
        ),
      ),
    );
  }
}
