import 'package:astro_guide/providers/CityProvider.dart';
import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/providers/StateProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/repositories/CityRepository.dart';
import 'package:astro_guide/repositories/CountryRepository.dart';
import 'package:astro_guide/repositories/StateRepository.dart';
import 'package:astro_guide/repositories/UserRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/signUp/SignUpController.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());

    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));

    Get.lazyPut<CountryRepository>(() => CountryRepository(Get.find()));
    Get.lazyPut<CountryProvider>(() => CountryProvider(Get.find()));

    Get.lazyPut<StateRepository>(() => StateRepository(Get.find()));
    Get.lazyPut<StateProvider>(() => StateProvider(Get.find()));

    Get.lazyPut<CityRepository>(() => CityRepository(Get.find()));
    Get.lazyPut<CityProvider>(() => CityProvider(Get.find()));
  }
}
