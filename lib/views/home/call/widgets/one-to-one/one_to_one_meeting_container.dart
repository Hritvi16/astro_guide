import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/call/CallController.dart';
import 'package:astro_guide/views/home/call/constants/colors.dart';
import 'package:astro_guide/views/home/call/widgets/meeting_controls/meeting_action_bar.dart';
import 'package:astro_guide/views/home/call/widgets/one-to-one/participant_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videosdk/videosdk.dart';


class OneToOneMeetingContainer extends StatefulWidget {
  final Room meeting;
  final CallController callController;
  final String token;
  final int poor;
  final Duration? timer;
  const OneToOneMeetingContainer({Key? key, required this.meeting, required this.callController, required this.poor,  required this.token, required this.timer})
      : super(key: key);

  @override
  State<OneToOneMeetingContainer> createState() =>
      _OneToOneMeetingContainerState();
}

class _OneToOneMeetingContainerState extends State<OneToOneMeetingContainer> {
  Stream? localVideoStream;
  Stream? localShareStream;
  Stream? localAudioStream;
  Stream? remoteAudioStream;
  Stream? remoteVideoStream;
  Stream? remoteShareStream;

  Stream? largeViewStream;
  Stream? smallViewStream;
  Participant? largeParticipant, smallParticipant;
  Participant? localParticipant, remoteParticipant;
  String? activeSpeakerId, presenterId;

  bool isSmallViewLeftAligned = false;

  @override
  void initState() {
    localParticipant = widget.meeting.localParticipant;
    // Setting meeting event listeners
    setMeetingListeners(widget.meeting);

    try {
      remoteParticipant = widget.meeting.participants.isNotEmpty
          ? widget.meeting.participants.entries.first.value
          : null;
      if (remoteParticipant != null) {
        addParticipantListener(remoteParticipant!, true);
      }
    } catch (error) {}
    addParticipantListener(localParticipant!, false);
    super.initState();
    updateView();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
          children: [
        Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              color: black800,
            ),
            child: ParticipantView(
              avatarBackground: black700,
              stream: largeViewStream,
              isMicOn: remoteParticipant != null
                  ? remoteAudioStream != null
                  : localAudioStream != null,
              onStopScreeenSharePressed: () =>
                  widget.meeting.disableScreenShare(),
              participant: remoteParticipant != null
                  ? remoteParticipant!
                  : localParticipant!,
              isLocalScreenShare: localShareStream != null,
              isScreenShare:
              remoteShareStream != null || localShareStream != null,
              avatarTextSize: 40,
            )),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: !widget.callController.fullScreen
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              secondChild: const SizedBox.shrink(),
              firstChild: widget.callController.joined ?
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: MyColors.red,
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: Text(
                        widget.timer == null
                            ? "00:00:00"
                            : (widget.timer!.inHours>9 ? "" : "0")+widget.timer.toString().split(".").first,
                        style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors.white),
                      ),
                    ),
                    if(widget.poor!=1)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: MyColors.red,
                            // color: widget.poor==0 ? MyColors.colorGrey : MyColors.red,
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: Text(
                          "${widget.poor==0 ? "No Internet" : "Poor"} Connection",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColors.white),
                        ),
                      ),
                  ],
                ),
              ) : Container(),
            ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (remoteParticipant != null || localShareStream != null)
                Padding(
                  padding: EdgeInsets.only(
                    right: isSmallViewLeftAligned ? 0 : 8,
                    left: isSmallViewLeftAligned ? 8 : 0,
                    bottom: 8,
                  ),
                // Positioned(
                    // right: isSmallViewLeftAligned ? null : 8,
                    // left: isSmallViewLeftAligned ? 8 : null,
                    // bottom: 8,
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                        int sensitivity = 8;
                        if (details.delta.dx > sensitivity) {
                          // Right Swipe
                          setState(() {
                            isSmallViewLeftAligned = false;
                          });
                        } else if (details.delta.dx < -sensitivity) {
                          //Left Swipe
                          setState(() {
                            isSmallViewLeftAligned = true;
                          });
                        }
                      },
                      child: Container(
                          height: 160,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: black600,
                          ),
                          child: ParticipantView(
                            avatarTextSize: 30,
                            avatarBackground: black500,
                            stream: smallViewStream,
                            isMicOn: (localAudioStream != null &&
                                remoteShareStream == null) ||
                                (remoteAudioStream != null &&
                                    remoteShareStream != null),
                            onStopScreeenSharePressed: () =>
                                widget.meeting.disableScreenShare(),
                            participant: remoteShareStream != null
                                ? remoteParticipant!
                                : localParticipant!,
                            isLocalScreenShare: false,
                            isScreenShare: false,
                          )),
                    )),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: !widget.callController.fullScreen
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                secondChild: const SizedBox.shrink(),
                firstChild: widget.callController.joined ? MeetingActionBar(
                  meeting: widget.callController.meeting!,
                  isMicEnabled: widget.callController.audioStream != null,
                  isCamEnabled: widget.callController.videoStream != null,
                  isSpeakerEnabled: widget.callController.speakerEnabled,
                  recordingState: widget.callController.meeting?.recordingState??"RECORDING_STOPPED",
                  // Called when Call End button is pressed
                  onCallEndButtonPressed: () {
                    print("ssweb: end pressedddddd");
                    widget.callController.end(false);
                    // Get.back();
                  },

                  onCallLeaveButtonPressed: () {
                    widget.callController.meeting?.leave();
                  },
                  // Called when mic button is pressed
                  onMicButtonPressed: () {
                    widget.callController.updateMic();
                  },
                  // Called when camera button is pressed
                  onCameraButtonPressed: () {
                    print("ssweb: hiiiii");
                    widget.callController.updateCamera();
                  },
                  // Called when speaker button is pressed
                  onSpeakerButtonPressed: () {
                    print("hekko");
                    widget.callController.updateSpeaker();
                  },

                  // onSwitchMicButtonPressed: (details) async {
                  //   List<MediaDeviceInfo> outptuDevice =
                  //   widget.callController.meeting.getAudioOutputDevices();
                  //   double bottomMargin = (70.0 * outptuDevice.length);
                  //   final screenSize = MediaQuery.of(context).size;
                  //   await showMenu(
                  //     context: context,
                  //     color: black700,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12)),
                  //     position: RelativeRect.fromLTRB(
                  //       screenSize.width - details.globalPosition.dx,
                  //       details.globalPosition.dy - bottomMargin,
                  //       details.globalPosition.dx,
                  //       (bottomMargin),
                  //     ),
                  //     items: outptuDevice.map((e) {
                  //       return PopupMenuItem(
                  //           value: e, child: Text(e.label));
                  //     }).toList(),
                  //     elevation: 8.0,
                  //   ).then((value) {
                  //     if (value != null) {
                  //       print("valueeeeeee");
                  //       print(value.kind);
                  //       print(value.label);
                  //       print(value.deviceId);
                  //       print(value.groupId);
                  //       widget.callController.meeting.switchAudioDevice(value);
                  //     }
                  //   });
                  // },
                ) : Container(),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void setMeetingListeners(Room _meeting) {
    // Called when participant joined meeting
    _meeting.on(
      Events.participantJoined,
      (Participant participant) {
        print("Participantssssss");
        print(widget.meeting.participants.entries);
        setState(() {
          remoteParticipant = widget.meeting.participants.isNotEmpty
              ? widget.meeting.participants.entries.first.value
              : null;
          updateView();

          if (remoteParticipant != null) {
            addParticipantListener(remoteParticipant!, true);
          }
        });
      },
    );

    // Called when participant left meeting
    _meeting.on(
      Events.participantLeft,
      (participantId) {
        if (remoteParticipant?.id == participantId) {
          setState(() {
            remoteParticipant = null;
            remoteShareStream = null;
            remoteVideoStream = null;
            updateView();
          });
        }
        setState(() {
          remoteParticipant = widget.meeting.participants.isNotEmpty
              ? widget.meeting.participants.entries.first.value
              : null;
          if (remoteParticipant != null) {
            addParticipantListener(remoteParticipant!, true);
            updateView();
          }
        });
      },
    );

    _meeting.on(Events.presenterChanged, (_presenterId) {
      setState(() {
        presenterId = _presenterId;
      });
    });

    // Called when speaker is changed
    _meeting.on(Events.speakerChanged, (_activeSpeakerId) {
      setState(() {
        activeSpeakerId = _activeSpeakerId;
      });
    });
  }

  void updateView() {
    Stream? _largeViewStream, _smallViewStream;
    if (remoteParticipant != null) {
      if (remoteShareStream != null) {
        _largeViewStream = remoteShareStream;
      } else if (localShareStream != null) {
        _largeViewStream = null;
      } else {
        _largeViewStream = remoteVideoStream;
      }
      if (remoteShareStream != null || localShareStream != null) {
        if (remoteVideoStream != null) {
          _smallViewStream = remoteVideoStream;
        }
      } else {
        _smallViewStream = localVideoStream;
      }
    } else {
      if (localShareStream != null) {
        _smallViewStream = localVideoStream;
      } else {
        _largeViewStream = localVideoStream;
      }
    }
    setState(() {
      largeViewStream = _largeViewStream;
      smallViewStream = _smallViewStream;
    });
  }

  void addParticipantListener(Participant participant, bool isRemote) {
    participant.streams.forEach((key, Stream stream) {
      setState(() {
        if (stream.kind == 'video') {
          if (isRemote) {
            remoteVideoStream = stream;
          } else {
            localVideoStream = stream;
          }
        } else if (stream.kind == 'share') {
          if (isRemote) {
            remoteShareStream = stream;
          } else {
            localShareStream = stream;
          }
        } else if (stream.kind == 'audio') {
          if (isRemote) {
            remoteAudioStream = stream;
          } else {
            localAudioStream = stream;
          }
        }
        updateView();
      });
    });
    participant.on(Events.streamEnabled, (Stream _stream) {
      setState(() {
        if (_stream.kind == "video") {
          if (isRemote) {
            remoteVideoStream = _stream;
          } else {
            localVideoStream = _stream;
          }
        } else if (_stream.kind == "share") {
          if (isRemote) {
            remoteShareStream = _stream;
          } else {
            localShareStream = _stream;
          }
        } else if (_stream.kind == 'audio') {
          if (isRemote) {
            remoteAudioStream = _stream;
          } else {
            localAudioStream = _stream;
          }
        }
        updateView();
      });
    });

    participant.on(Events.streamDisabled, (Stream _stream) {
      setState(() {
        if (_stream.kind == "video") {
          if (isRemote) {
            remoteVideoStream = null;
          } else {
            localVideoStream = null;
          }
        } else if (_stream.kind == "share") {
          if (isRemote) {
            remoteShareStream = null;
          } else {
            localShareStream = null;
          }
        } else if (_stream.kind == 'audio') {
          if (isRemote) {
            remoteAudioStream = null;
          } else {
            localAudioStream = null;
          }
        }
        updateView();
      });
    });
  }
}
