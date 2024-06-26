import 'dart:io';

import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CityConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/StateConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/state/StateModel.dart';
import 'package:astro_guide/notification_helper/NotificationHelper.dart';
import 'package:astro_guide/providers/CityProvider.dart';
import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/providers/StateProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/views/country/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class SignUpController extends GetxController {
  SignUpController();

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
  DateTime? date;
  late String gender;

  // List<CountryModel> countries = [];
  // CountryModel? country;
  CountryModel? nationality;
  late CountryModel code;
  // List<StateModel> states = [];
  // StateModel? state;
  List<CityModel> cities = [];
  CityModel? city;
  late TextEditingController pincode = TextEditingController();

  XFile? image;

  late CountryProvider countryProvider = Get.find();
  late StateProvider stateProvider = Get.find();
  late CityProvider cityProvider = Get.find();
  late UserProvider userProvider = Get.find();

  late int current;
  late bool process;

  @override
  void onInit() {
    current = 0;
    step1 = GlobalKey<FormState>();
    step2 = GlobalKey<FormState>();
    step3 = GlobalKey<FormState>();

    name = TextEditingController();
    mobile = TextEditingController(text: Get.arguments['mobile']);
    email = TextEditingController();

    dob = TextEditingController();
    gender = 'FEMALE';

    pincode = TextEditingController();

    // countries = [
    //   CountryModel(id: -1, name: "India", nationality: "Indian", icon: "assets/country/India.png", code: "+91", imageFullUrl: "assets/country/India.png")
    // ];
    // code = countries.first;
    code = Get.arguments['nationality'];
    nationality = Get.arguments['nationality'];


    process = false;

    start();
    super.onInit();
  }

  start() {
    getCities();
  }

  // void getCountries() {
  //   Map<String, dynamic> data = {
  //     ApiConstants.act : ApiConstants.all,
  //   };
  //   countryProvider.fetchList(storage.read("access")).then((response) {
  //     print(response.toJson());
  //     if(response.code==1) {
  //       countries = response.data??[];
  //       for (var value in countries) {
  //         if(value.code.toUpperCase()==Get.arguments['code']) {
  //           code = value;
  //           break;
  //         }
  //       }
  //     }
  //     update();
  //   });
  // }

  // void getStates(String id) {
  //   Map<String, dynamic> data = {
  //     StateConstant().co_id : id
  //   };
  //   stateProvider.fetchList(data, ApiConstants.country, storage.read("access")??CommonConstants.essential).then((response) {
  //     if(response.code==1) {
  //       states = response.data??[];
  //     }
  //     update();
  //   });
  // }

  // void getCities(String id) {
  //   Map<String, dynamic> data = {
  //     CityConstant().st_id : id
  //   };
  //   cityProvider.fetchList(data, ApiConstants.state, storage.read("access")??CommonConstants.essential).then((response) {
  //     if(response.code==1) {
  //       cities = response.data??[];
  //     }
  //     update();
  //   });
  // }

  void getCities() {
    cityProvider.fetchAll(ApiConstants.all, storage.read("access")??CommonConstants.essential).then((response) {
      if(response.code==1) {
        cities = response.data??[];
      }
      update();
    });
  }

  void onStepCancel() {
    if(process==false) {
      validateStep(current, false);
      current -= 1;
      update();
      setCurrentEval(current);
    }
  }

  void onStepContinue() {
    if(process==false) {
      if (current == 2) {
        validateStep(current, true);
      }
      else {
        validateStep(current, false);
        current += 1;
        update();
        setCurrentEval(current);
      }
    }
  }

  void validateStep(int current, bool proceed) {
    if(current==0) {
      print(step1.currentState!.validate());
      if(step1.currentState!.validate()) {
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
        if(proceed) {
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

  // void changeCountry(CountryModel? value) {
    // country = value!;
    // state = null;
    // city = null;
    // update();
    // getStates(country!.id.toString());
  // }

  // void changeState(StateModel? value) {
  //   state = value!;
  //   city = null;
  //   update();
  //   getCities(state!.id.toString());
  // }

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
    dob.text = DateFormat("dd MMM, yyyy").format(date!);
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validate() {
    if(eval1 == 1 && eval2 == 1 && eval3 ==1) {
      register();
    }
  }

  Future<void> register() async {
    // process = true;
    // update();
    Essential.showLoadingDialog();

    final FormData data = FormData({
      if(image!=null)
        ApiConstants.file : MultipartFile(File(image!.path), filename: image!.name),
      UserConstants.name : name.text,
      UserConstants.mobile : code.code+"-"+mobile.text,
      UserConstants.email : email.text,
      UserConstants.nationality : nationality!.id,
      UserConstants.dob : date.toString(),
      UserConstants.gender : gender,
      UserConstants.ci_id : city!.id,
      UserConstants.joined_via : UserConstants.jv['C'],
      UserConstants.postal_code : pincode.text,
      UserConstants.fcm : await NotificationHelper.generateFcmToken()
    });

    print(nationality);
    print(data.fields);

    userProvider.add(data, ApiConstants.add, storage.read("access")).then((response) async {
      print(response.toJson());
      // process = false;
      // update();
      Get.back();

      if(response.code==1) {
        await storage.write("access", response.access_token);
        await storage.write("refresh", response.refresh_token);
        await storage.write("status", "logged in");
        Get.offAllNamed(Essential.getPlatform() ? '/home' : '/preHome');
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void chooseSource(BuildContext context) {
    Get.dialog(
      BasicDialog(
        text: "Choose one",
        btn1: "Camera",
        btn2: "Gallery",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Camera") {
        pickImage(ImageSource.camera, context);
      }
      else if (value == "Gallery") {
        pickImage(ImageSource.gallery, context);
        // openFiles();
      }
    });
  }



  Future<void> pickImage(ImageSource imageSource, BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: imageSource, imageQuality: 40,);

    if (file != null) {
      image = file;
      update();

      Uint8List? imageBytes = await image?.readAsBytes();

      if(imageBytes!=null) {
        ImageCropping.cropImage(
            context: context,
            imageBytes: imageBytes!,
            onImageDoneListener: (data) async {
              imageBytes = data;

              final tempDir = await getTemporaryDirectory();
              final tempPath = path.join(tempDir.path, '${DateTime.now().millisecondsSinceEpoch}.png');

              final file = File(tempPath);
              await file.writeAsBytes(imageBytes!);

              image = XFile(file.path);
              update();

            },
            customAspectRatios: [
              const CropAspectRatio(
                ratioX: 4,
                ratioY: 5,
              ),
            ],
            onImageStartLoading: showLoader,
            onImageEndLoading: hideLoader,
            visibleOtherAspectRatios: true,
            squareBorderWidth: 2,
            isConstrain: false,
            squareCircleColor: MyColors.red,
            defaultTextColor: MyColors.black,
            selectedTextColor: MyColors.orange,
            colorForWhiteSpace: MyColors.white,
            makeDarkerOutside: true,
            outputImageFormat: OutputImageFormat.jpg,
            encodingQuality: 10);
      }

      // updateProfile();
    }
  }
  void showLoader() {
    if (EasyLoading.isShow) {
      return;
    }
    EasyLoading.show(status: "Loading");
  }

  /// To hide loader
  void hideLoader() {
    EasyLoading.dismiss();
  }


  // void changeCode() {
  //   Get.bottomSheet(
  //       isScrollControlled: true,
  //       Country(countries, code)
  //   ).then((value) {
  //     print(value);
  //
  //     if(value!=null) {
  //       countries = value['countries'];
  //       code = value['country'];
  //       update();
  //     }
  //   });
  // }
}
