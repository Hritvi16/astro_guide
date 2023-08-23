import 'package:get/get.dart';
import 'package:astro_guide/controllers/history/HistoryController.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());


  }
}
