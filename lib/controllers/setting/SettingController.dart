import 'package:astro_guide/constants/AstrologerConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/theme/ThemesController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/languages/Languages.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/banner/BannerModel.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/models/setting/SettingModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/DashboardProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/DashboardRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:astro_guide/repositories/UserRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:astro_guide/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  SettingController();

  final storage = GetStorage();

  final ThemesController themesController = Get.find();

  final UserRepository userRepository = Get.put(UserRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late UserProvider userProvider;
  late SettingModel setting;
  late UserModel user;
  late Map<String, String> languages;



  @override
  void onInit() {
    super.onInit();
    languages = Languages().languages;
    userProvider = Get.put(UserProvider(userRepository));
    // user = storage.read("user");
    user = UserModel(id: -1, name: "", profile: "profile", mobile: '');
    start();
  }

  start() {
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    await userProvider.settings(storage.read("access"), ApiConstants.settings).then((response) async {
      print(response.toJson());


      if(response.code==1) {
        setting = response.data!;
        user = response.user!;
        update();
      }
      else if(response.code!=-1){
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
    await getUserDetails();
    // await getSpecs();
  }

  void onLoading() async{
  }


  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

}
