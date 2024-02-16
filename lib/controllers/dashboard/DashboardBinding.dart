import 'package:astro_guide/controllers/connectivity/ConnectivityController.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/dashboard/DashboardController.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());
  }
}
