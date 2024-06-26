import 'package:astro_guide/constants/AstrologerConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/IconConfirmDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/gallery/GalleryModel.dart';
import 'package:astro_guide/models/rating/RatingModel.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/models/type/TypeModel.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/language/LanguageModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:astro_guide/cache_manager/CacheManager.dart';

class AstrologerDetailController extends GetxController {
  AstrologerDetailController();

  final storage = GetStorage();

  late AstrologerProvider astrologerProvider = Get.find();

  late AstrologerModel astrologer;
  late RatingModel rating;
  late List<AstrologerModel> similar;
  late List<LanguageModel> languages;
  late List<SpecModel> specifications;
  late List<TypeModel> types;
  late List<ReviewModel> reviews;
  late List<GalleryModel> galleries;

  late bool load;
  late bool read;

  late String id;
  late bool show;

  late bool free;
  late double wallet;
  late int ivr, video;

  @override
  void onInit() {
    print("Get.argumentssss");
    print(Get.arguments);
    print(Get.parameters);
    if(Get.arguments!=null) {
      id = Get.arguments;
    }
    load = false;
    similar = [];
    languages = [];
    specifications = [];
    types = [];
    read = false;
    show = false;

    free = storage.read("free")??false;
    wallet = double.parse((storage.read("wallet")??0.0).toString());
    ivr = int.parse((storage.read("ivr")??0).toString());
    video = int.parse((storage.read("video")??1).toString());

    start();
    super.onInit();
  }

  start() {
    getAstrologer("start");
  }


  Future<void> getAstrologer(String type, {String? id}) async {
    print("get Astrologer $type");
    Map <String, String> data = {
      AstrologerConstants.id : id??this.id
    };

    print(data);

    await astrologerProvider.fetchSingle(storage.read("access"), ApiConstants.id, data).then((response) async {
      print(response.toJson());
      print(response.types);
      if(response.code==-3) {
        Essential.showSnackBar(response.message, code: response.code, time: response.code==-3 ? 3 : null);
      }
      else {
        if (response.code == 1) {
          astrologer = response.astrologer!;
          rating = response.rating!;
          languages = response.languages ?? [];
          specifications = response.specifications ?? [];
          types = response.types ?? [];
          reviews = response.reviews ?? [];
          galleries = response.galleries ?? [];
          similar = response.similar ?? [];
          wallet = response.wallet ?? wallet;

          print("response.ivr");
          print(response.ivr);
          ivr = response.ivr ?? ivr;
          video = response.video ?? video;
          free = (response.free ?? 1) == 0;
          await storage.write("free", free);
          await storage.write("wallet", wallet);
          await storage.write("ivr", ivr);
          await storage.write("video", video);
        }
        load = true;
        update();
      }
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getAstrologer("refresh");
  }

  @override
  void dispose() {
    super.dispose();
  }


  void manageFavorite({int? index}) {
    Map <String, String> data = {
      CommonConstants.astro_id : index==null ? astrologer.id.toString() : similar[index].id.toString()
    };
    print(data);

    astrologerProvider.add(storage.read("access"), ApiConstants.favouriteAPI+(astrologer.fav==1 ? ApiConstants.remove : ApiConstants.add), data).then((response) {
      Essential.showSnackBar(response.message, time: 1);
      if(response.code==1) {
        astrologer = astrologer.copyWith(fav: astrologer.fav==1 ? 0 : 1);
        update();
      }
    });
  }

  void manageFollow() {
    Map <String, String> data = {
      CommonConstants.astro_id : astrologer.id.toString()
    };
    print(data);

    astrologerProvider.add(storage.read("access"), ApiConstants.followAPI+(astrologer.follow==1 ? ApiConstants.remove : ApiConstants.add), data).then((response) {
      Essential.showSnackBar(response.message, time: 1);
      if(response.code==1) {
        astrologer = astrologer.copyWith(follow: astrologer.follow==1 ? 0 : 1);
        update();
      }
    });
  }

  String getTypes() {
    String type = types.isNotEmpty ? types.first.type : "";
    for(int i=1; i<types.length; i++) {
      type+=", ${types[i].type}";
    }
    return type;
  }

  void changeRead() {
    read = !read;
    update();
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

  void goto(String page, {dynamic arguments, String? id}) {
    Get.toNamed(page, arguments: arguments, preventDuplicates: false)?.then((value) {
      print("goto iddddd $id");
      if(id!=null) {
        this.id = id;
      }

      wallet = double.parse((storage.read("wallet")??0.0).toString());
      print("objecttt");
      getAstrologer("goto", id: id);
    });
  }

  List<String> getImages(int index) {
    List<String> image = [];
    for (int i=index; i<galleries.length; i++) {
      image.add(ApiConstants.astrologerUrl+galleries[i].image);
    }
    if(index>0) {
      for (int i=0; i<index; i++) {
        image.add(ApiConstants.astrologerUrl+galleries[i].image);
      }
    }
    return image;
  }

  void changeShow() {
    show = !show;
    update();
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

  void selectCallType(AstrologerDetailController astrologerDetailController, AstrologerModel astrologer) {
    Get.dialog(
      const IconConfirmDialog(
        title: "Select Call Type",
        text: "",
        btn1: "Voice Call",
        btn2: "Video Call",
        icon1: Icons.call,
        icon2: Icons.videocam_rounded,
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value!=null) {
        goto("/checkSession", arguments: {
          "astrologer": astrologer,
          "free": free && astrologer.free == 1,
          "controller": astrologerDetailController,
          "category": "CALL",
          "call_type": value=="Voice Call" ? "IVR" : "VIDEO",
        });
      }
    });
  }
}
