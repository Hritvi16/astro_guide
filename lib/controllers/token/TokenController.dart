import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/repositories/ChatRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class TokenController extends GetxController {
  TokenController();

  final storage = GetStorage();

  late SessionHistoryModel sessionHistory;
  late AstrologerModel astrologer;
  late TextEditingController amount;
  late Map<String, String> token_amount;

  late String token;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    token = "";
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeAnonymous(int value) {
    if(value!=(sessionHistory.anonymous??0)) {
      sessionHistory = sessionHistory.copyWith(anonymous: value);
      update();
    }
  }

  void validate() {
    if((token=="CUSTOM" && formKey.currentState!.validate()) || token!="CUSTOM") {
      if(double.parse(amount.text) <= double.parse((storage.read("wallet")??0.0).toString())) {
        manageToken();
      }
      else {
        // Get.back();
        Essential.showInfoDialog("You don't have enough wallet balance to give token of appreciation.");
      }
    }
  }

  void manageToken() {
    Essential.showLoadingDialog();

    final ChatRepository chatRepository = Get.put(ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final ChatProvider chatProvider = Get.put(ChatProvider(chatRepository));

    Map <String, dynamic> data = {
      SessionConstants.ch_id : sessionHistory.id,
      SessionConstants.token_type : token,
      SessionConstants.token_amount : amount.text,
    };

    print(data);

    chatProvider.manage(storage.read("access"), ApiConstants.tokenAPI, data).then((response) async {
      Get.back();
      if(response.code==1) {
        back(result: sessionHistory.copyWith(token_type: token, token_amount: int.parse(amount.text)));
      }
      else {
        Essential.showSnackBar("Please, try again later");
      }
    });
  }

  void back({result}) {
    Get.back(result: result);
  }

  void selectToken(String title) {
    token = title;
    amount.text = token_amount[title]!;
    update();
  }
}
