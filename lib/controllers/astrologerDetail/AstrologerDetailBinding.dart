import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/astrologerDetail/AstrologerDetailController.dart';

class AstrologerDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AstrologerDetailController>(() => AstrologerDetailController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
