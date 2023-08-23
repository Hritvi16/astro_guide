import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/repositories/MeetingRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/call/CallController.dart';

class CallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallController>(() => CallController());

    Get.lazyPut<MeetingRepository>(() => MeetingRepository(Get.find()));
    Get.lazyPut<MeetingProvider>(() => MeetingProvider(Get.find()));
  }
}
