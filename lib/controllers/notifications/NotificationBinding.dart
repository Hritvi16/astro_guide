import 'package:astro_guide/controllers/notifications/NotificationsController.dart';
import 'package:astro_guide/controllers/notifications/NotificationDetailController.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/repositories/UserRepository.dart';
import 'package:get/get.dart';


class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<NotificationDetailController>(() => NotificationDetailController());

    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));

  }
}
