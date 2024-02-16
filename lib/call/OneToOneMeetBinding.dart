import 'package:astro_guide/call/OneToOneMeetController.dart';
import 'package:get/get.dart';

class OneToOneMeetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneToOneMeetController>(() => OneToOneMeetController());
  }
}
