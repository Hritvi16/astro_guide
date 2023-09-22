import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/repositories/CountryRepository.dart';
import 'package:astro_guide/repositories/UserRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/changeMobile/ChangeMobileController.dart';

class ChangeMobileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeMobileController>(() => ChangeMobileController());

    Get.lazyPut<CountryRepository>(() => CountryRepository(Get.find()));
    Get.lazyPut<CountryProvider>(() => CountryProvider(Get.find()));

    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));

  }
}
