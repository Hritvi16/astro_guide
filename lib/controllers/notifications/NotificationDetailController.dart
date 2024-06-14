import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/notification/NotificationModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationDetailController extends GetxController {
  NotificationDetailController();

  final storage = GetStorage();

  late NotificationModel notification;

  late bool load;

  @override
  void onInit() {
    notification = Get.arguments;
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}