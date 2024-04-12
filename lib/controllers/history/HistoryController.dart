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

  List<SessionHistoryModel> fcall = [];
  List<SessionHistoryModel> fchat = [];

  List<WalletHistoryModel> swallet = [];
  List<WalletHistoryModel> spayment = [];
  List<SessionHistoryModel> scall = [];
  List<SessionHistoryModel> schat = [];

  late double amount;

  TextEditingController search = TextEditingController();
  late int current;
  late int selected;
  late TabController tabController;
  PageController pageController = PageController(initialPage: 0);

  final HistoryRepository historyRepository = Get.put(HistoryRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late HistoryProvider historyProvider;

  late bool load;
  late ScrollController scrollController;

  
  @override
  void onInit() {
    super.onInit();
    current = 0;
    amount = 0;
    selected = 0;
    tabController = TabController(length: 2, vsync: this);
    load = false;
    historyProvider = Get.put(HistoryProvider(historyRepository));
    scrollController = ScrollController();
    start();
  }

  start() {
    getHistory();
  }

  Future<void> getHistory() async {
    await historyProvider.fetch(storage.read("access")??CommonConstants.essential, ApiConstants.user).then((response) async {
      if(response.code==1) {
        amount = response.amount??0;
        wallet = response.wallet??[];
        await storage.write("wallet", amount);
        payment = response.payment??[];
        call = response.call??[];
        chat = response.chat??[];

        fcall = [];
        fchat = [];

        swallet = [];
        spayment = [];
        scall = [];
        schat = [];
        update();

      if(current==0) {
        if(tabController.index==0) {
          getSWallet(0);
        }
        else {
          getSPayment(0);
        }
      }
      else if(current==1) {
          getSCall(0);
        }
        else if(current==2) {
          getSChat(0);
        }
      }
      else {
        Essential.showSnackBar(response.message);
      }

      load = true;
      update();
    });
  }


  Future<void> logout() async {
    await storage.write("access", "essential");
    await storage.write("refresh", "");
    await storage.write("status", "logged out");
    Get.offAllNamed("/login");
  }


  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getHistory();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      getHistory();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeTab(int index) {
    print(index);
    print(tabController.index);
    if(tabController.previousIndex!=index) {
      if (index == 0) {
        getSWallet(0);
      }
      else {
        getSPayment(0);
      }
    }
  }

  void changeMainTab(int index) {
    if(current!=index) {
      current = index;
      selected = 0;
      scrollController.jumpTo(0);
      update();

      if (index == 0) {
        if (tabController.index == 0) {
          getSWallet(0);
        }
        else {
          getSPayment(0);
        }
      }
      else if (index == 1) {
        getSCall(0);
      }
      else if (index == 2) {
        getSChat(0);
      }
    }
  }


  String getDTByStatus(SessionHistoryModel sessionHistory) {
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


  void getSWallet(int i) {
    print("wallet.length");
    print(wallet.length);
    print(i);
    if(i==0) {
      swallet = [];
    }
    if(swallet.length!=wallet.length) {
      swallet.addAll(wallet.sublist(i, wallet.length <= (i + 30) ? wallet.length : (i + 30)));
      load = true;
      update();
    }
  }
  
  void getSPayment(int i) {
    print("payment.length");
    print(payment.length);
    print(i);
    if(i==0) {
      spayment = [];
      update();
    }
    if(spayment.length!=payment.length) {
      spayment.addAll(payment.sublist(i, payment.length <= (i + 30) ? payment.length : (i + 30)));
      load = true;
      update();
    }
  }


  void getSCall(int i) {
    if(i==0) {
      scall = [];
      fcall = selected==0 ? call : call.where((element) {
        if(element.status==CommonConstants.session_status[selected]) {
          return true;
        }
        return false;
      }).toList();
      update();
    }
    print(fcall);
    if(fcall.isNotEmpty && scall.length!=fcall.length) {
      scall.addAll(fcall.sublist(i, fcall.length <= (i + 30) ? fcall.length : (i + 30)));
      load = true;
      update();
    }
  }

  void getSChat(int i) {
    print("chat");
    if(i==0) {
      schat = [];
      fchat = selected==0 ? chat : chat.where((element) {
        if(element.status==CommonConstants.session_status[selected]) {
          return true;
        }
        return false;
      }).toList();
      update();
    }

    if(fchat.isNotEmpty && schat.length!=fchat.length) {
      schat.addAll(fchat.sublist(i, fchat.length <= (i + 30) ? fchat.length : (i + 30)));
      load = true;
      update();
    }
  }

  void getUpdate() {
    if(current==0) {
      if(tabController.index==0) {
        getSWallet(swallet.length);
      }
      else {
        getSPayment(spayment.length);
      }
    }
    else if(current==1) {
      getSCall(scall.length);
    }
    else if(current==2) {
      getSChat(schat.length);
    }
  }

  void changeSelected(int index) {
    if(selected!=index) {
      print(current);
      selected = index;
      update();

      if(current==1) {
        getSCall(0);
      }
      else {
        getSChat(0);
      }
    }
  }
}
