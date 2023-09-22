
import 'dart:io';

import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/login/LoginModel.dart';
import 'package:astro_guide/notification_helper/NotificationHelper.dart';
import 'package:astro_guide/notification_helper/NotificationHelper2.dart';
import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/views/country/Country.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class LoginController extends GetxController {
  LoginController();

  final storage = GetStorage();

  final GoogleSignIn googleSignIn = GoogleSignIn(
      // serverClientId: "170894307366-1121stmp5mna8q9illqf4r7p7e7okuea.apps.googleusercontent.com",
    clientId: Essential.getGoogleClientID()
  );
  final FacebookAuth facebookAuth = FacebookAuth.instance;

  final TextEditingController mobile = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();

  late UserProvider userProvider = Get.find();
  late CountryProvider countryProvider = Get.find();
  late List<CountryModel> countries;
  late CountryModel country;

  @override
  void onInit() {
    // taketo();
    countries = [
      CountryModel(id: -1, name: "India", nationality: "Indian", icon: "assets/country/India.png", code: "+91", imageFullUrl: "assets/country/India.png")
    ];
    country = countries.first;
    getCountries();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void getCountries() {
    countryProvider.fetchList(storage.read("access")).then((response) {
      print(response.toJson());
      if(response.code==1) {
        countries = response.data??[];
        for (var value in countries) {
          if(value.name.toUpperCase()=="INDIA") {
            country = value;
            break;
          }
        }
        update();
      }
    });
  }


  goto(String path, dynamic data, {LoginModel? loginModel}) {
    print(path);
    Get.toNamed(path, arguments: data)?.then((value) {
      userProvider = Get.find();
      update();
      if(value=="verified") {
        login();
      }
    });
  }

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        loginWithSocial(googleUser);
        // Use the `credential` to authenticate with Firebase or your backend server
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> loginWithApple() async {
    // final appleKey = File('key/AuthKey_3653MA9W6M.p8');
    // final keyString = await appleKey.readAsString();
    // final privateKey = decodePrivateKey(keyString);
    print(await SignInWithApple.isAvailable());

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      // webAuthenticationOptions: WebAuthenticationOptions(
      //   clientId: Constants.appleClientId,
      // ),
    );

    print(credential);
  }


  Future<void> loginWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: [
        'email', 'public_profile'
      ]
    );

    print(loginResult);
    print(loginResult.message);
    print(loginResult.status.toString());
    print(loginResult.accessToken);

    // Create a credential from the access token
    // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    print(await FacebookAuth.instance.getUserData());
    // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<File> download(String url) async {
    final response = await http.get(Uri.parse(url));

    // Get the image name
    final imageName = path.basename(url);
    // Get the document directory path
    final appDir = await getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = path.join(appDir.path, imageName);

    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);
    return imageFile;
  }


  void register(String name, String email, String jv, File? image) {
    final FormData data = FormData({
      ApiConstants.file : MultipartFile(File(image!.path), filename: image!.path),
      UserConstants.name : name,
      UserConstants.mobile : "",
      UserConstants.email : email,
      UserConstants.nationality : "",
      UserConstants.dob : "",
      UserConstants.gender : "",
      UserConstants.ci_id : "",
      UserConstants.joined_via : jv,
      UserConstants.postal_code : "",
    });

    print(data.fields);
    print(data.files);

    userProvider.add(data, ApiConstants.add, storage.read("access")??CommonConstants.essential).then((response) {
      print(response.toJson());
      if(response.code==1) {
        goToHome(response);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void loginWithSocial(GoogleSignInAccount googleUser) {
    final Map<String, String> data = {
      UserConstants.email : googleUser.email
    };

    print(data);
    print(storage.read("access"));

    userProvider.login(data, storage.read("access"), ApiConstants.socialLogin).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goToHome(response);
      }
      else if(response.code==2) {
        File? image = await download(googleUser.photoUrl!);
        register(googleUser.displayName??"", googleUser.email, UserConstants.jv['G']!, image);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> verify() async {
    final Map<String, String> data = {
      UserConstants.mobile : country.code+"-"+mobile.text,
    };

    print(data);

    userProvider.login(data, CommonConstants.essential, ApiConstants.verify).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goto("/otp", {"mobile" : mobile.text, "code" : country.code}, loginModel: response);
        // goToHome(response);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> login() async {
    final Map<String, String> data = {
      UserConstants.mobile : country.code+"-"+mobile.text,
      UserConstants.fcm : await NotificationHelper.generateFcmToken()
    };

    print(data);

    userProvider.login(data, storage.read("access")??CommonConstants.essential, ApiConstants.login).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        // goto("/otp", {"mobile" : mobile.text, "code" : "+91"}, loginModel: response);
        goToHome(response);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void goToHome(LoginModel response) {
    storage.write("access", response.access_token);
    storage.write("refresh", response.refresh_token);
    storage.write("status", "logged in");
    Get.offAllNamed("/home");
  }

  void changeCode() {
    Get.bottomSheet(
        isScrollControlled: true,
        Country(countries, country)
    ).then((value) {
      print(value);

      if(value!=null) {
        countries = value['countries'];
        country = value['country'];
        update();
      }
    });
  }

}
