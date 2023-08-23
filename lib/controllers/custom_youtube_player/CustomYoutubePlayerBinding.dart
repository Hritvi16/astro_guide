import 'package:astro_guide/controllers/custom_youtube_player/CustomYoutubePlayerController.dart';
import 'package:get/get.dart';

class CustomYoutubePlayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomYoutubePlayerController>(() => CustomYoutubePlayerController());
  }
}
