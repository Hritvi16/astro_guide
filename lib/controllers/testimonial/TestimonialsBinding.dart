import 'package:astro_guide/providers/TestimonialProvider.dart';
import 'package:astro_guide/repositories/TestimonialRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialsController.dart';

class TestimonialsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestimonialsController>(() => TestimonialsController());

    Get.lazyPut<TestimonialRepository>(() => TestimonialRepository(Get.find()));
    Get.lazyPut<TestimonialProvider>(() => TestimonialProvider(Get.find()));
  }
}
