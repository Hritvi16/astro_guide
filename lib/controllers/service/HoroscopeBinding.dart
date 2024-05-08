import 'package:astro_guide/controllers/service/FreeKundliController.dart';
import 'package:astro_guide/controllers/service/KundliController.dart';
import 'package:astro_guide/controllers/service/MatchKundliController.dart';
import 'package:astro_guide/controllers/service/NumeroscopeController.dart';
import 'package:astro_guide/providers/HoroscopeProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/repositories/HoroscopeRepository.dart';
import 'package:astro_guide/repositories/UserRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/service/HoroscopeController.dart';

class HoroscopeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HoroscopeController>(() => HoroscopeController());
    Get.lazyPut<NumeroscopeController>(() => NumeroscopeController());
    Get.lazyPut<FreeKundliController>(() => FreeKundliController());
    Get.lazyPut<MatchKundliController>(() => MatchKundliController());
    Get.lazyPut<KundliController>(() => KundliController());

    Get.lazyPut<HoroscopeRepository>(() => HoroscopeRepository(Get.find()));
    Get.lazyPut<HoroscopeProvider>(() => HoroscopeProvider(Get.find()));

    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));
  }
}
