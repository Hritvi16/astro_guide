// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// // ignore: unnecessary_import
// import 'dart:typed_data';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as image;
// import 'package:path_provider/path_provider.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });
//
//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }
//
// class NotificationHelper {
//
//   int id = 0;
//
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   static late FirebaseMessaging messaging;
//
//   /// Streams are created so that app can respond to notification-related events
//   /// since the plugin is initialised in the `main` function
//   static final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
//   StreamController<ReceivedNotification>.broadcast();
//
//   static final StreamController<String?> selectNotificationStream =
//   StreamController<String?>.broadcast();
//
//   static const MethodChannel platform =
//   MethodChannel('dexterx.dev/flutter_local_notifications_example');
//
//   static const String portName = 'notification_send_port';
//
//   static String? selectedNotificationPayload;
//
//   /// A notification action which triggers a url launch event
//   static const String urlLaunchActionId = 'id_1';
//
//   /// A notification action which triggers a App navigation event
//   static const String navigationActionId = 'id_3';
//
//   /// Defines a iOS/MacOS notification category for text input actions.
//   static const String darwinNotificationCategoryText = 'textCategory';
//
//   /// Defines a iOS/MacOS notification category for plain actions.
//   static const String darwinNotificationCategoryPlain = 'plainCategory';
//
//   @pragma('vm:entry-point')
//   static void notificationTapBackground(NotificationResponse notificationResponse) {
//     // ignore: avoid_print
//     print("responseeeeee");
//     print(notificationResponse);
//     print('notification(${notificationResponse.id}) action tapped: '
//         '${notificationResponse.actionId} with'
//         ' payload: ${notificationResponse.payload}');
//     if (notificationResponse.input?.isNotEmpty ?? false) {
//       // ignore: avoid_print
//       print(
//           'notification action tapped with input: ${notificationResponse.input}');
//     }
//   }
//   static Future<String> generateFcmToken() async {
//     await initFcm();
//     try {
//       String? token = await messaging.getToken();
//       return token ?? "";
//     } catch (error) {
//       print(error.toString());
//     }
//     return "";
//   }
//   /// IMPORTANT: running the following code on its own won't work as there is
//   /// setup required for each platform head project.
//   ///
//   /// Please download the complete example app from the GitHub repository where
//   /// all the setup has been done
//   static Future<void> initFcm() async {
//
//     await Firebase.initializeApp();
//
//     messaging = FirebaseMessaging.instance;
//
//     await _configureLocalTimeZone();
//
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
//         Platform.isLinux
//         ? null
//         : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//       selectedNotificationPayload =
//           notificationAppLaunchDetails!.notificationResponse?.payload;
//       print("FCM");
//       print(notificationAppLaunchDetails!.notificationResponse?.payload);
//     }
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('img');
//
//     final List<DarwinNotificationCategory> darwinNotificationCategories =
//     <DarwinNotificationCategory>[
//       DarwinNotificationCategory(
//         darwinNotificationCategoryText,
//         actions: <DarwinNotificationAction>[
//           DarwinNotificationAction.text(
//             'text_1',
//             'Action 1',
//             buttonTitle: 'Send',
//             placeholder: 'Placeholder',
//           ),
//         ],
//       ),
//       DarwinNotificationCategory(
//         darwinNotificationCategoryPlain,
//         actions: <DarwinNotificationAction>[
//           DarwinNotificationAction.plain('id_1', 'Action 1'),
//           DarwinNotificationAction.plain(
//             'id_2',
//             'Action 2 (destructive)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.destructive,
//             },
//           ),
//           DarwinNotificationAction.plain(
//             navigationActionId,
//             'Action 3 (foreground)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.foreground,
//             },
//           ),
//           DarwinNotificationAction.plain(
//             'id_4',
//             'Action 4 (auth required)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.authenticationRequired,
//             },
//           ),
//         ],
//         options: <DarwinNotificationCategoryOption>{
//           DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
//         },
//       )
//     ];
//
//     /// Note: permissions aren't requested here just to demonstrate that can be
//     /// done later
//     final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification:
//           (int id, String? title, String? body, String? payload) async {
//         print("payloadddddd");
//         didReceiveLocalNotificationStream.add(
//           ReceivedNotification(
//             id: id,
//             title: title,
//             body: body,
//             payload: payload,
//           ),
//         );
//       },
//       notificationCategories: darwinNotificationCategories,
//     );
//
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         switch (notificationResponse.notificationResponseType) {
//           case NotificationResponseType.selectedNotification:
//             selectNotificationStream.add(notificationResponse.payload);
//             break;
//           case NotificationResponseType.selectedNotificationAction:
//             if (notificationResponse.actionId == navigationActionId) {
//               selectNotificationStream.add(notificationResponse.payload);
//             }
//             break;
//         }
//       },
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//     bool get = notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
//     _isAndroidPermissionGranted();
//     _requestPermissions();
//     _configureDidReceiveLocalNotificationSubject();
//     _configureSelectNotificationSubject();
//   }
//
//   static Future<void> _isAndroidPermissionGranted() async {
//     if (Platform.isAndroid) {
//       final bool granted = await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//           ?.areNotificationsEnabled() ??
//           false;
//
//     }
//   }
//
//   static Future<void> _requestPermissions() async {
//     if (Platform.isIOS || Platform.isMacOS) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//           MacOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//       flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>();
//
//       final bool? granted = await androidImplementation?.requestPermission();
//
//     }
//   }
//
//   static void _configureDidReceiveLocalNotificationSubject() {
//     didReceiveLocalNotificationStream.stream
//         .listen((ReceivedNotification receivedNotification) async {
//       print(receivedNotification.toString());
//     });
//   }
//
//   static void _configureSelectNotificationSubject() {
//     selectNotificationStream.stream.listen((String? payload) async {
//       print(payload);
//       // await Navigator.of(context).push(MaterialPageRoute<void>(
//       //   builder: (BuildContext context) => SecondPage(payload),
//       // ));
//     });
//   }
//
//   static Future<void> _configureLocalTimeZone() async {
//     if (kIsWeb || Platform.isLinux) {
//       return;
//     }
//     // tz.initializeTimeZones();
//     // final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
//     // tz.setLocalLocation(tz.getLocation(timeZoneName!));
//   }
// }