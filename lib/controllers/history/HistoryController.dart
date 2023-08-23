import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/wallet/WalletHistoryModel.dart';
import 'package:astro_guide/providers/HistoryProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/HistoryRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController with GetTickerProviderStateMixin {
  HistoryController();

  final storage = GetStorage();

  List<WalletHistoryModel> wallet = [];
  List<WalletHistoryModel> payment = [];
  List<SessionHistoryModel> call = [];
  List<SessionHistoryModel> chat = [];

  late double amount;

  TextEditingController search = TextEditingController();
  late int current;
  late TabController tabController;
  PageController pageController = PageController(initialPage: 0);

  final HistoryRepository historyRepository = Get.put(HistoryRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late HistoryProvider historyProvider;

  
  @override
  void onInit() {
    super.onInit();
    current = 0;
    amount = 0;
    tabController = TabController(length: 2, vsync: this);

    historyProvider = Get.put(HistoryProvider(historyRepository));

    start();
  }

  start() {
    getHistory();
  }

  Future<void> getHistory() async {
    print("helloooo");
    await historyProvider.fetch(storage.read("access")??CommonConstants.essential, ApiConstants.user).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        amount = response.amount??0;
        wallet = response.wallet??[];
        storage.write("wallet", amount);
        payment = response.payment??[];
        call = response.call??[];
        chat = response.chat??[];
        update();
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void logout() {
    storage.write("access", "essential");
    storage.write("refresh", "");
    storage.write("status", "logged out");
    Get.offAllNamed("/login");
  }


  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getHistory();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments)?.then((value) {
      getHistory();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeTab(int index) {
    tabController.index = index;
    update();
  }

  void changeMainTab(int index) {
    current = index;
    update();
  }


  String getDTByStatus(SessionHistoryModel sessionHistory) {
    print(sessionHistory.status);
    if(sessionHistory.status=="ACTIVE" || sessionHistory.status=="COMPLETED") {
      return sessionHistory.started_at??"";
    }
    else if(sessionHistory.status=="WAITLISTED") {
      return sessionHistory.waitlisted_at??"";
    }
    else if(sessionHistory.status=="CANCELLED") {
      return sessionHistory.cancelled_at??"";
    }
    return sessionHistory.requested_at;
  }
}
