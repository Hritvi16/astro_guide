import 'package:get/get.dart';
import 'package:astro_guide/controllers/information/InformationController.dart';

class InformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationController>(() => InformationController());

  }
}
