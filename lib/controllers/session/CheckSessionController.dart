import 'dart:async';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/constants/KundliConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/controllers/talk/TalkController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/models/session/CheckSessionModel.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/providers/ChatProvider.dart';
import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class CheckSessionController extends GetxController {
  CheckSessionController();

  final storage = GetStorage();

  final ChatProvider chatProvider = Get.find();
  final MeetingProvider meetingProvider = Get.find();

  late AstrologerModel astrologer;

  List<ChatModel> chats = [];

  TextEditingController name = TextEditingController();
  // TextEditingController mobile = TextEditingController();
  late TextEditingController dob = TextEditingController();
  late TextEditingController tob = TextEditingController();
  late DateTime date;
  late String gender;
  late String type;
  late String marital_status;

  List<CityModel> cities = [];
  List<KundliModel> kundlis = [];
  List<RelationModel> relations = [];
  CityModel? city;
  KundliModel? kundli;
  RelationModel? relation;

  late double wallet;
  int? sess_id;
  late bool free;

  // late int astro_id;

  late bool load;

  late CheckSessionModel checkSessionModel;

  late GlobalKey<FormState> formKey;
  late dynamic controller;
  late String category;

  @override
  void onInit() {
    super.onInit();
    astrologer = Get.arguments['astrologer'];
    free = Get.arguments['free'];
    controller = Get.arguments['controller'];
    category = Get.arguments['category'];
    gender = UserConstants.F;
    type =
    marital_status = "";
    wallet = 0;
    date = DateTime.now();
    formKey = GlobalKey<FormState>();
    relations = [RelationModel(id: -1, name: "SELF")];
    load = false;
    start();
  }

  start() {
    checkSession();
  }

  Future<void> checkSession() async {
    Map <String, String> data = {
      SessionConstants.astro_id : astrologer.id.toString(),
    };

    print(data);

    await chatProvider.check(storage.read("access"), ApiConstants.check, data).then((response) async {
      if(response.code==1) {
        sess_id = response.sess_id;
        checkSessionModel = response.data!;
        cities = response.cities??[];
        kundlis = response.kundlis??[];
        relations.addAll(response.relations??[]);
        wallet = response.wallet??0;
        await storage.write("wallet", response.wallet??wallet);
        sess_id = response.sess_id;
        update();
        setDetails();
        // goto("/chat", arguments: {"astrologer" : astrologer, "ch_id" : response.ch_id});
      }
      else if(response.code==0) {
        checkSessionModel = response.data!;
        cities = response.cities??[];
        kundlis = response.kundlis??[];
        relations.addAll(response.relations??[]);
        wallet = response.wallet??0;
        await storage.write("wallet", response.wallet??wallet);
        sess_id = response.sess_id;
        update();
        setDetails();
      }
      else {
        Get.back();
        Essential.showSnackBar(response.message);
      }
    });
  }


  Future<void> initiateSession() async {
    Essential.showLoadingDialog();

    Map <String, dynamic> data = {
      KundliConstants.existing : type==KundliConstants.existing ? 1 : 0,
      KundliConstants.r_id : (relation?.id??-1),
      if(type==KundliConstants.existing)
        KundliConstants.k_id : (kundli?.id??-1),
      KundliConstants.name : name.text,
      KundliConstants.gender : gender,
      KundliConstants.dtob : date.toString(),
      KundliConstants.dob : dob.text,
      KundliConstants.tob : tob.text,
      KundliConstants.ci_id : city!.id.toString(),
      KundliConstants.pob : ("${city?.name}, ${city?.state??""}, ${city?.country??""}").toTitleCase(),
      KundliConstants.marital_status : marital_status,
      SessionConstants.astro_id : astrologer.id,
      SessionConstants.astro_name : astrologer.name,
      SessionConstants.cstatus : sess_id==null ? "fresh" : "old",
      SessionConstants.chat_type : free ? "FREE" : "PAID",
      SessionConstants.category : category,
      if(sess_id!=null)
        SessionConstants.sess_id : sess_id.toString(),
    };

    print(sess_id);
    print(data);

    if(category=="CHAT") {
      await chatProvider.initiate(
          storage.read("access"), ApiConstants.initiate, data).then((
          response) async {
        print(response.toJson());
        Get.back();
        if (response.code == 1) {
          goto("/${category.toLowerCase()}", arguments: {
            "astrologer": astrologer,
            "ch_id": response.ch_id,
            "type": "REQUESTED",
            "action": "REQUESTING",
            SessionConstants.chat_type : free ? "FREE" : "PAID",
          });
        }
        else if (response.code == 0) {
          Get.back();
          Essential.showSnackBar(response.message);
        }
        else if (response.code != -1) {
          Essential.showSnackBar(response.message);
        }
      });
    }
    else {
      await meetingProvider.initiate(storage.read("access"), ApiConstants.initiate, data).then((response) async {
        print(response.toJson());
        Get.back();
        if (response.code == 1) {
          goto("/${category.toLowerCase()}", arguments: {
            "astrologer": astrologer,
            "ch_id": response.ch_id,
            "type": "REQUESTED",
            "action": "REQUESTING",
            "wallet" : wallet,
            SessionConstants.chat_type : free ? "FREE" : "PAID",
            "session_history" : response.session_history?.copyWith(token: response.token)
          });
        }
        else if (response.code == 0) {
          Get.back();
          Essential.showSnackBar(response.message);
        }
        else if (response.code != -1) {
          Essential.showSnackBar(response.message);
        }
      });
    }
  }


  void goto(String page, {dynamic arguments}) {
    Get.offAndToNamed(page, arguments: arguments)?.then((value) {
      print("hugfff");
      controller.onInit();
    });
  }

  void setDOB(value) {
    if(value!=null) {
      date = DateTime(value.year, value.month, value.day, date.hour, date.minute, date.second);
      dob.text = DateFormat("dd MMM, yyyy").format(date);
      update();
    }
  }

  void setTOB(value) {
    if(value!=null) {
      date = DateTime(date.year, date.month, date.day, value.hour, value.minute);
      tob.text = DateFormat("hh:mm a").format(date);
      update();
    }
  }

  void setDetails() {
    if(checkSessionModel.info=="U") {
      type = KundliConstants.nonexisting;
      setUserDetails();
    }
    else {
      type = KundliConstants.existing;
      for (var element in kundlis) {
        if(element.type=="SELF") {
          kundli = element;
          update();
          break;
        }
      }
      setKundliDetails();
    }
  }

  void setUserDetails() {
    name.text = checkSessionModel.name;
    gender = checkSessionModel.gender??UserConstants.F;
    if(checkSessionModel.dob!=null) {
      DateTime temp = DateTime.parse(checkSessionModel.dob??"");
      setDOB(temp);
      if(checkSessionModel.info=="K") {
        setTOB(temp);
        for (var element in cities) {
          if(element.id==checkSessionModel.ci_id) {
            city = element;
          }
        }
        marital_status = checkSessionModel.marital_status??"";
      }
    }
    relation = relations.first;

    if(!load) {
      load = true;
    }
    update();
  }

  void setKundliDetails() {
    name.text = kundli?.name??"";
    gender = kundli?.gender??"";
    DateTime temp = DateTime.parse(kundli?.dob??"");
    setDOB(temp);
    setTOB(temp);
    for (var element in cities) {
      if(element.id==kundli?.ci_id) {
        city = element;
        break;
      }
    }
    if(kundli?.type=="SELF") {
      relation = relations.first;
    }
    else {
      for (var element in relations) {
        if (element.id == kundli?.r_id) {
          relation = element;
          break;
        }
      }
    }
    marital_status = checkSessionModel.marital_status??"";
    if(!load) {
      load = true;
    }
    update();
  }

  void changeCity(CityModel? value) {
    city = value!;
    update();
  }


  void changeKundli(KundliModel? value) {
    kundli = value!;
    update();
    setKundliDetails();
  }

  void changeRelation(RelationModel? value) {
    relation = value!;
    update();
  }

  void changeType(String value) {
    bool change = true;
    if(value==KundliConstants.existing) {
      if(kundlis.isEmpty) {
        change = false;
      }
    }

    if(change) {
      type = value;
      update();
    }
    else {
      Essential.showSnackBar(("You have no existing kundli"));
    }
  }

  void changeMaritalStatus(String status) {
    marital_status = status;
    update();
  }

  void changeGender(String value) {
    gender = value;
    update();
  }

  validate() async {
    if(formKey.currentState!.validate()) {
      if(marital_status.isEmpty) {
        Essential.showSnackBar("Please select your marital status", time: 1);
      }
      else {
        int cnt = await Essential.requestMediaPermission();

        if(cnt==0) {
          initiateSession();
        }
        else {
          Essential.showInfoDialog(
              cnt==1 ? "Permission required for accessing microphone" :
              cnt==2 ? "Permission required for accessing camera" : "Permission required for accessing microphone and camera");
        }
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}
