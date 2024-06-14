import 'package:astro_guide/cache_manager/CacheManager.dart';
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

class RatingController extends GetxController {
  RatingController();

  late SessionHistoryModel sessionHistory;
  late AstrologerModel astrologer;
  late TextEditingController review;


  @override
  void onInit() {
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

  bool validate() {
    return (sessionHistory.rating??0)>0;
  }

  void manageRating() {
    Essential.showLoadingDialog();

    final ChatRepository chatRepository = Get.put(ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final ChatProvider chatProvider = Get.put(ChatProvider(chatRepository));

    Map <String, dynamic> data = {
      SessionConstants.ch_id : sessionHistory.id,
      SessionConstants.rating : sessionHistory.rating,
      SessionConstants.review : review.text.trim(),
      SessionConstants.anonymous : sessionHistory.anonymous??0,
    };

    print(data);

    chatProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
      Get.back();
      if(response.code==1) {
        back(result: sessionHistory.copyWith(review: review.text.trim()));
      }
      else {
        Essential.showSnackBar("Please, try again later");
      }
    });
  }

  void updateRating(double rating) {
    sessionHistory = sessionHistory.copyWith(rating: rating);
    update();
  }

  void back({result}) {
    Get.back(result: result);
  }
}
