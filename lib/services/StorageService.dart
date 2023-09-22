import 'package:astro_guide/controllers/call/CallController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService{


  static void storeCalling(CallController callController) {
    final storage = GetStorage();

    storage.write("calling", callController);
  }

}
