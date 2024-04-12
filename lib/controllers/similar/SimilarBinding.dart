import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/similar/SimilarController.dart';

class SimilarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimilarController>(() => SimilarController());

    Get.lazyPut<SpecRepository>(() => SpecRepository(Get.find()));
    Get.lazyPut<SpecProvider>(() => SpecProvider(Get.find()));

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
