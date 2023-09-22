import 'package:get/get.dart';
import 'package:astro_guide/controllers/wallet/InvoiceController.dart';
class InvoiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceController>(() => InvoiceController());

  }
}
