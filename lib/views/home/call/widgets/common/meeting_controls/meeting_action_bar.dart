import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/views/home/call/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';

import '../../../constants/colors.dart';

// Meeting ActionBar
class MeetingActionBar extends StatelessWidget {
  // control states
  final bool isMicEnabled, isCamEnabled, isSpeakerEnabled;
  final String recordingState;
  final Room meeting;

  // callback functions
  final void Function() onCallEndButtonPressed,
      onCallLeaveButtonPressed,
      onMicButtonPressed,
      onCameraButtonPressed,
      onSpeakerButtonPressed;


  const MeetingActionBar({
    Key? key,
    required this.isMicEnabled,
    required this.isCamEnabled,
    required this.isSpeakerEnabled,
    required this.recordingState,
    required this.onCallEndButtonPressed,
    required this.onCallLeaveButtonPressed,
    required this.onMicButtonPressed,
    required this.onCameraButtonPressed,
    required this.onSpeakerButtonPressed, required this.meeting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      width: MySize.size100(context),
      decoration: BoxDecoration(
        color: MyColors.colorActionBG,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onSpeakerButtonPressed,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: isSpeakerEnabled ? MyColors.colorActionEnabledBG : MyColors.colorActionDisabledBG,
              child: Icon(
                Icons.volume_up_sharp,
                size: 26,
                color: isSpeakerEnabled ? MyColors.colorActionEnabled : MyColors.colorActionDisabled,
              ),
            ),
          ),

          // Mic Control
          GestureDetector(
            onTap: onMicButtonPressed,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: isMicEnabled ? MyColors.colorActionEnabledBG : MyColors.colorActionDisabledBG,
              child: Icon(
                isMicEnabled ? Icons.mic : Icons.mic_off,
                size: 26,
                color: isMicEnabled ? MyColors.colorActionEnabled : MyColors.colorActionDisabled,
              ),
            ),
          ),

          // Camera Reverse Control
          if(isCamEnabled)
            GestureDetector(
              onTap: () {
                List<MediaDeviceInfo> cameras = [];
                cameras = meeting.getCameras();
                MediaDeviceInfo newCam = cameras.firstWhere((camera) =>
                camera.deviceId != meeting.selectedCamId);
                meeting.changeCam(newCam.deviceId);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: MyColors.colorActionDisabledBG,
                child: Icon(
                  Icons.flip_camera_ios,
                  color: MyColors.colorActionDisabled,
                ),
              ),
            ),
          // Camera Control
          GestureDetector(
            onTap: onCameraButtonPressed,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: isCamEnabled ? MyColors.colorActionEnabledBG : MyColors.colorActionDisabledBG,
              child: Icon(
                isCamEnabled
                    ? Icons.videocam
                    : Icons.videocam_off,
                size: 26,
                color: isCamEnabled ? MyColors.colorActionEnabled : MyColors.colorActionDisabled,
              ),
            ),
          ),


          // End Control
          GestureDetector(
            onTap: onCallEndButtonPressed,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: MyColors.colorError,
              child: Icon(
                Icons.call_end,
                size: 26,
              ),
            ),
          ),

        ],
      ),
    );
  }

  PopupMenuItem<dynamic> _buildMeetingPoupItem(
      String value, String title, String? description, Widget leadingIcon) {
    return PopupMenuItem(
      value: value,
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Row(children: [
        leadingIcon,
        const HorizontalSpacer(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            if (description != null) const VerticalSpacer(4),
            if (description != null)
              Text(
                description,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: black400),
              )
          ],
        )
      ]),
    );
  }
}
