import 'package:astro_guide/providers/VideoProvider.dart';
import 'package:astro_guide/repositories/VideoRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/video/VideosController.dart';

class VideosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosController>(() => VideosController());

    Get.lazyPut<VideoRepository>(() => VideoRepository(Get.find()));
    Get.lazyPut<VideoProvider>(() => VideoProvider(Get.find()));
  }
}
