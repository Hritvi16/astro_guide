import 'dart:io';

import 'package:astro_guide/cache_manager/CacheManager.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/TimezoneConstants.dart';
import 'package:astro_guide/dialogs/InfoDialog.dart';
import 'package:astro_guide/dialogs/TitleInfoDialog.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/providers/TokenProvider.dart';
import 'package:astro_guide/repositories/TokenRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Essential {
  static void showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }

  static Future<dynamic> showInfoDialog(String text, {String? btn}) async {
    return await Get.dialog(
      InfoDialog(
        text: text,
        btn: btn??"OK",
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> showTitleInfoDialog(String title, String text, btn) async {
    return await Get.dialog(
      TitleInfoDialog(
        title: title,
        text: text,
        btn: btn
      ),
      // barrierDismissible: false,
    );
  }


  static Future<dynamic> showBasicDialog(String text, String btn1, String btn2) async {
    return await Get.dialog(
      BasicDialog(
        text: text,
        btn1: btn1,
        btn2: btn2,
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> showLoadingDialog() async {
    return await Get.dialog(
      LoadingScreen(),
      barrierDismissible: false,
    );
  }


  static void checkLength(int length, TextEditingController controller) {
    if(controller!.text.length>length) {
      controller!.text = controller!.text.substring(0, length);
      controller!.selection = TextSelection.fromPosition(TextPosition(offset: controller!.text.length));
    }
    else {
    }
  }


  static String generateOTP() {
    var rnd = math.Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    return next.toInt().toString();
  }

  static link(String link) {
    print("linkkkkk");
    print(link);
    launchUrlString(link, mode: LaunchMode.externalApplication);
  }

  static share() {
    Share.share("https://play.google.com/store/apps/details?id=com.ss.astro_guide", subject: 'Hey, looking for an app to grow your income?\n Here it is!');
  }

  static showSnackBar(String message, {int? time, int? code}) {
    Get.snackbar( "", message, snackPosition: SnackPosition.BOTTOM, backgroundColor: code==null ? MyColors.black : code==1 ? MyColors.colorSuccess : MyColors.colorError, margin: EdgeInsets.all(5),  colorText: MyColors.white, duration: Duration(seconds: time??2));
  }

  Future<bool> popUp(String text, String btn1, String btn2) {
    return Get.dialog(
      BasicDialog(
        text: text,
        btn1 : btn1,
        btn2: btn2,
      ),
      barrierDismissible: false,
    ).then((value) {
      if(value==btn1) {
        return true;
      }
      return false;
    });
  }

  static openwhatsapp(String mobile) async{
    var whatsapp ="+91$mobile";
    var whatsappURl_android = "whatsapp://send?phone=$whatsapp&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if(await launch(whatappURL_ios, forceSafariVC: false)){

      }

    }else{
      // android , web
      if( await launch(whatsappURl_android)) {
      }


    }

  }

  static void showBoardList() {
    Get.toNamed('/boardList')?.then((value) {
      Get.offAllNamed('/home');
    });
  }

  static String getGoogleClientID() {
    return Platform.isAndroid ? ApiConstants.androidGoogleClientID : ApiConstants.iOSGoogleClientID;
  }


  static final TokenRepository tokenRepository = Get.put(TokenRepository(Get.put(ApiService(Get.find()), permanent: true)));
  static late TokenProvider tokenProvider;
  static final storage = GetStorage();
  static Future<dynamic> getNewAccessToken() async {
    tokenProvider = Get.put(TokenProvider(tokenRepository));

    // print(storage.read("access"));

    Map<String, String> data = {
      "token" : storage.read("refresh")??""
    };
    print(data);

    return await tokenProvider.access(data, CommonConstants.essential).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        await storage.write("access", response.access_token);
        await storage.write("refresh", response.refresh_token);
        print("storageaccess: refresh:storage.read(access)");
        print(storage.read("access"));
        return true;
      }
      else {
        print("logout");
        // await logout();
      }
    });
  }

  static Future<void> logout() async {
    await CacheManager.deleteAllKeys();
    await storage.write("access", "essential");
    await storage.write("refresh", "");
    await storage.write("status", "logged out");
    Get.offAllNamed('/login');
  }

  static double getCalculatedAmount(int rate, {int minutes = 0, int seconds = 0}) {
    double amount = 0;

    if(minutes>0) {
      amount+=(rate * minutes);
    }
    if(seconds>0) {
      amount+=((rate/60) * minutes);
    }
    return amount;
  }

  static Color getSessionTypeColor(String type) {
    if(type=="FREE") {
      return MyColors.colorError;
    }
    return MyColors.colorInfoBlue;
  }

  static Color getStatusColor(String status) {
    if(status=="REQUESTED") {
      return MyColors.colorInfoBlue;
    }
    else if(status=="ACTIVE") {
      return MyColors.colorButton;
    }
    else if(status=="WAITLISTED") {
      return MyColors.colorOrange;
    }
    else if(status=="CANCELLED" || status=="MISSED" || status=="REJECTED") {
      return MyColors.colorError;
    }
    else if(status=="COMPLETED") {
      return MyColors.colorSuccess;
    }
    return MyColors.black;
  }

  static Color getSStatusColor(String status) {
    if(status=="REQUESTED") {
      return MyColors.colorInfoBlue;
    }
    else if(status=="ACTIVE") {
      return MyColors.colorSuccess;
    }
    else if(status=="CANCELLED" || status=="ENDED") {
      return MyColors.colorError;
    }
    return MyColors.black;
  }

  static tz.TZDateTime getGMTDate(String date) {
    return tz.TZDateTime.parse(TimezoneConstants.location, "$date+0000");
  }


  static tz.TZDateTime getCurrentDate() {
    return tz.TZDateTime.now(TimezoneConstants.location);
  }

  static tz.TZDateTime getConvertedDate(String date) {
    tz.TZDateTime parsed = getGMTDate(date);
    return tz.TZDateTime.from(parsed, TimezoneConstants.currLocation);
  }

  static tz.Location? getLocationFromOffset(int offset, String name) {
    tz.initializeTimeZones();

    final allLocations = tz.timeZoneDatabase.locations.values;

    for (final tz.Location loc in allLocations) {
      final now = tz.TZDateTime.now(loc);
      final timeZoneOffset = now.timeZoneOffset.inMinutes;
      if (timeZoneOffset == offset && loc.currentTimeZone.abbreviation==name) {
        return loc;
      }
    }

    return null;
  }

  static String getDate(String datetime) {
    return DateFormat("dd MMM, yyyy").format(Essential.getConvertedDate(datetime));
  }

  static String getRawDate(String datetime) {
    return DateFormat("dd MMM, yyyy").format(DateTime.parse(datetime));
  }

  static String getTime(String datetime) {
    return DateFormat("hh:mm aa").format(Essential.getConvertedDate(datetime));
  }

  static String getRawTime(String datetime) {
    return DateFormat("hh:mm aa").format(DateTime.parse(datetime));
  }

  static String getDateTime(String datetime) {
    return DateFormat("dd MMM, yyyy  hh:mm aa").format(Essential.getConvertedDate(datetime));
  }


  static String getChatDuration(int? seconds, String started_at, String ended_at) {
      if (seconds == null) {
        if(ended_at.isNotEmpty) {
          tz.TZDateTime start = getGMTDate(started_at);
          tz.TZDateTime end = getGMTDate(ended_at);

          Duration dur = end.difference(start);
          seconds = dur.inSeconds;
        }
        else {
          return "Duration not available";
        }
      }
      int hours = seconds ~/ 3600;
      int minutes = (seconds % 3600) ~/ 60;
      int remainingSeconds = seconds % 60;

      String duration = "";
      if (hours > 0) {
        duration += "$hours Hour${hours > 1 ? "s" : ""}";
      }
      if (minutes > 0) {
        duration +=
        "${duration.isNotEmpty ? " " : ""}$minutes Minute${minutes > 1
            ? "s"
            : ""}";
      }
      if (remainingSeconds > 0) {
        duration += "${duration.isNotEmpty
            ? " "
            : ""}$remainingSeconds Second${remainingSeconds > 1 ? "s" : ""}";
      }
      return duration.isEmpty ? "-" : duration;
  }

  static String getRemainingDuration(int seconds) {

      int hours = seconds ~/ 3600;
      int minutes = (seconds % 3600) ~/ 60;
      int remainingSeconds = seconds % 60;

      String duration = "";
      if (hours > 0) {
        duration += "${hours>=10 ? hours : "0$hours"}:";
      }
      duration += "${minutes>=10 ? minutes : "0$minutes"}:";
      duration += "${remainingSeconds>=10 ? remainingSeconds : "0$remainingSeconds"}";

      return duration.isEmpty ? "-" : duration;
  }

  static int getSessionSeconds(double wallet, int rate) {
    int max = 0;
    int minutes = (wallet/rate).floor();
    if(minutes>0) {
      max = minutes * 60;
    }
    double rem = wallet%rate;

    if(rem!=0) {
      double perSecRate = (rate/60).toPrecision(2);
      if(rem>=perSecRate) {
        int secs = (rem/perSecRate).floor();
        max+=secs;
      }
    }
    return max;
  }

  static void back() {
    Get.back();
  }

  static Future<bool> requestPermission() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    return status[Permission.microphone] == PermissionStatus.granted &&
        status[Permission.storage] == PermissionStatus.granted;
  }


  static Future<PermissionStatus> pdfRequestPermission() async {
    if(Platform.isAndroid) {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;

      if(androidDeviceInfo.version.sdkInt>=33)  {
        return PermissionStatus.granted;
      }
      else  {
        return await Permission.storage.request();
      }
    }
    else {
      return await Permission.storage.request();
    }
  }

  static String getDisplayDate(String date) {
    DateTime today = DateTime.now();
    DateTime sent_at = DateTime.parse(date);

    int days = DateTime(today.year, today.month, today.day).difference(DateTime(sent_at.year, sent_at.month, sent_at.day)).inDays;

    if(days==0) {
      // if(DateTime(today.year, today.month, today.day).compareTo(DateTime(sent_at.year, sent_at.month, sent_at.day))==0) {
      return "Today";
    }
    else if(days==1) {
      return "Yesterday";
    }
    else if (days<7){
      // if(DateTime(today.year, today.month, today.day).difference(DateTime(sent_at.year, sent_at.month, sent_at.day)).inDays<7) {
      return DateFormat("EEEE").format(sent_at);
      // }
    }
    return DateFormat("dd/MM/yy").format(sent_at);
  }

  static String getDTByStatus(SessionHistoryModel sessionHistory) {
    if(sessionHistory.status=="ACTIVE" || sessionHistory.status=="COMPLETED") {
      return sessionHistory.started_at??"";
    }
    else if(sessionHistory.status=="WAITLISTED") {
      return sessionHistory.waitlisted_at??"";
    }
    else if(sessionHistory.status=="CANCELLED") {
      return sessionHistory.cancelled_at??"";
    }
    return sessionHistory.requested_at;
  }

  static ThemeMode getThemeMode(String type) {
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


  static shareFile(List<XFile> files, String title) {
    Share.shareXFiles(files, subject: title);
    // Share.share("https://play.google.com/store/apps/details?id=com.ss.itm", subject: 'Hey, looking for an app to grow your income?\n Here it is!');
  }

  static call(String number) {
    link("tel:$number");
  }

  static email(String email) {
    link("mailto:$email");
  }

  static Future<void> createDynamicLink(bool short) async {
    // setState(() {
    //   _isCreatingLink = true;
    // });

    // final DynamicLinkParameters parameters = DynamicLinkParameters(
    //   uriPrefix: 'https://flutterfiretests.page.link',
    //   longDynamicLink: Uri.parse(
    //     'https://flutterfiretests.page.link?efr=0&ibi=io.flutter.plugins.firebase.dynamiclinksexample&apn=io.flutter.plugins.firebase.dynamiclinksexample&imv=0&amv=0&link=https%3A%2F%2Fexample%2Fhelloworld&ofl=https://ofl-example.com',
    //   ),
    //   link: Uri.parse(DynamicLink),
    //   androidParameters: const AndroidParameters(
    //     packageName: 'io.flutter.plugins.firebase.dynamiclinksexample',
    //     minimumVersion: 0,
    //   ),
    //   iosParameters: const IOSParameters(
    //     bundleId: 'io.flutter.plugins.firebase.dynamiclinksexample',
    //     minimumVersion: '0',
    //   ),
    // );

    // Uri url;
    // if (short) {
    //   final ShortDynamicLink shortLink =
    //   await dynamicLinks.buildShortLink(parameters);
    //   url = shortLink.shortUrl;
    // } else {
    //   url = await dynamicLinks.buildLink(parameters);
    // }
    //
    // setState(() {
    //   _linkMessage = url.toString();
    //   _isCreatingLink = false;
    // });
  }

  static bool getPlatform() {
    return Platform.isAndroid;
  }

  static String getPlatformAppName() {
    return Platform.isAndroid ? "AstroGuide" : "BRYD";
  }

  static String getPlatformWord() {
    return Platform.isAndroid ? "astrologer" : "counsellor";
  }

  static String getPlatformKundli() {
    return Platform.isAndroid ? "Kundli" : "Profile";
  }

  static String getPlatformReplace(String text) {
    if (Platform.isAndroid) {
      return text;
    }
    else {
      String temp = text.replaceAll("AstroGuide", "BRYD");
      temp = temp.replaceAll("Kundli", "Profile");
      temp = temp.replaceAll("kundli", "profile");
      temp = temp.replaceAll("astrologer", "counsellor");
      return temp.replaceAll("Astrologer", "Counsellor");
    }
  }

  static getPlatformLogo() {
    return Platform.isAndroid ? "icon_box.png" : "ios_icon.jpg";
  }

  static String getChartDateFormat(String value) {
    try {
      return DateFormat('dd MMM, yyyy').format(DateTime.parse(value));
    }
    catch (ex) {
      return "";
    }
  }

  static Future<int> requestMediaPermission() async {
    int permission = 0;
    if((await Permission.microphone.isGranted)!=true) {
      PermissionStatus status = await Permission.microphone.request();
      if(status!=PermissionStatus.granted) {
        permission = 1;
      }
    }
    if((await Permission.camera.isGranted)!=true) {
      PermissionStatus status = await Permission.camera.request();
      if(status!=PermissionStatus.granted) {
        permission = permission==1 ? 2 : 3;
      }
    }
    return permission;
  }


  // static bool getPlatform() {
  //   return Platform.isIOS;
  // }
  //
  // static String getPlatformAppName() {
  //   return Platform.isIOS ? "AstroGuide" : "BRYD";
  // }
  //
  // static String getPlatformWord() {
  //   return Platform.isIOS ? "astrologer" : "counsellor";
  // }
  //
  // static String getPlatformKundli() {
  //   return Platform.isIOS ? "Kundli" : "Profile";
  // }
  //
  // static String getPlatformReplace(String text) {
  //   if (Platform.isIOS) {
  //     return text;
  //   }
  //   else {
  //     String temp = text.replaceAll("AstroGuide", "BRYD");
  //     temp = temp.replaceAll("Kundli", "Profile");
  //     temp = temp.replaceAll("kundli", "profile");
  //     temp = temp.replaceAll("astrologer", "counsellor");
  //     return temp.replaceAll("Astrologer", "Counsellor");
  //   }
  // }
  //
  // static getPlatformLogo() {
  //   return Platform.isIOS ? "icon_box.png" : "ios_icon.jpg";
  // }

}