import 'package:astro_guide/providers/TestimonialProvider.dart';
import 'package:astro_guide/repositories/TestimonialRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialController.dart';

class TestimonialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestimonialController>(() => TestimonialController());

    Get.lazyPut<TestimonialRepository>(() => TestimonialRepository(Get.find()));
    Get.lazyPut<TestimonialProvider>(() => TestimonialProvider(Get.find()));
  }
}
