import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/IconConfirmDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/language/LanguageModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/type/TypeModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:astro_guide/views/home/filter/AstroFilter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TalkController extends GetxController {
  TalkController();

  final storage = GetStorage();
  final SpecRepository specRepository = Get.put(SpecRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late SpecProvider specProvider;

  final AstrologerRepository astrologerRepository = Get.put(AstrologerRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late AstrologerProvider astrologerProvider;

  List<SpecModel> specs = [];
  late SpecModel spec;

  List<String> sort = [];
  late String ssort;

  List<CountryModel> countries = [];
  List<CountryModel> scountries = [];

  List<TypeModel> types = [];
  List<TypeModel> stypes = [];

  List<LanguageModel> langs = [];
  List<LanguageModel> slangs = [];


  List<String> gender = [];
  List<String> sgender = [];


  List<AstrologerModel> astrologers = [];

  TextEditingController search = TextEditingController();

  Timer? countdownTimer;
  late bool free;
  late double wallet;
  late bool load;
  late String order_by;
  late int ivr, video;

  @override
  void onInit() {
    super.onInit();
    print("init");
    specProvider = Get.put(SpecProvider(specRepository));
    astrologerProvider = Get.put(AstrologerProvider(astrologerRepository));
    load = false;

    specs = [SpecModel(id: -1, spec: "All", icon: "all.png", imageFullUrl: '')];
    if(Essential.getPlatform()) {
      spec = specs.first;
    }

    sort = CommonConstants.sort;

    gender = CommonConstants.gender;
    sgender = [];

    free = storage.read("free")??false;
    wallet = double.parse((storage.read("wallet")??0.0).toString());
    ivr = int.parse((storage.read("ivr")??0).toString());
    video = int.parse((storage.read("video")??1).toString());

    if(Get.arguments!=null) {
      if (Get.arguments['title'] == "New Astrologers") {
        ssort = "New";
      }
      else {
        ssort = sort.first;
      }
    }
    else {
      ssort = sort.first;
    }

    start();
  }

  start() {
    getValues();
  }

  // Future<void> getSpecs() async {
  //   await specProvider.fetch(storage.read("access"), ApiConstants.all).then((response) async {
  //     print("specssss");
  //     print(response.toJson());
  //     if(response.code==1) {
  //       specs = [];
  //       specs.add(
  //           SpecModel(id: -1, spec: "All", icon: "all.png")
  //       );
  //       specs.addAll(response.data??[]);
  //
  //       for (var element in specs) {
  //         if(spec.id==element.id) {
  //           await changeSpec(element);
  //         }
  //       }
  //     }
  //     else {
  //       await getAstrologers(0);
  //     }
  //   });
  // }

  Future<void> getValues() async {
    astrologerProvider.fetchValues(storage.read("access"), ApiConstants.values).then((response) async {
      print("valuessss");
      print(response.toJson());
      if(response.code==1) {
        // countries = response.countries??[];
        wallet = response.wallet ?? wallet;
        ivr = response.ivr ?? ivr;
        video = response.video ?? video;
        free = (response.free ?? 1) == 0;
        await storage.write("free", free);
        await storage.write("wallet", wallet);
        await storage.write("ivr", ivr);
        await storage.write("video", video);

        countries = response.countries??[];
        types = response.types??[];
        langs = response.languages??[];

        specs = [];
        specs.add(
          SpecModel(id: -1, spec: "All", icon: "all.png", imageFullUrl: '')
        );

        specs.addAll(response.specifications??[]);
        for (var element in specs) {
          if(spec.id==element.id) {
            await changeSpec(element);
            break;
          }
        }


        if(countries.isNotEmpty && scountries.isNotEmpty) {
          List<CountryModel> temp = scountries;
          scountries = [];

          for (var element in countries) {
            for(var ele in scountries) {
              if(element.id==ele.id) {
                scountries.add(element);
                break;
              }
            }
          }
        }
        else {
          scountries = [];
        }

        if(types.isNotEmpty && stypes.isNotEmpty) {
          List<TypeModel> temp = stypes;
          stypes = [];

          for (var element in types) {
            for(var ele in stypes) {
              if(element.id==ele.id) {
                stypes.add(element);
                break;
              }
            }
          }
        }
        else {
          stypes = [];
        }

        if(langs.isNotEmpty && slangs.isNotEmpty) {
          List<LanguageModel> temp = slangs;
          slangs = [];

          for (var element in langs) {
            for(var ele in slangs) {
              if(element.id==ele.id) {
                slangs.add(element);
                break;
              }
            }
          }
        }
        else {
          slangs = [];
        }
      }
      else {
        await getAstrologers(0);
      }
      update();
    });
  }


  Future<void> getAstrologers(int offset) async {
    String lj = "";
    String ob = "";
    String query = " WHERE a.status = 1";

    if(Get.arguments!=null && Get.arguments['title']=="Live Astrologers") {
      query += " AND sett.online = 1";
    }

    if(spec.id!=-1) {
      query += " AND asp.spec_id = ${spec.id}";
    }

    if(search.text.isNotEmpty) {
      query += " AND UPPER(a.name) LIKE '%${search.text.toUpperCase()}%'";
    }

    if(stypes.isNotEmpty) {
      lj += " LEFT JOIN astro_type at ON a.id = at.astro_id";
      query += " AND ${getTypes()}";
    }
    if(slangs.isNotEmpty) {
      lj += " LEFT JOIN astro_lang al ON a.id = al.astro_id";
      query += " AND ${getLanguages()}";
    }
    if(sgender.isNotEmpty) {
      query += " AND ${getGenders()}";
    }
    if(scountries.isNotEmpty) {
      query += " AND ${getCountries()}";
    }

    Map <String, String> data = {
      ApiConstants.offset : offset.toString(),
      ApiConstants.search : lj+query,
      ApiConstants.order_by : ssort.isNotEmpty ? getSort() : "",
      // if(spec.id!=-1)
      //   AstrologerConstants.spec_id : spec!.id.toString()
    };

    print(data);

    await astrologerProvider.fetchByID(storage.read("access"), spec.id==-1 ? (ApiConstants.user+ApiConstants.all) : ApiConstants.specAPI, data).then((response) async {
      if(response.code==1) {
        if(offset==0) {
          astrologers = [];
        }
        astrologers.addAll(response.data??[]);
      }
      if(load==false) {
        load = true;
      }
      update();
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  Future<void> changeSpec(SpecModel spec) async {
    this.spec = spec;
    update();

    print("hello");
    await getAstrologers(0);
  }

  void manageFavorite(int index) {
    Map <String, String> data = {
      CommonConstants.astro_id : astrologers[index].id.toString()
    };
    print(data);

    astrologerProvider.add(storage.read("access"), ApiConstants.favouriteAPI+(astrologers[index].fav==1 ? ApiConstants.remove : ApiConstants.add), data).then((response) {
      Essential.showSnackBar(response.message, time: 1);
      if(response.code==1) {
        astrologers[index] = astrologers[index].copyWith(fav: astrologers[index].fav==1 ? 0 : 1);
        update();
      }
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getValues();
  }

  void onLoading() async{
  }

  void startTimer() {
    if(countdownTimer!=null) {
      stopTimer();
    }

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      getAstrologers(0);
      stopTimer();
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  void showFilters(BuildContext context) {
    print(gender);
    print(sgender);
    print(sgender);
    Get.bottomSheet(
      isScrollControlled: true,
      AstroFilter(sort, ssort, types, stypes, langs, slangs, gender, sgender, countries, scountries)
    ).then((value) {
      print(value);

      if(value!=null) {
        ssort = value['ssort'];
        stypes = value['stypes'];
        slangs = value['slangs'];
        sgender = value['sgender'];
        scountries = value['scountries'];
        load = false;
        update();
        getAstrologers(0);
      }
    });
  }

  String getTypes() {
    String query = "";
    for (var element in stypes) {
      query+=" ,${element.id}";
    }
    return "at.type_id IN (${query.substring(2, query.length)})";
  }

  String getLanguages() {
    String query = "";
    for (var element in slangs) {
      query+=" ,${element.id}";
    }
    return "al.lang_id IN (${query.substring(2, query.length)})";
  }

  String getGenders() {
    String query = "";
    for (var element in sgender) {
      query+=" ,'$element'";
    }
    return "a.gender IN (${query.substring(2, query.length)})";
  }

  String getCountries() {
    String query = "";
    for (var element in scountries) {
      query+=" ,${element.id}";
    }
    return "st.co_id IN (${query.substring(2, query.length)})";
  }

  String getSort() {
    int ind = sort.indexOf(ssort);
    String query = "";

    if(ind==0) {
      query = "followers DESC";
    }
    else if(ind==1) {
      query = "experience DESC";
    }
    else if(ind==2) {
      query = "experience ASC";
    }
    else if(ind==3) {
      query = "sessions DESC";
    }
    else if(ind==4) {
      query = "sessions ASC";
    }
    else if(ind==5) {
      query = "p_chat DESC";
    }
    else if(ind==6) {
      query = "p_chat ASC";
    }
    else if(ind==7) {
      query = "p_call DESC";
    }
    else if(ind==8) {
      query = "p_call ASC";
    }
    else if(ind==9) {
      query = "rating DESC";
    }
    else if(ind==10) {
      query = "rating ASC";
    }
    else {
      query = "created_at DESC";
    }

    return "ORDER BY $query";
  }

  void selectCallType(TalkController talkController, AstrologerModel astrologer) {
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
          "controller": talkController,
          "category": "CALL",
          "call_type": value=="Voice Call" ? "IVR" : "VIDEO",
        });
      }
    });
  }
}
