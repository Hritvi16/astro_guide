import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:astro_guide/cache_manager/CacheManager.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/controllers/call/CallController.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/notifier/GlobalNotifier.dart';
import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/repositories/MeetingRepository.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:astro_guide/providers/UserProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:videosdk/videosdk.dart';
// import 'package:permission_handler/permission_handler.dart';

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
// IMPORTANT NOTE
// if you have errors here (undefined or awesome notifications doesnt have this funcition)
// this mean you are using old version of awesome notifications so you just need to go to
// template on github and copy older version of fcm_helper.dart class and paste it here
// link: https://github.com/EmadBeltaje/flutter_getx_template/commits/master/lib/utils/fcm_helper.dart
// you can copy the hole file of initial commit and paste here and everything would be fine
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DUPLICATED NOTIFICATION ISSUE
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// you may get 2 notifications shown while you only sent 1 but why ?
// simply bcz one notification is from fcm and the other one is from us (awesome notification)
// but what does that mean!
// if you take a look here at this link https://firebase.google.com/docs/cloud-messaging/concept-options#notifications_and_data_messages
// you will know that notifications are 2 types
// - Notification message (which automatically show notification which lead to duplicated)
// - Data message (dont show notification so you must show it using awesome notifications)
// so if you want to get rid of duplicated notifications just stop sending (Notification message) and start sending (data message) instead
// and this is in most of time (api developer) responsibility
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

class NotificationHelper {
  // FCM Messaging
  static late FirebaseMessaging messaging;

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  static final GlobalNotifier globalNotifier = Get.find();


  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      await Firebase.initializeApp();
      // TODO: uncomment this line if you connected to firebase via cli
      //options: DefaultFirebaseOptions.currentPlatform,

      messaging = FirebaseMessaging.instance;


      // initialize notifications channel and libraries
      await initNotification();

      // notification settings handler
      await setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      // await generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);

      // listen to notifications click and actions
      listenToActionButtons();
      // }
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      // Logger().e(error);
    }
  }

  /// when user click on notification or click on button on the notification
  static listenToActionButtons() {
    // Only after at least the action method is set, the notification events are delivered
    awesomeNotifications.setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  // static Future<String> generateFcmToken(AstroProvider astroProvider) async {
  static Future<String> generateFcmToken() async {
    await initFcm();
    try {
      String? token = await messaging.getToken();

      return token??"";
    } catch (error) {
      print(error.toString());
    }

    return "";
  }

  /// this method will be triggered when the app generate fcm
  /// token successfully
  // static sendFcmTokenToServer(String token, UserProvider userProvider) {
  //   final storage = GetStorage();
  //
  //   Map<String, dynamic> data = {
  //     ApiConstants.act : ApiConstants.addFCM,
  //     ApiConstants.fcm :token,
  //   };
  //
  //
  //
  //   userProvider.insertFCM(data).then((value) {
  //     if(value.code==1) {
  //       await storage.write("fcm", token);
  //     }
  //   });
  // }

  ///handle fcm notification when app is closed/terminated
  /// if you are wondering about this annotation read the following
  /// https://stackoverflow.com/a/67083337
  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    final storage = GetStorage();
    print("categoryyyyy backkk");
    print("categoryyyyy backkk titleeee");
    print(message.notification?.title);
    print(message.data);
    print(message.data['category']);
    print(message.data['category']=="call");
    print(storage.read("status"));

    if(storage.read("status") == "logged in") {
      if (message.data['category'] == "chat" || message.data['category'] == "call") {

      }
      else {
        globalNotifier.updateValue("session");
      }

      if(message.data['category'] != "active") {
        var random = Random();
        _showNotification(
        id: random.nextInt(pow(2, 31).toInt() - 1),
        title: message.notification?.title ?? message?.data['title'] ?? '',
        body: message.notification?.body ?? message?.data['body'] ?? '',
        payload: message.data.cast(),
        notificationLayout: NotificationLayout.BigText,
        category: message.data['category'] == "call" ||
        message.data['category'] == "chat"
        ? NotificationCategory.Call
            : message.data['category'] == "cancelled" ? NotificationCategory
            .MissedCall : null
        );
      }
      else {
        print("globalNotifier.callController.value");
        print(globalNotifier.callController.value);
        if (globalNotifier.callController.value != null) {
          CallController callController = globalNotifier.callController
              .value!;
          callController.getSessionHistory("NOTI ACTIVE");
          globalNotifier.updateCallController(null);

          if(message.data['category']=="ended" || message.data['category']=="rejected") {
            await storage.write("ch_id", message.data['ch_id']);
            AstrologerModel astrologer = AstrologerModel(
                id: int.parse(message.data['astro_id'].toString()),
                name: message.data['name'],
                email: "", experience: "", profile: message.data['profile'], about: "");
            await storage.write("astrologer", json.encode(astrologer.toJson()));
            CallController callController = Get.put<CallController>(CallController());
            await Future.delayed(const Duration(seconds: 3));
            callController.endMeeting(message.data['category'] == "rejected"
                ? "REJECTED"
                : "COMPLETED");
          }
        }
        else {
          CallController callController = Get.put<CallController>(CallController());
          callController.getSessionHistory("NOTI ACTIVE");
        }
      }
    }
    else {
      if (message.data['category'] == "ended" || message.data['category'] == "rejected") {
        if (globalNotifier.callController.value != null) {
          CallController callController = globalNotifier.callController
              .value!;
          callController.stopTimer();
          callController.getSessionHistory("NOTI ACTIVE");
          globalNotifier.updateCallController(null);
        }
        else {
          await storage.write("ch_id", message.data['ch_id']);
          AstrologerModel astrologer = AstrologerModel(
              id: int.parse(message.data['astro_id'].toString()),
              name: message.data['name'],
              email: "",
              experience: "",
              profile: message.data['profile'],
              about: "");
          await storage.write("astrologer", json.encode(astrologer.toJson()));
          CallController callController = Get.put<CallController>(CallController());
          callController.stopTimer();
          await callController.getSessionHistory("NOTI ACTIVE");
          callController.endMeeting(message.data['category'] == "rejected"
              ? "REJECTED"
              : "COMPLETED");
        }
      }
    }
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    final storage = GetStorage();
    print("categoryyyyy");
    print(message.data);
    print(message.data['category']);
    print(message.data['category']);
    print(message.data['path']);
    print(storage.read("status"));
    bool go = true;

    if(storage.read("status") == "logged in") {
      // if(message.data['category']=="chat" || message.data['category']=="call") {
      //   go = false;
      //   Get.toNamed(
      //       message.data['path'] ?? "/splash",
      //       arguments: {
      //         "astrologer": AstrologerModel(
      //           id: int.parse(message.data['astro_id'] ?? "-1"),
      //           name: message.data['name'] ?? "",
      //           profile: message.data['profile'] ?? "",
      //           mobile: '', email: '', experience: '', about: '',
      //         ),
      //         "ch_id": int.parse(message.data['ch_id'] ?? "-1"),
      //         "type": "RECONNECT",
      //         "action" : "NOT DECIDED",
      //         "chat_type" : message.data['chat_type'],
      //         "meeting_id" : message.data['meeting_id'],
      //         "session_id" : message.data['session_id'],
      //         "rate" : message.data['rate'],
      //       }
      //   );
      // }
      if (message.data['category'] == "chat" ||
          message.data['category'] == "call") {
        print("hellooooo");
        go = false;
        session(message.data);
      }

      if (go) {
        globalNotifier.updateValue("session");
        if (message.data['category'] == "waitlist") {
          print(globalNotifier.callController.value);
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController.value!;

            if (callController.meeting != null) {
              callController.meeting?.end();
              callController.meeting?.leave();
            }
            callController.back();
            globalNotifier.updateCallController(null);
          }
          else {
            CallController callController = Get.put<CallController>(CallController());
            if (callController.meeting != null) {
              callController.meeting?.end();
              callController.meeting?.leave();
            }
            callController.back();
          }
        }
        else if (message.data['category'] == "cancelled") {
          print(globalNotifier.callController.value);
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController
                .value!;

            if (callController.meeting != null) {
              callController.meeting?.end();
              callController.meeting?.leave();
            }
            callController.back();
            globalNotifier.updateCallController(null);
          }
          else {
            CallController callController = Get.put<CallController>(CallController());
            if (callController.meeting != null) {
              callController.meeting?.end();
              callController.meeting?.leave();
            }
            callController.back();
          }
        }
        else if (message.data['category'] == "rejected" ||
            message.data['category'] == "ended") {
          print("globalNotifier.callController.value");
          print(globalNotifier.callController.value);
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController
                .value!;
            callController.endMeeting(message.data['category'] == "rejected"
                ? "REJECTED"
                : "COMPLETED");
            globalNotifier.updateCallController(null);
          }
          else {
            await storage.write("ch_id", message.data['ch_id']);
            AstrologerModel astrologer = AstrologerModel(
                id: int.parse(message.data['astro_id'].toString()),
                name: message.data['name'],
                email: "", experience: "", profile: message.data['profile'], about: "");
            await storage.write("astrologer", json.encode(astrologer.toJson()));
            CallController callController = Get.put<CallController>(CallController());
            await Future.delayed(const Duration(seconds: 1));
            callController.endMeeting(message.data['category'] == "rejected"
                ? "REJECTED"
                : "COMPLETED");
          }
        }

        if(message.data['category'] != "active") {
          var random = Random();
          _showNotification(
              id: random.nextInt(pow(2, 31).toInt() - 1),
              title: message.notification?.title ?? message?.data['title'] ??
                  '',
              body: message.notification?.body ?? message?.data['body'] ?? '',
              payload: message.data.cast(),
              // pass payload to the notification card so you can use it (when user click on notification)
              notificationLayout: NotificationLayout.BigText,
              category: message.data['category'] == "call"
                  ? NotificationCategory
                  .Call
                  : message.data['category'] == "cancelled" ||
                  message.data['category'] == "rejected"
                  ? NotificationCategory.MissedCall
                  : null
          );
        }
        else {
          print("globalNotifier.callController.value");
          print(globalNotifier.callController.value);
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController
                .value!;
            callController.getSessionHistory("NOTI ACTIVE");
            globalNotifier.updateCallController(null);
          }
          else {
            CallController callController = Get.put<CallController>(CallController());
            callController.getSessionHistory("NOTI ACTIVE");
          }
        }
      }
    }
  }

  static void session(Map<String, dynamic> data) {
    print("message.data['wallet']");
    print(data['wallet']);
    Map<String, dynamic> arguments= {
      "astrologer": AstrologerModel(
        id: int.parse(data['astro_id'] ?? "-1"),
        name: data['name'] ?? "",
        profile: data['profile'] ?? "",
        mobile: '', email: '', experience: '', about: '', ivr: 0, video: 0
      ),
      "ch_id": int.parse(data['ch_id'] ?? "-1"),
      "type": "RECONNECT",
      "action" : "NOT DECIDED",
      "rate" : data['rate'],
      "chat_type" : data['chat_type'],
      "ch_id": int.parse(data['ch_id'] ?? "-1"),
      "type": "RECONNECT",
      "action" : "NOT DECIDED",
      "wallet": double.parse(data['wallet'] ?? "0"),
    };

    if(data['category']=="call") {
      arguments.addAll(
          {
            "session_history" : SessionHistoryModel.fromJson(json.decode(data['session_history'])),
            "meeting_id": data['meeting_id'] ?? "-1",
            "session_id": data['session_id'] ?? "-1",
          }
      );
    }

    print("sswebnotifier: before notification ${globalNotifier.showSession}");
    globalNotifier.updateValue("notification");
    print("sswebnotifier: after notification ${globalNotifier.showSession}");

    Get.toNamed(
        data['path'] ?? "/splash",
        arguments: arguments
    );
  }
  //display notification for user with sound
  static _showNotification(
      {
        required String title,
        required String body,
        required int id,
        String? channelKey,
        String? groupKey,
        NotificationLayout? notificationLayout,
        NotificationCategory? category,
        String? summary,
        Map<String, String>? payload,
        String? largeIcon}) async {
    print("payloadddd");
    print(payload);
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      } else {
        // u can show notification
        awesomeNotifications.createNotification(
            content: NotificationContent(
              id: id,
              title: title,
              body: body,
              category: category,
              groupKey: groupKey ?? NotificationChannels.generalGroupKey,
              channelKey: channelKey ?? NotificationChannels.generalChannelKey,
              showWhen: true, // Hide/show the time elapsed since notification was displayed
              payload: payload, // data of the notification (it will be used when user clicks on notification)
              // notificationLayout: NotificationLayout.BigPicture, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
              notificationLayout: notificationLayout ?? NotificationLayout.Default, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
              autoDismissible: true, // dismiss notification when user clicks on it
              summary: summary, // for ex: New message (it will be shown on status bar before notificaiton shows up)
              largeIcon: largeIcon, // image of sender for ex (when someone send you message his image will be shown)
              fullScreenIntent: true,
              wakeUpScreen: true,
              locked: true,
            ),
            actionButtons: category==NotificationCategory.Call ?
            [
              NotificationActionButton(key: "ACCEPT", label: "ACCEPT", color: MyColors.colorSuccess, autoDismissible: true),
              NotificationActionButton(key: "REJECT", label: "REJECT", color: MyColors.colorError, autoDismissible: true, actionType: ActionType.DismissAction),
            ] : null
        );
      }
    });


  }

  ///init notifications channels
  static initNotification() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    //   print('User granted provisional permission');
    // } else {
    //   print('User declined or has not accepted permission');
    // }
    await awesomeNotifications.initialize(
        null, // null mean it will show app icon on the notification (status bar)
        [
          NotificationChannel(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            channelName: NotificationChannels.generalChannelName,
            channelDescription: 'Notification channel for general notifications',
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
            soundSource: 'resource://raw/notinoti',
            defaultRingtoneType: DefaultRingtoneType.Ringtone,
            icon: 'resource://drawable/app_icon',
            // soundSource: 'asset://assets/audio/notification',
          ),
          NotificationChannel(
            // channelGroupKey: NotificationChannels.broadcastChannelGroupKey,
            channelKey: NotificationChannels.broadcastChannelKey,
            channelName: NotificationChannels.broadcastChannelName,
            channelDescription: 'Notification channel for broadcast notifications',
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
            soundSource: 'resource://raw/notinoti',
            defaultRingtoneType: DefaultRingtoneType.Ringtone,
            icon: 'resource://drawable/app_icon',
            // soundSource: 'asset://assets/audio/notification',
          ),
          NotificationChannel(
            // channelGroupKey: NotificationChannels.broadcastChannelGroupKey,
            channelKey: NotificationChannels.rechargeChannelKey,
            channelName: NotificationChannels.rechargeChannelName,
            channelDescription: 'Notification channel for recharge notifications',
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
            soundSource: 'resource://raw/notinoti',
            defaultRingtoneType: DefaultRingtoneType.Ringtone,
            icon: 'resource://drawable/app_icon',
            // soundSource: 'asset://assets/audio/notification',
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelGroupName: NotificationChannels.generalChannelGroupName,
          ),
        ]);
  }
}

class NotificationChannels {
  // chat channel (for messages only)
  static String get generalChannelKey => "basic_channel_id";
  static String get generalChannelName => "Basic Notifications";
  static String get generalChannelGroupKey => "basic_channel_group";
  static String get generalChannelGroupName => "Basic group";

  static String get generalGroupKey => "basic group key";
  static String get generalChannelDescription => "This is the basic channel";

  static String get broadcastChannelKey => "broadcast_channel_id";
  static String get broadcastChannelName => "broadcast channel name";
  static String get broadcastChannelGroupKey => "broadcast_channel_group";
  static String get broadcastChannelGroupName => "broadcast channel group name";

  static String get rechargeChannelKey => "recharge_channel_id";
  static String get rechargeChannelName => "recharge channel name";
}

class NotificationController {

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    print("createddd");
    print(receivedNotification);
    print(receivedNotification.payload);

    if(receivedNotification.category!=NotificationCategory.Call) {
      print("last call id ${storage.read("current_id")}");
      if(storage.read("current_id")!=null) {
        AwesomeNotifications().cancel(storage.read("current_id"));
        storage.remove("current_id");
      }
    }
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    print("display");
    print(receivedNotification);
    print(receivedNotification.payload);
    if(receivedNotification.category==NotificationCategory.Call) {
      storage.write("current_id", receivedNotification.id ?? -1);
      print("display Notification current call id ${receivedNotification.id}");
    }
    else {
      Future.delayed(Duration(seconds: 5)).then((value) async {
        print("display Notification last call id ${receivedNotification.id}");
        await AwesomeNotifications().dismiss(receivedNotification.id ?? -1);
        print("display Notification cancelled");
      });
    }
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    print("dismiss");
    print(receivedAction);

    Map<String, String?>? payload = receivedAction.payload;
    if(receivedAction.buttonKeyPressed=="REJECT") {
      if(payload?['category']=="call" || payload?['path'] == "/call") {
        rejectCall(payload?['ch_id'] ?? "-1");
      }
      if(payload?['category']=="chat" || payload?['path'] == "/chat") {
        rejectChat(payload?['ch_id'] ?? "", payload?['astro_id'] ?? "-1");
      }
    }

    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    print(receivedAction);
    print("receivedAction.buttonKeyPressedddd");
    print(receivedAction.buttonKeyPressed);
    print(receivedAction.payload);

    if(receivedAction.channelKey==NotificationChannels.rechargeChannelKey) {
      Get.toNamed("/wallet");
    }
    else {
      Map<String, String?>? payload = receivedAction.payload;

      if (receivedAction.buttonKeyPressed == "ACCEPT") {
        print("payload");
        print(receivedAction.payload);
        print(payload?['category'] == "call" || payload?['path'] == "/call");
        print(payload?['category'] == "chat" || payload?['path'] == "/chat");

        if (payload?['category'] == "call" || payload?['path'] == "/call") {
          print(payload?['path'] ?? "/splash");
          print(payload);
          print(SessionHistoryModel.fromJson(
              json.decode(payload?['session_history'] ?? "{}")));
          Get.toNamed(
              "/call",
              arguments: {
                "astrologer": AstrologerModel(
                    id: int.parse(payload?['astro_id'] ?? "-1"),
                    name: payload?['name'] ?? "",
                    profile: payload?['profile'] ?? "",
                    mobile: '',
                    email: '',
                    experience: '',
                    about: '',
                    ivr: 0,
                    video: 0
                ),
                "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
                "chat_type": payload?['chat_type'] ?? "",
                "meeting_id": payload?['meeting_id'] ?? "",
                "session_id": payload?['session_id'] ?? "",
                "wallet": double.parse(payload?['wallet'] ?? "0"),
                "type": "RECONNECT",
                "action": "ACCEPT",
                "session_history": SessionHistoryModel.fromJson(
                    json.decode(payload?['session_history'] ?? "{}")),
              }
          );
        }
        else
        if (payload?['category'] == "chat" || payload?['path'] == "/chat") {
          Get.toNamed(
              payload?['path'] ?? "/splash",
              arguments: {
                "astrologer": AstrologerModel(
                    id: int.parse(payload?['astro_id'] ?? "-1"),
                    name: payload?['name'] ?? "",
                    profile: payload?['profile'] ?? "",
                    mobile: '',
                    email: '',
                    experience: '',
                    about: '',
                    ivr: 0,
                    video: 0
                ),
                "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
                "chat_type": payload?['chat_type'] ?? "",
                "type": "RECONNECT",
                "action": "ACCEPT",
              }
          );
        }
      }
      else {
        print("inside elseeee");
        print(payload);

        if (payload?['category'] == "call" || payload?['path'] == "/call") {
          Get.toNamed(
              "/call",
              arguments:
              {
                "astrologer": AstrologerModel(
                    id: int.parse(payload?['astro_id'] ?? "-1"),
                    name: payload?['name'] ?? "",
                    profile: payload?['profile'] ?? "",
                    mobile: '',
                    email: '',
                    experience: '',
                    about: '',
                    ivr: 0,
                    video: 0
                ),
                "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
                "meet_id": payload?['meet_id'] ?? "",
                "meeting_id": payload?['meeting_id'] ?? "",
                "session_id": payload?['session_id'] ?? "",
                "wallet": double.parse(payload?['wallet'] ?? "0"),
                "type": "RECONNECT",
                "chat_type": payload?['chat_type'] ?? "",
                "action": "NOT DECIDED",
                "session_history": SessionHistoryModel.fromJson(
                    json.decode(payload?['session_history'] ?? "{}")),
              }
          );
        }
        else
        if (payload?['category'] == "chat" || payload?['path'] == "/chat") {
          Get.toNamed(
              "/chat",
              // payload?['path'] ?? "/home",
              arguments: {
                "astrologer": AstrologerModel(
                    id: int.parse(payload?['astro_id'] ?? "-1"),
                    name: payload?['name'] ?? "",
                    profile: payload?['profile'] ?? "",
                    mobile: '',
                    email: '',
                    experience: '',
                    about: '',
                    ivr: 0,
                    video: 0
                ),
                "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
                "chat_type": payload?['chat_type'] ?? "",
                "type": "RECONNECT",
                "action": "NOT DECIDED"
              }
          );
        }
      }
    }
  }


}


Future<void> rejectCall(String ch_id) async {
  final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
  final MeetingProvider meetingProvider = Get.put(MeetingProvider(meetingRepository));;

  final storage = GetStorage();
  final GlobalNotifier globalNotifier = Get.find();

  Map <String, dynamic> data = {
    SessionConstants.ch_id : ch_id,
    SessionConstants.sender : "U",
    SessionConstants.reason : "Chat was rejected by user",
  };

  if(globalNotifier.callController.value!=null) {
    globalNotifier.updateCallController(null);
  }

  await meetingProvider.reject(data, storage.read("access")).then((response) async {
    if(response.code==1) {
    }
    else if(response.code!=-1) {
    }
    else {
    }
  });
}

Future<void> rejectChat(String ch_id, String astro_id) async {

  final storage = GetStorage();
  IO.Socket socket = IO.io(
    ApiConstants.urlS,
    IO.OptionBuilder().setTransports(['websocket']).setQuery(
        {
          SessionConstants.username : storage.read("access"),
          SessionConstants.ch_id : ch_id.toString(),
          SessionConstants.sender : "U",
          SessionConstants.user_id : astro_id,
        }).build(),
  );
  socket.onConnect((data) => print('Connection established'));
  socket.onConnectError((data) => print('Connect Error: $data'));
  socket.onDisconnect((data) => print('Socket.IO server disconnected'));

  Map <String, dynamic> data = {
    SessionConstants.username : storage.read("access"),
    SessionConstants.ch_id : ch_id,
    SessionConstants.sender : "U",
    SessionConstants.reason : "Chat was rejected by user",
  };

  socket.emit('reject', data);
}

