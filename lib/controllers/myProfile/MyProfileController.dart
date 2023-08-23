import 'dart:io';

import 'package:astro_guide/constants/CityConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/StateConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/state/StateModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/providers/CityProvider.dart';
import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/providers/StateProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MyProfileController extends GetxController {
  MyProfileController();

  final storage = GetStorage();
  late GlobalKey<FormState> step1;
  late GlobalKey<FormState> step2;
  late GlobalKey<FormState> step3;

  late int eval1 = 0;
  late int eval2 = 0;
  late int eval3 = 0;

  late TextEditingController name = TextEditingController();
  late TextEditingController mobile = TextEditingController();
  late TextEditingController email = TextEditingController();

  late TextEditingController dob = TextEditingController();
  late DateTime date;
  late String gender;

  late UserModel user;
  List<CountryModel> countries = [];
  CountryModel? country;
  CountryModel? nationality;
  List<StateModel> states = [];
  StateModel? state;
  List<CityModel> cities = [];
  CityModel? city;
  late TextEditingController pincode = TextEditingController();

  XFile? image;

  late CountryProvider countryProvider = Get.find();
  late StateProvider stateProvider = Get.find();
  late CityProvider cityProvider = Get.find();
  late UserProvider userProvider = Get.find();

  late int current;
  late bool load;

  @override
  void onInit() {
    current = 0;
    step1 = GlobalKey<FormState>();
    step2 = GlobalKey<FormState>();
    step3 = GlobalKey<FormState>();

    name = TextEditingController();
    mobile = TextEditingController();
    email = TextEditingController();

    dob = TextEditingController();
    gender = 'FEMALE';

    pincode = TextEditingController();

    countries.add(
      CountryModel(id: 1, name: "INDIA", nationality: "INDIAN", code: "+91")
    );

    load = false;

    start();
    super.onInit();
  }

  start() {
    getMyProfile();
  }

  void getMyProfile() {
    print(storage.read("access"));
    userProvider.fetchSingle(storage.read("access"), ApiConstants.myProfile).then((response) {
      print(response.toJson());
      if(response.code==1) {
        user = response.data!;
        countries = response.countries??[];
        update();
        setUserData();
      }
    });
  }

  void getStates(String id) {
    Map<String, dynamic> data = {
      StateConstant().co_id : id
    };
    stateProvider.fetchList(data, ApiConstants.country, storage.read("access")??CommonConstants.essential).then((response) {
      if(response.code==1) {
        states = response.data??[];

        for (var element in states) {
          if(element.id==user.st_id) {
            changeState(element);
            break;
          }
        }
      }
      update();
    });
  }

  void getCities(String id) {
    Map<String, dynamic> data = {
      CityConstant().st_id : id
    };
    cityProvider.fetchList(data, ApiConstants.state, storage.read("access")??CommonConstants.essential).then((response) {
      if(response.code==1) {
        cities = response.data??[];

        for (var element in cities) {
          if(element.id==user.ci_id) {
            changeCity(element);
            load = true;
          }
        }
      }
      update();
    });
  }

  void onStepCancel() {
    validateStep(current, true);
    current-=1;
    update();
    setCurrentEval(current);
  }

  void onStepContinue() {
    if(current==2) {
      validateStep(current, false);
    }
    else {
      validateStep(current, false);
      current+=1;
      update();
      setCurrentEval(current);
    }
  }

  void validateStep(int current, bool back) {
    if(current==0) {
      print(step1.currentState!.validate());
      if(step1.currentState!.validate() && (image!=null || (user.profile??"").isNotEmpty)) {
        eval1 = 1;
      }
      else {
        eval1 = 2;
      }
    }
    else if(current==1) {
      if(step2.currentState!.validate() && gender.isNotEmpty) {
        eval2 = 1;
      }
      else {
        eval2 = 2;
      }
    }
    else {
      if(step3.currentState!.validate()) {
        eval3 = 1;
        if(!back) {
          validate();
        }
      }
      else {
        eval3 = 2;
      }
    }
    update();
  }

  void setCurrentEval(int current) {
    if(current==0) {
      eval1 = 0;
    }
    else if(current==1) {
      eval2 = 0;
    }
    else {
      eval3 = 0;
    }
    update();
  }

  void changeNationality(CountryModel? value) {
    nationality = value!;
    update();
  }

  void changeCountry(CountryModel? value) {
    country = value!;
    update();
    getStates(country!.id.toString());
  }

  void changeState(StateModel? value) {
    state = value!;
    update();
    getCities(state!.id.toString());
  }

  void changeGender(String gender) {
    this.gender = gender;
    update();
  }

  void changeCity(CityModel? value) {
    city = value!;
    update();
  }

  void setDOB(value) {
    date = value;
    dob.text = DateFormat("dd MMM, yyyy").format(date);
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validate() {
    if(eval1 == 1 && eval2 == 1 && eval3 ==1) {
      updateMyProfile();
    }
  }

  void updateMyProfile() {

    final FormData data = FormData({
      if(image!=null)
        ApiConstants.file : MultipartFile(File(image!.path), filename: image!.name),
      UserConstants.name : name.text,
      UserConstants.mobile : mobile.text,
      UserConstants.email : email.text,
      UserConstants.nationality : nationality!.id,
      UserConstants.dob : date.toString(),
      UserConstants.gender : gender,
      UserConstants.ci_id : city!.id,
      UserConstants.joined_via : UserConstants.jv['C'],
      UserConstants.postal_code : pincode,
    });

    userProvider.add(data, storage.read("access")).then((response) {
      print(response.toJson());
      if(response.code==1) {
        storage.write("access", response.access_token);
        storage.write("refresh", response.refresh_token);
        storage.write("status", "logged in");
        Get.offAllNamed("/home");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void chooseSource() {
    Get.dialog(
      BasicDialog(
        text: "Choose one",
        btn1: "Camera",
        btn2: "Gallery",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Camera") {
        openCamera();
      }
      else if (value == "Gallery") {
        openFiles();
      }
    });
  }


  Future<void> openCamera() async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: ImageSource.camera, imageQuality: 40,);

    if (file != null) {
      image = file;
      update();
    }
  }

  Future<void> openFiles() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFileList = await picker.pickImage(
      imageQuality: 40, source: ImageSource.gallery,
    );

    if (pickedFileList!=null) {
      image = pickedFileList;
      update();
    }
  }

  void setUserData() {
    name.text = user.name;
    mobile.text = user.mobile;
    email.text = user.email??"";
    gender = user.gender??"";
    pincode .text= user.postal_code??"";
    if((user.dob??"").isNotEmpty) {
      setDOB(DateTime.parse(user.dob!));
    }
    for (var element in countries) {
      if(element.id==user.nationality) {
        nationality = element;
      }
      if(element.id==user.co_id) {
        changeCountry(element);
      }
    }
    update();
  }

}
