import 'package:astro_guide/providers/ServiceProvider.dart';
import 'package:astro_guide/repositories/ServiceRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/service/HoroscopeController.dart';

class HoroscopeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HoroscopeController>(() => HoroscopeController());

    Get.lazyPut<ServiceRepository>(() => ServiceRepository(Get.find()));
    Get.lazyPut<ServiceProvider>(() => ServiceProvider(Get.find()));
  }
}
