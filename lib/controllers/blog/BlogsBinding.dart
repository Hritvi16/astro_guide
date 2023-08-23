import 'package:astro_guide/providers/BlogProvider.dart';
import 'package:astro_guide/repositories/BlogRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/blog/BlogsController.dart';

class BlogsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogsController>(() => BlogsController());

    Get.lazyPut<BlogRepository>(() => BlogRepository(Get.find()));
    Get.lazyPut<BlogProvider>(() => BlogProvider(Get.find()));
  }
}
