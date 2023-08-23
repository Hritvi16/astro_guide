import 'package:astro_guide/cache_manager/CacheManager.dart';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/constants/SupportConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/providers/SupportProvider.dart';
import 'package:astro_guide/repositories/ChatRepository.dart';
import 'package:astro_guide/repositories/SupportRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportRatingController extends GetxController {
  SupportRatingController();

  late SupportModel support;
  late TextEditingController review;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool validate() {
    return (support.rating??0)>0;
  }

  void manageRating() {
    final SupportRepository supportRepository = Get.put(SupportRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final SupportProvider supportProvider = Get.put(SupportProvider(supportRepository));

    Map <String, dynamic> data = {
      SupportConstants.sup_id : support.id,
      SupportConstants.rating : support.rating,
      SupportConstants.review : review.text.trim(),
    };

    supportProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
      if(response.code==1) {
        back(result: support.copyWith(review: review.text.trim()));
      }
      else {
        Essential.showSnackBar("Please, try again later");
      }
    });
  }


  void back({result}) {
    Get.back(result: result);
  }


  void updateRating(double rating) {
    support = support.copyWith(rating: rating);
    update();
  }
}
