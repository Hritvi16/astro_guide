import 'package:astro_guide/providers/TypeProvider.dart';
import 'package:astro_guide/repositories/TypeRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/custom/CustomController.dart';

class CustomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomController>(() => CustomController());

    Get.lazyPut<TypeRepository>(() => TypeRepository(Get.find()));
    Get.lazyPut<TypeProvider>(() => TypeProvider(Get.find()));
  }
}
