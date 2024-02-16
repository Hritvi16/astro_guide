import 'package:astro_guide/call/JoinScreenController.dart';
import 'package:astro_guide/callview/widgets/common/joining_details/joining_details.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/views/home/call/constants/colors.dart';
import 'package:astro_guide/views/home/call/utils/spacer.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class JoinScreen extends StatelessWidget {
  JoinScreen({ Key? key }) : super(key: key);

  final JoinScreenController joinScreenController = Get.put<JoinScreenController>(JoinScreenController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<JoinScreenController>(
      builder: (controller) {
        return WillPopScope(
            onWillPop: joinScreenController.onWillPopScope,
            child: Scaffold(
              backgroundColor: primaryColor,
              body: SafeArea(
                child: LayoutBuilder(
                  builder:
                      (BuildContext context, BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Camera Preview
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 100, horizontal: 36),
                                child: SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      (joinScreenController.cameraController == null) && joinScreenController.isCameraOn
                                          ? !(joinScreenController.cameraController
                                          ?.value.isInitialized ??
                                          false)
                                          ? Container(
                                        child: const Center(
                                          child:
                                          CircularProgressIndicator(),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                12)),
                                      )
                                          : Container(
                                        child: const Center(
                                          child:
                                          CircularProgressIndicator(),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                12)),
                                      )
                                          : AspectRatio(
                                        aspectRatio: 1 / 1.55,
                                        child: joinScreenController.isCameraOn
                                            ? ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            child: CameraPreview(
                                              joinScreenController.cameraController!,
                                            ))
                                            : Container(
                                          child: const Center(
                                            child: Text(
                                              "Camera is turned off",
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: black800,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  12)),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 16,

                                        // Meeting ActionBar
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Mic Action Button
                                              ElevatedButton(
                                                onPressed: () {
                                                  joinScreenController.updateMic();
                                                },
                                                child: Icon(
                                                    joinScreenController.isMicOn
                                                        ? Icons.mic
                                                        : Icons.mic_off,
                                                    color: joinScreenController.isMicOn
                                                        ? grey
                                                        : Colors.white),
                                                style: ElevatedButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  padding: const EdgeInsets.all(12),
                                                  primary:
                                                  joinScreenController.isMicOn ? Colors.white : red,
                                                  onPrimary: Colors.black,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (joinScreenController.isCameraOn) {
                                                    joinScreenController.cameraController?.dispose();
                                                    joinScreenController.cameraController = null;
                                                  } else {
                                                    joinScreenController.initCameraPreview();
                                                    // cameraController?.resumePreview();
                                                  }
                                                  joinScreenController.updateCamera();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  padding: const EdgeInsets.all(12),
                                                  primary: joinScreenController.isCameraOn
                                                      ? Colors.white
                                                      : red,
                                                ),
                                                child: Icon(
                                                  joinScreenController.isCameraOn
                                                      ? Icons.videocam
                                                      : Icons.videocam_off,
                                                  color: joinScreenController.isCameraOn
                                                      ? grey
                                                      : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(36.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    if (joinScreenController.isJoinMeetingSelected == null &&
                                        joinScreenController.isCreateMeetingSelected == null)
                                      MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          color: purple,
                                          child:  Text("Create Meeting",
                                              style: GoogleFonts.manrope(fontSize: 16)),
                                          onPressed: () {
                                            joinScreenController.updateMeeting(true, true);
                                          }
                                      ),
                                    const VerticalSpacer(16),
                                    if (joinScreenController.isJoinMeetingSelected == null &&
                                        joinScreenController.isCreateMeetingSelected == null)
                                      MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          color: black750,
                                          child:  Text("Join Meeting",
                                              style: GoogleFonts.manrope(fontSize: 16)),
                                          onPressed: () {
                                            joinScreenController.updateMeeting(false, true);
                                          }),
                                    if (joinScreenController.isJoinMeetingSelected != null &&
                                        joinScreenController.isCreateMeetingSelected != null)
                                      JoiningDetails(
                                        isCreateMeeting: joinScreenController.isCreateMeetingSelected!,
                                        onClickMeetingJoin: (meetingId, callType,
                                            displayName) =>
                                            joinScreenController.onClickMeetingJoin(meetingId, callType, displayName),
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }

}
