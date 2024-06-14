import 'package:astro_guide/constants/AstrologerConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/connectivity/ConnectivityController.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/IconConfirmDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/banner/BannerModel.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/notifier/GlobalNotifier.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/DashboardProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/DashboardRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:just_audio/just_audio.dart' as p;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class DashboardController extends GetxController {
  DashboardController();

  final storage = GetStorage();

  final SpecRepository specRepository = Get.put(SpecRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late SpecProvider specProvider;

  final AstrologerRepository astrologerRepository = Get.put(AstrologerRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late AstrologerProvider astrologerProvider;

  final DashboardRepository dashboardRepository = Get.put(DashboardRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late DashboardProvider dashboardProvider;

  List<SpecModel> specs = [];
  late SpecModel spec;


  final ConnectivityController connectivityController = Get.put<ConnectivityController>(ConnectivityController());

  List<AstrologerModel> astrologers = [];
  List<AstrologerModel> live = [];
  List<AstrologerModel> news = [];
  List<BannerModel> banners = [];
  List<BlogModel> blogs = [];
  List<VideoModel> videos = [];
  List<TestimonialModel> testimonials = [];


  TextEditingController search = TextEditingController();

  late bool free;
  late double wallet;
  late int ivr, video;
  late UserModel user;
  SessionHistoryModel? session;

  late bool load;

  final GlobalNotifier globalNotifier = Get.find();

  final player = p.AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    load = false;
    globalNotifier.showSession.listen((value) {
      updateDashboard(value);
    });

    specProvider = Get.put(SpecProvider(specRepository));
    specs.add(
        SpecModel(id: -1, spec: "All", icon: "all.png", imageFullUrl: '')
    );
    spec = specs.first;

    astrologerProvider = Get.put(AstrologerProvider(astrologerRepository));
    dashboardProvider = Get.put(DashboardProvider(dashboardRepository));

    start();
  }

  start() {
    getDashboard();
  }

  Future<void> getDashboard() async {
    // if(connectivityController.isOnline) {
      await dashboardProvider.fetch(storage.read("access"), "").then((response) async {

        print("response ${response.toJson()}");

        await storage.write("free", (response.user?.free ?? 1) == 0);
        await storage.write("wallet", response.user?.amount ?? 0);
        await storage.write("ivr", response.user?.ivr ?? 0);
        await storage.write("video", response.user?.video ?? 1);
        free = (response.user?.free ?? 1) == 0;
        if(free && storage.read("popup")!=true) {
          storage.write("popup", true);
          Essential.showTitleInfoDialog("Free Chat","Your first session with astrologer is free! Chat Now!", "Chat Now").then((value) {
            print(value);
            if(value=="Chat Now") {
              gotoOff("/home", arguments: {"index" : 1, "title" : "Talk Astrologer"});
            }
          });
        }
        wallet = response.user?.amount ?? 0;
        ivr = response.user?.ivr ?? 0;
        video = response.user?.video ?? 1;
        print(free);
        update();
        if (response.code == 1) {
          banners = response.banners ?? [];
          await setSpecs(response.specifications);
          live = response.live_astrologers ?? [];
          news = response.new_astrologers ?? [];
          blogs = response.blogs ?? [];
          videos = response.videos ?? [];
          testimonials = response.testimonials ?? [];
          user = response.user!;
          session = response.session;
          manageRing(response.session);
          await storage.write("user", user);
        }
        else if (response.code != -1) {
          Essential.showSnackBar(response.message, code: response.code, time: response.code==-3 ? 3 : null);
        }
        load = true;
        update();
      });
    // }
    // else {
    //   Essential.showSnackBar("No internet connection");
    // }
  }

  Future<void> getSpecs() async {
    await specProvider.fetch(storage.read("access")??CommonConstants.essential, ApiConstants.all).then((response) async {
      if(response.code==1) {
        specs = [];
        specs.add(
            SpecModel(id: -1, spec: "All", icon: "all.png", imageFullUrl: '')
        );
        specs.addAll(response.data??[]);

        for (var element in specs) {
          if(spec.id==element.id) {
            await changeSpec(element);
          }
        }
      }
      else {
        await getDashboardAstrologers();
      }
    });
  }

  Future<void> getDashboardAstrologers() async {
    if (spec.id == -1) {
      await dashboardProvider.fetch(storage.read("access"), ApiConstants.astrologerAPI + ApiConstants.all).then((response) async {
        if (response.code == 1) {
          live = response.live_astrologers ?? [];
          news = response.new_astrologers ?? [];
          update();
        }
        else if(response.code!=-1){
          Essential.showSnackBar(response.message);
        }
      });
    }
    else {
      Map <String, String> data = {
        AstrologerConstants.spec_id: spec!.id.toString()
      };

      await dashboardProvider.fetchByID(storage.read("access"), ApiConstants.astrologerAPI + ApiConstants.specAPI, data).then((response) async {
        if (response.code == 1) {
          live = response.live_astrologers ?? [];
          news = response.new_astrologers ?? [];
          update();
        }
        else if(response.code!=-1){
          Essential.showSnackBar(response.message);
        }
      });
    }
  }

  Future<void> getAstrologers(int offset) async {
    String query = "";
    if(search.text.isNotEmpty) {
      query = "UPPER(a.name) LIKE '%${search.text.toUpperCase()}%'";
      if(spec.id==-1) {
        query = " WHERE ${query}";
      }
      else {
        query = " AND ${query}";
      }
    }

    Map <String, String> data = {
      ApiConstants.offset : offset.toString(),
      ApiConstants.search : query,
      if(spec.id!=-1)
        AstrologerConstants.spec_id : spec!.id.toString()
    };

    print(data);

    await astrologerProvider.fetchByID(storage.read("access"), spec.id==-1 ? (ApiConstants.user+ApiConstants.all) : ApiConstants.specAPI, data).then((response) async {
      if(response.code==1) {
        if(offset==0) {
          astrologers = [];
        }
        astrologers.addAll(response.data??[]);
        astrologers.addAll(response.data??[]);
        astrologers.addAll(response.data??[]);
        astrologers.addAll(response.data??[]);
        astrologers.addAll(response.data??[]);
        astrologers.addAll(response.data??[]);
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
      update();
    });
  }

  Future<void> changeSpec(SpecModel spec) async {
    this.spec = spec;
    update();

    await getDashboardAstrologers();
  }

  Future<void> logout() async {
    await storage.write("access", "essential");
    await storage.write("refresh", "");
    await storage.write("status", "logged out");
    Get.offAllNamed("/login");
  }


  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 1));
    await getDashboard();
    // await getSpecs();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    print(page);
    if(page.contains("chat") || page.contains("call")) {
      manageRing(null);
    }
    Get.toNamed(page, arguments: arguments)?.then((value) {
      getDashboard();
    });
  }

  void gotoOff(String page, {dynamic arguments}) {
    print(page);
    Get.offAllNamed(page, arguments: arguments);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> setSpecs(List<SpecModel>? list) async {
    specs = [];
    specs.add(
        SpecModel(id: -1, spec: "All", icon: "all.png", imageFullUrl: '')
    );
    specs.addAll(list??[]);

    for (var element in specs) {
      if(spec.id==element.id) {
        await changeSpec(element);
      }
    }
  }

  void updateDashboard(value) {
    print("sswebnotifier dashboard: $value");
    if(globalNotifier.showSession.value=="session") {
      getDashboard();
      globalNotifier.updateValue("");
    }
  }

  void manageRing(SessionHistoryModel? session) {
    if(session!=null && session?.status=="REQUESTED") {
      player.setAsset("assets/audio/notification.mp3");
      player.play();
      player.processingStateStream.listen((processingState) {
        if (processingState == ProcessingState.completed) {
          player.seek(Duration.zero);
          player.play();
          update();
          print("ringinggggg started");
        }
      });
    }
    else {
      if(player.playing) {
        player.stop();
        update();
        print("ringinggggg stopped");
      }
    }
  }

  void selectCallType(DashboardController dashboardController, AstrologerModel astrologer) {
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
          "controller": dashboardController,
          "category": "CALL",
          "call_type": value=="Voice Call" ? "IVR" : "VIDEO",
        });
      }
    });
  }
}
