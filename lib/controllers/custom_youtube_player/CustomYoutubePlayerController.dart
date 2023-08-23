import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayerController extends GetxController {
  CustomYoutubePlayerController();

  final storage = GetStorage();

  late VideoModel video;
  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    super.onInit();
    video = Get.arguments;
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video.link)??"",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void back() {
    Get.back();
  }

}
