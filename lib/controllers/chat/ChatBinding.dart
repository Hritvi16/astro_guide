import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/repositories/ChatRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide/controllers/chat/ChatController.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());

    Get.lazyPut<ChatRepository>(() => ChatRepository(Get.find()));
    Get.lazyPut<ChatProvider>(() => ChatProvider(Get.find()));
  }
}
