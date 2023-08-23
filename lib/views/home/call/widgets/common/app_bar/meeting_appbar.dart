import 'dart:async';
import 'dart:developer';

import 'package:astro_guide/constants/MeetingConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/providers/MeetingProvider.dart';
import 'package:astro_guide/views/home/call/constants/colors.dart';
import 'package:astro_guide/views/home/call/utils/toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:videosdk/videosdk.dart';

class MeetingAppBar extends StatefulWidget {
  final String token;
  final Room meeting;
  // final String recordingState;
  final bool isFullScreen;
  final MeetingProvider? meetingProvider;
  const MeetingAppBar(
      {Key? key,
      this.meetingProvider,
      required this.meeting,
      required this.token,
      required this.isFullScreen,
      // required this.recordingState
      })
      : super(key: key);

  @override
  State<MeetingAppBar> createState() => MeetingAppBarState();
}

class MeetingAppBarState extends State<MeetingAppBar> {
  Duration? elapsedTime;
  Timer? sessionTimer;
  final storage = GetStorage();

  List<MediaDeviceInfo> cameras = [];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> startTimer() async {
    Map<String, String> data = {
      MeetingConstants.meetingID : widget.meeting.id,
      MeetingConstants.token : widget.token
    };

    await widget.meetingProvider?.session(data, storage.read("access")).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        DateTime sessionStartTime = DateTime.parse(response.data??"");
        final difference = DateTime.now().difference(sessionStartTime);

        setState(() {
          elapsedTime = difference;
          sessionTimer = Timer.periodic(
            const Duration(seconds: 1),
                (timer) {
              setState(() {
                elapsedTime = Duration(
                    seconds: elapsedTime != null ? elapsedTime!.inSeconds + 1 : 0);
              });
            },
          );
        });
        log("session start time" + response.data.toString());
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
    // dynamic session = await fetchSession(widget.token, widget.meeting.id);

  }

  @override
  void dispose() {
    if (sessionTimer != null) {
      sessionTimer!.cancel();
    }
    super.dispose();
  }
}
