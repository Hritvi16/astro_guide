import 'package:astro_guide/call/JoinScreenController.dart';
import 'package:get/get.dart';

class JoinScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinScreenController>(() => JoinScreenController());
  }
}
