import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/home/PreHomeController.dart';

class PreHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreHomeController>(() => PreHomeController());

    Get.lazyPut<SpecRepository>(() => SpecRepository(Get.find()));
    Get.lazyPut<SpecProvider>(() => SpecProvider(Get.find()));
  }
}
