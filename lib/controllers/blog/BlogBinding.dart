import 'package:astro_guide/providers/BlogProvider.dart';
import 'package:astro_guide/repositories/BlogRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/blog/BlogController.dart';

class BlogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(() => BlogController());

    Get.lazyPut<BlogRepository>(() => BlogRepository(Get.find()));
    Get.lazyPut<BlogProvider>(() => BlogProvider(Get.find()));
  }
}
