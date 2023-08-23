import 'package:get/get.dart';
import 'package:astro_guide/controllers/language/LanguageController.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
