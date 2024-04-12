import 'package:astro_guide/controllers/call/CallController.dart';
import 'package:get/get.dart';

class GlobalNotifier extends GetxService {
  final showSession = RxString('');
  final showCallInit = RxBool(false);
  late final Rx<CallController?> callController = Rx(null);
  final callingStatus = RxString('');

  void updateValue(String newValue) {
    showSession.value = newValue;
  }

  void updateCallInit(bool newValue) {
    showCallInit.value = newValue;
  }

  void updateCallController(CallController? newValue) {
    callController.value = newValue;
  }

  void updateCallingStatus(String newValue) {
    callingStatus.value = newValue;
  }

}