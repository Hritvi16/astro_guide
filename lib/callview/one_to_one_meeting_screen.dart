import 'dart:async';
import 'package:astro_guide/callview/JoinScreen.dart';
import 'package:astro_guide/callview/utils/toast.dart';
import 'package:astro_guide/callview/widgets/common/app_bar/meeting_appbar.dart';
import 'package:astro_guide/callview/widgets/common/joining/participant_limit_reached.dart';
import 'package:astro_guide/callview/widgets/common/joining/waiting_to_join.dart';
import 'package:astro_guide/callview/widgets/common/meeting_controls/meeting_action_bar.dart';
import 'package:astro_guide/views/home/call/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videosdk/videosdk.dart';

import '../../../controllers/call/CallController.dart';

// Meeting Screen
class OneToOneMeetingScreen extends StatefulWidget {
  final String meetingId, token, displayName;
  final bool micEnabled, camEnabled, chatEnabled;

  const OneToOneMeetingScreen({
    Key? key,
    required this.meetingId,
    required this.token,
    required this.displayName,
    this.micEnabled = true,
    this.camEnabled = true,
    this.chatEnabled = true,
  }) : super(key: key);

  @override
  _OneToOneMeetingScreenState createState() => _OneToOneMeetingScreenState();
}

class _OneToOneMeetingScreenState extends State<OneToOneMeetingScreen> {
  bool isRecordingOn = false;
  bool showChatSnackbar = true;
  String recordingState = "RECORDING_STOPPED";

  // Meeting
  late Room meeting;
  bool _joined = false;
  bool _moreThan2Participants = false;

  // Streams
  Stream? shareStream;
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;

  bool fullScreen = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Create instance of Room (Meeting)
    Room room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: widget.displayName,
      micEnabled: widget.micEnabled,
      camEnabled: widget.camEnabled,
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

  @override
  Widget build(BuildContext context) {
    //Get statusbar height
    final statusbarHeight = MediaQuery.of(context).padding.top;

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: _joined
          ? SafeArea(
              child: Scaffold(
                  backgroundColor: Theme.of(context).primaryColor,
                  body: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MeetingAppBar(
                        meeting: meeting,
                        token: widget.token,
                        // recordingState: recordingState,
                        isFullScreen: fullScreen,
                      ),
                      // Expanded(
                      //   child: GestureDetector(
                      //       onDoubleTap: () => {
                      //             setState(() {
                      //               fullScreen = !fullScreen;
                      //             })
                      //           },
                      //       child: OneToOneMeetingContainer(callController: CallController(), meeting: meeting, token: token,)),
                      // ),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        crossFadeState: !fullScreen
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        secondChild: const SizedBox.shrink(),
                        firstChild: MeetingActionBar(
                          meeting: meeting,
                          isMicEnabled: audioStream != null,
                          isCamEnabled: videoStream != null,
                          isSpeakerEnabled: true,
                          recordingState: recordingState,
                          // Called when Call End button is pressed
                          onCallEndButtonPressed: () {
                            meeting.end();
                          },

                          onCallLeaveButtonPressed: () {
                            meeting.leave();
                          },
                          // Called when mic button is pressed
                          onMicButtonPressed: () {
                            if (audioStream != null) {
                              meeting.muteMic();
                            } else {
                              meeting.unmuteMic();
                            }
                          },
                          // Called when camera button is pressed
                          onCameraButtonPressed: () {
                            if (videoStream != null) {
                              meeting.disableCam();
                            } else {
                              meeting.enableCam();
                            }
                          },

                          onSpeakerButtonPressed: ()  {
                          },
                        ),
                      ),
                    ],
                  )),
            )
          : _moreThan2Participants
              ? ParticipantLimitReached(
                  meeting: meeting,
                )
              :  WaitingToJoin("", "", (){}, "", "", (){}, (){}, (){}),
    );
  }

  void registerMeetingEvents(Room _meeting) {
    // Called when joined in meeting
    _meeting.on(
      Events.roomJoined,
      () {
        if (_meeting.participants.length > 1) {
          setState(() {
            meeting = _meeting;
            _moreThan2Participants = true;
          });
        } else {
          setState(() {
            meeting = _meeting;
            _joined = true;
          });

          subscribeToChatMessages(_meeting);
        }
      },
    );

    // Called when meeting is ended
    _meeting.on(Events.roomLeft, (String? errorMsg) {
      if (errorMsg != null) {
        showSnackBarMessage(
            message: "Meeting left due to $errorMsg !!", context: context);
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => JoinScreen()),
          (route) => false);
    });

    // Called when recording is started
    _meeting.on(Events.recordingStateChanged, (String status) {
      showSnackBarMessage(
          message:
              "Meeting recording ${status == "RECORDING_STARTING" ? "is starting" : status == "RECORDING_STARTED" ? "started" : status == "RECORDING_STOPPING" ? "is stopping" : "stopped"}",
          context: context);

      setState(() {
        recordingState = status;
      });
    });

    // Called when stream is enabled
    _meeting.localParticipant.on(Events.streamEnabled, (Stream _stream) {
      if (_stream.kind == 'video') {
        setState(() {
          videoStream = _stream;
        });
      } else if (_stream.kind == 'audio') {
        setState(() {
          audioStream = _stream;
        });
      } else if (_stream.kind == 'share') {
        setState(() {
          shareStream = _stream;
        });
      }
    });

    // Called when stream is disabled
    _meeting.localParticipant.on(Events.streamDisabled, (Stream _stream) {
      if (_stream.kind == 'video' && videoStream?.id == _stream.id) {
        setState(() {
          videoStream = null;
        });
      } else if (_stream.kind == 'audio' && audioStream?.id == _stream.id) {
        setState(() {
          audioStream = null;
        });
      } else if (_stream.kind == 'share' && shareStream?.id == _stream.id) {
        setState(() {
          shareStream = null;
        });
      }
    });

    // Called when presenter is changed
    _meeting.on(Events.presenterChanged, (_activePresenterId) {
      Participant? activePresenterParticipant =
          _meeting.participants[_activePresenterId];

      // Get Share Stream
      Stream? _stream = activePresenterParticipant?.streams.values
          .singleWhere((e) => e.kind == "share");

      setState(() => remoteParticipantShareStream = _stream);
    });

    _meeting.on(
        Events.participantLeft,
        (participant) => {
              if (_moreThan2Participants)
                {
                  if (_meeting.participants.length < 2)
                    {
                      setState(() {
                        _joined = true;
                        _moreThan2Participants = false;
                      }),
                      subscribeToChatMessages(_meeting),
                    }
                }
            });

    _meeting.on(
        Events.error,
        (error) => {
              showSnackBarMessage(
                  message: error['name'].toString() +
                      " :: " +
                      error['message'].toString(),
                  context: context)
            });
  }

  void subscribeToChatMessages(Room meeting) {
    meeting.pubSub.subscribe("CHAT", (message) {
      if (message.senderId != meeting.localParticipant.id) {
        if (mounted) {
          // print("navigator key");
          // print(navigatorKey.currentWidget?.key.toString());
          if (showChatSnackbar) {
            showSnackBarMessage(
                message: message.senderName + ": " + message.message,
                context: context);
          }
        }
      }
    });
  }

  Future<bool> _onWillPopScope() async {
    meeting.leave();
    return true;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}
