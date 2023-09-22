import 'dart:async';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/RatingDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/rating/RatingModel.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReviewController extends GetxController {
  ReviewController();

  final storage = GetStorage();
  final AstrologerProvider astrologerProvider = Get.find();

  List<ReviewModel> reviews = [];

  late RatingModel rating;

  late bool load;
  late AstrologerModel astrologer;

  @override
  void onInit() {
    super.onInit();
    load = false;
    astrologer = Get.arguments;
    start();
  }

  start() {
    getReviews();
  }

  Future<void> getReviews() async {
    await astrologerProvider.fetchReviews(storage.read("access"), "${ApiConstants.reviewAPI}${astrologer.id}").then((response) async {
      if(response.code==1) {
        reviews = [];
        reviews.addAll(response.data??[]);
        rating = response.rating!;
      }
      load = true;
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getReviews();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  double getAvgRating() {
    double rating = 0;
    for (var element in reviews) {
      rating+=element.rating;
    }
    print("rating/reviews.length");
    print(rating);
    print(reviews.length);
    print(rating/reviews.length);
    return reviews.isNotEmpty ? rating/reviews.length : 0;
  }

  double getPercentage(int total) {
    return total>0 ? total/getMaxRating() : 0;
  }

  int getMaxRating() {
    int max = rating.rating5;

    if(max<rating.rating4) {
      max = rating.rating4;
    }
    if(max<rating.rating3) {
      max = rating.rating3;
    }
    if(max<rating.rating2) {
      max = rating.rating2;
    }
    if(max<rating.rating1) {
      max = rating.rating1;
    }

    return max;
  }

}
