import 'package:astro_guide/controllers/customPDFViewer/CustomPDFViewerController.dart';
import 'package:get/get.dart';

class CustomPDFViewerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomPDFViewerController>(() => CustomPDFViewerController());
  }
}
