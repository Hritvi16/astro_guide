import 'dart:async';
import 'dart:developer';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/views/home/call/utils/api.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videosdk/videosdk.dart';

class OneToOneMeetController extends GetxController {
  OneToOneMeetController();

  final storage = GetStorage();

  late String meetingId, token, displayName;
  late bool micEnabled, camEnabled, chatEnabled;

  bool isRecordingOn = false;
  bool showChatSnackbar = true;
  String recordingState = "RECORDING_STOPPED";

  // Meeting
  late Room meeting;
  bool joined = false;

  // Streams
  Stream? shareStream;
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;

  bool fullScreen = false;



  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic> data = Get.arguments;
    
    meetingId = data['meetingId'];
    token = data['token'];
    displayName = data['displayName'];
    micEnabled = data['micEnabled']??true;
    camEnabled = data['camEnabled']??true;
    chatEnabled = data['chatEnabled']??false;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Create instance of Room (Meeting)
    Room room = VideoSDK.createRoom(
      roomId: meetingId,
      token: token,
      displayName: displayName,
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      maxResolution: 'hd',
      multiStream: false,
      defaultCameraIndex: 1,
      notification: const NotificationInfo(
        title: "Video SDK",
        message: "Video SDK is sharing screen in the meeting",
        icon: "notification_share", // drawable icon name
      ),
    );

    // Register meeting events
    registerMeetingEvents(room);

    // Join meeting
    room.join();
  }

  void registerMeetingEvents(Room meeting) {
    // Called when joined in meeting
    meeting.on(
      Events.roomJoined,
          () {
        if (meeting.participants.length > 1) {
          meeting = meeting;
            update();
        } else {
          meeting = meeting;
          joined = true;

          update();

          subscribeToChatMessages(meeting);
        }
      },
    );

    // Called when meeting is ended
    meeting.on(Events.roomLeft, (String? errorMsg) {
      if (errorMsg != null) {
        Essential.showSnackBar("Meeting left due to $errorMsg !!");
      }

      Get.toNamed("/joinScreen");
    });


    // Called when stream is enabled
    meeting.localParticipant.on(Events.streamEnabled, (Stream _stream) {
      if (_stream.kind == 'video') {
        videoStream = _stream;
      } else if (_stream.kind == 'audio') {
        audioStream = _stream;
      } else if (_stream.kind == 'share') {
        shareStream = _stream;
      }
      update();
    });

    // Called when stream is disabled
    meeting.localParticipant.on(Events.streamDisabled, (Stream _stream) {
      if (_stream.kind == 'video' && videoStream?.id == _stream.id) {
        videoStream = null;
      } else if (_stream.kind == 'audio' && audioStream?.id == _stream.id) {
        audioStream = null;
      } else if (_stream.kind == 'share' && shareStream?.id == _stream.id) {
        shareStream = null;
      }
    });

    // Called when presenter is changed
    meeting.on(Events.presenterChanged, (_activePresenterId) {
      Participant? activePresenterParticipant =
      meeting.participants[_activePresenterId];

      // Get Share Stream
      Stream? _stream = activePresenterParticipant?.streams.values
          .singleWhere((e) => e.kind == "share");

      remoteParticipantShareStream = _stream;
      update();
    });

    meeting.on(
        Events.participantLeft,
            (participant) => {
              if (meeting.participants.length < 2)
              {
                joined = true,
                update(),
                subscribeToChatMessages(meeting),
              }
        });


    meeting.on(
        Events.error,
            (error)  {
          Essential.showSnackBar(error['name'].toString() +
                  " :: " +
                  error['message'].toString());
        });
  }


  void subscribeToChatMessages(Room meeting) {
    meeting.pubSub.subscribe("CHAT", (message) {
      if (message.senderId != meeting.localParticipant.id) {
        if (showChatSnackbar) {
          Essential.showSnackBar(message.senderName + ": " + message.message,);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> onWillPopScope() async {
    meeting.leave();
    return true;
  }

  void updateFullScreen() {
    fullScreen = !fullScreen;
    update();
  }

  void updateChatSnackbar(bool value) {
    showChatSnackbar = value;
    update();
  }

}
