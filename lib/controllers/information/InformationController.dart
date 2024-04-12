import 'dart:convert';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class InformationController extends GetxController {
  InformationController();

  var unescape = HtmlUnescape();
  String info = "";

  @override
  void onInit() {
    info = utf8.decode(base64Decode(Get.arguments['data']));
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
