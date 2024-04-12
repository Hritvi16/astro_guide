import 'dart:async';
import 'dart:io';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/languages/Languages.dart';
import 'package:astro_guide/notification_helper/NotificationHelper.dart';
import 'package:astro_guide/notifier/GlobalNotifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/AppBinding.dart';
import 'package:astro_guide/controllers/theme/ThemesController.dart';
import 'package:astro_guide/routes/routes.dart';
import 'package:astro_guide/themes/Themes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await NotificationHelper.initFcm();

  tz.initializeTimeZones();
  await GetStorage.init();

  final storage = GetStorage();

  if(storage.read("permission")!=true) {
    await checkPermission();
  }

  ByteData data=await PlatformAssetBundle().load('assets/ca/cert.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(LifecycleAwareWidget(child: MyApp(),));
}

Future<void> checkPermission() async {
  await Essential.requestMediaPermission();

  print("await Permission.microphone.status");
  print(await Permission.microphone.status);

  print("await Permission.microphone.status");
  print(await Permission.camera.request());
  print(await Permission.camera.status);

  final storage = GetStorage();
  storage.write("permission", true);
}


class MyApp extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());
  final storage = GetStorage();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyColors.colorPrimary,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Locale(storage.read('language')??'en'), // Default locale
      fallbackLocale: Locale(storage.read('language')??'en'),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: getThemeMode(themeController.theme),
      getPages: Routes.routes,
      initialRoute: Routes.INITIAL,
      initialBinding: AppBinding(),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}

class LifecycleAwareWidget extends StatefulWidget {
  final Widget child;


  const LifecycleAwareWidget({required this.child,});

  @override
  _LifecycleAwareWidgetState createState() => _LifecycleAwareWidgetState();
}

class _LifecycleAwareWidgetState extends State<LifecycleAwareWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print("sswebmain: lifecycle $state");
    // final storage = GetStorage();
    // print("sswebmain: calling_status ${calling_status}");
    // Handle app lifecycle changes here
    if (state == AppLifecycleState.resumed) {
      manageCall();
      // The app has come to the foreground
    } else if (state == AppLifecycleState.inactive) {
      // The app is in an inactive state (e.g., in a phone call)
    } else if (state == AppLifecycleState.paused) {
      // The app has gone into the background
    } else if (state == AppLifecycleState.detached) {
      // The app is terminated or detached
    }
  }

  void manageCall() async {
    print("sswebmain: managecall ");
    final GlobalNotifier globalNotifier = Get.find();
    print("sswebmain: managecall global ${globalNotifier.showSession}");
    globalNotifier.updateValue("session");
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

