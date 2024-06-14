import 'package:astro_guide/models/notification/NotificationModel.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationsController extends GetxController {
  NotificationsController();

  final storage = GetStorage();

  List<NotificationModel> notifications = [];

  late UserProvider userProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    load = false;
    start();
    super.onInit();
  }

  start() {
    getNotifications();
  }

  void getNotifications() {
    print(storage.read("access"));
    userProvider.fetchNotifications(storage.read("access"), ApiConstants.notification).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        notifications.addAll(response.data ?? []);
      }
      load = true;
      update();
    });
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      // getNotifications();
    });
  }
}