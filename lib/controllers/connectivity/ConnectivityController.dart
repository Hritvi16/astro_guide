import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity connectivity = Connectivity();
  var isOnline = true;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    final connectivityResult = await connectivity.checkConnectivity();
    updateConnectionStatus(connectivityResult);
  }

  void updateConnectionStatus(List<ConnectivityResult> result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isOnline = true;
        update();
        break;
      case ConnectivityResult.none:
        isOnline = false;
        update();
        break;
      case ConnectivityResult.bluetooth:
        // TODO: Handle this case.
      case ConnectivityResult.ethernet:
        isOnline = true;
        update();
        break;
        // TODO: Handle this case.
      case ConnectivityResult.vpn:
        // TODO: Handle this case.
      case ConnectivityResult.other:
        // TODO: Handle this case.
    }
  }
}
