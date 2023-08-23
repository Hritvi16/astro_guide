import 'package:astro_guide/controllers/session/CheckSessionController.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/repositories/ChatRepository.dart';
import 'package:astro_guide/repositories/MeetingRepository.dart';
import 'package:get/get.dart';
class CheckSessionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckSessionController>(() => CheckSessionController());

    Get.lazyPut<ChatRepository>(() => ChatRepository(Get.find()));
    Get.lazyPut<ChatProvider>(() => ChatProvider(Get.find()));

    Get.lazyPut<MeetingRepository>(() => MeetingRepository(Get.find()));
    Get.lazyPut<MeetingProvider>(() => MeetingProvider(Get.find()));
  }
}
