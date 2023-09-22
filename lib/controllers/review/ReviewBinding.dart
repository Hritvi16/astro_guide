import 'package:astro_guide/controllers/review/ReviewController.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
