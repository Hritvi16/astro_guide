import 'package:astro_guide/chat_ui/received_message_screen.dart';
import 'package:astro_guide/chat_ui/received_voice_screen.dart';
import 'package:astro_guide/chat_ui/send_doc_screen.dart';
import 'package:astro_guide/chat_ui/send_image_screen.dart';
import 'package:astro_guide/chat_ui/send_message_screen.dart';
import 'package:astro_guide/chat_ui/send_voice_screen.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/SessionConstants.dart';
import 'package:astro_guide/controllers/chat/ChatController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/views/home/chat/Waiting.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Chat extends StatelessWidget {
  Chat({ Key? key }) : super(key: key);

  final ChatController chatController = Get.put<ChatController>(ChatController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        chatController.disposeObjects();
        return true;
      },
      child: GetBuilder<ChatController>(
        builder: (controller) {
          return chatController.load ? chatController.type!="ACTIVE" && chatController.type!="COMPLETED" ?
          Waiting(chatController.astrologer.name, chatController.astrologer.profile, chatController.cancelChat, chatController.type, chatController.back, chatController.initiateChat, chatController.rejectChat)
          : Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: MyColors.colorButton,
              centerTitle: false,
              iconTheme: IconThemeData(color: MyColors.black),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        // radius: standardServiceOCRadius,
                        radius: 25,
                        // backgroundImage: AssetImage(
                        //   "assets/test/user.jpg"
                        // ),
                        backgroundImage: NetworkImage(
                          ApiConstants.astrologerUrl+chatController.astrologer.profile
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chatController.astrologer.name,
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: MyColors.black
                            ),
                          ),
                          if(chatController.type=="ACTIVE")
                            Text(
                              chatController.getChatTime(),
                              style: GoogleFonts.manrope(
                                fontSize: 12,

                                  color: MyColors.black
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  if(chatController.type=="ACTIVE")
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            chatController.goto("/freeKundli", arguments: chatController.sessionHistory.k_id);
                          },
                          child: Image.asset(
                              "assets/astrology/kundali.png",
                            height: 50,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            chatController.endChat(false);
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: MyColors.colorError,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: MyColors.colorError,
                              child: Image.asset(
                                "assets/call/end.png"
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if(chatController.type=="COMPLETED")
                    Icon(
                      Icons.share
                    )
                ],
              ),
            ),
            // bottomNavigationBar: getBottomPage(),
            body: getBody(context, theme),
          ) : LoadingScreen();
        },
      ),
    );
  }

  Widget getBody(BuildContext context, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
          image: Essential.getPlatform() ?
          DecorationImage(
              image: AssetImage("assets/essential/bg.png")
          ) : null
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: chatController.chats.isNotEmpty ?
            ListView.separated(
              controller: chatController.controller,
              reverse: true,
              itemCount: chatController.chats.length,
              separatorBuilder: (buildContext, index) {
                return chatController.getDateDifference(chatController.chats[index].sent_at, chatController.chats[index+1].sent_at) ?
                getNewDateDesign(chatController.chats[index].sent_at)
                : SizedBox(
                  height: 0,
                );
              },
              itemBuilder: (buildContext, index) {
                return getChatDesign(index, chatController.chats[index]);
              },
            )
            : SizedBox(
              height: 100,
            ),
          ),
          chatController.type=="ACTIVE" ? getBottomPage(theme)
          : getBottom(context)
        ],
      ),
    );
  }

  Widget getChatDesign(int index, ChatModel chat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(index==chatController.chats.length-1)
          getNewDateDesign(chat.sent_at),
        chat.sender=="U" ?
        chat.m_type=="T" ?
        Column(
          children: [
            SentMessageScreen(chat: chat, color: MyColors.black,),
            if(chat.type=="A")
              SentMessageScreen(chat: chat.copyWith(message: SessionConstants.autoMessage), color: MyColors.red),
          ],
        )
        : chat.m_type=="V" ? SentVoiceScreen(chat: chat, color: MyColors.black, play: chatController.playAudio, pause: chatController.pauseAudio, player: chatController.player, playerUrl: chatController.playerUrl) : chat.m_type=="I" ? SendImageScreen(chat: chat, color: MyColors.black,) : SendDocScreen(chat: chat, color: MyColors.black,)
        : chat.m_type=="T" ? ReceivedMessageScreen(chat: chat) : ReceivedVoiceScreen(chat: chat, play: chatController.playAudio, pause: chatController.pauseAudio, player: chatController.player, playerUrl: chatController.playerUrl),
      ],
    );
  }

  // Widget getRatingDesign(int rate, int index) {
  //   return Image.asset(
  //     "assets/common/star.png",
  //     color: (index+1)<=rate ? MyColors.colorButton : MyColors.colorGrey,
  //   );
  // }

  getBottomPage(ThemeData theme) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            if((chatController.recordTimer?.isActive??false)==false)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      chatController.chooseOption(theme);
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: MyColors.iconColor(),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            Flexible(
              child: chatController.recordTimer?.isActive==true ?
              getRecordView() : getMessageBox(),
            ),
            SizedBox(
              width: 10,
            ),
            chatController.send ?
            GestureDetector(
              onTap: () {
                chatController.sendText();
              },
              child: CircleAvatar(
                backgroundColor: MyColors.colorButton,
                child: Icon(
                  Icons.send,
                  color: MyColors.black,
                  size: 20,
                ),
              ),
            ) :
            GestureDetector(
              // onLongPressStart: (details) {
              //   chatController.startRecording();
              // },
              // onLongPressEnd: (details) {
              //   chatController.stopRecording(true);
              // },
              onTap: () {
                chatController.recordingAction();
              },
              child: CircleAvatar(
                backgroundColor: MyColors.colorButton,
                child: chatController.recording ?
                Icon(
                  Icons.stop,
                  color: MyColors.black,
                )
                : Icon(
                  Icons.mic,
                  color: MyColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMessageBox () {
    return TextFormField(
      onChanged: (value) {
        chatController.changeSend();
      },
      textInputAction: TextInputAction.newline,
      style: GoogleFonts.manrope(
        fontSize: 16.0,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      controller: chatController.message,
      maxLines: 4,
      minLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.colorButton,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: "Type your message...",
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,),
      ),
      validator: (value) {
        if ((value??"").isEmpty) {
          return "* Required";
        }  else {
          return null;
        }
      },
    );
  }
  Widget getRecordView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: chatController.recordDuration%2==0 ? MyColors.colorPSigns : MyColors.colorInactive,
          child: Icon(
            Icons.mic,
            color: chatController.recordDuration%2==0 ? MyColors.black : MyColors.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          chatController.getTime(chatController.recordDuration),
          style: GoogleFonts.manrope(
              fontSize: 18,
              color: MyColors.black
          ),
        )
      ],
    );
  }

  Widget getBottom(BuildContext context) {
    return Column(
      children: [
        getReviewSection(context),
        getEndedBottom(context),
      ],
    );
  }

  getReviewSection(BuildContext context) {
    return Container(
      width: MySize.size100(context),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.colorLightPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your Review".tr,
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      color: MyColors.black,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              if(chatController.sessionHistory.rating!=null)
                InkWell(
                onTapDown: (TapDownDetails details) {
                  showPopupMenu(context, details);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    "assets/common/more.png",
                    height: 18,
                    color: MyColors.colorInfoGrey,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          chatController.sessionHistory.rating!=null ? showRating() : askRating()
        ],
      ),
    );
  }

  getEndedBottom(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MySize.size100(context),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: MyColors.colorButton,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(10),
          //   topRight: Radius.circular(10)
          // )
        ),
        child: Column(
          children: [
            Text(
              "${'Chat'.tr} ${'Duration'.tr}: ${Essential.getChatDuration(chatController.action=="VIEW" ? null : chatController.seconds, chatController.sessionHistory.started_at??"", chatController.sessionHistory.ended_at??"", )}",
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: MyColors.black,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Please let us know your genuine and honest feedback about the ${Essential.getPlatformWord()}. So we can serve you the best.".tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                  fontSize: 12,
                color: MyColors.white
              ),
            ),
          ],
        ),
      ),
    );
  }

  getNewDateDesign(String sent_at) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
          decoration: BoxDecoration(
            color: MyColors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
            Essential.getDisplayDate(sent_at),
            style: GoogleFonts.manrope(
              color: MyColors.white,
              fontSize: 12
            ),
          ),
        ),
      ],
    );
  }

  Widget askRating() {
    return GestureDetector(
      onTap: () {
        chatController.manageRating();
      },
      child: RatingBar.builder(
        initialRating: 5,
        direction: Axis.horizontal,
        itemCount: 5,
        unratedColor: MyColors.colorUnrated,
        itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
        ignoreGestures: true,
        itemSize: 30,
        itemBuilder: (context, _) => Image.asset(
          "assets/common/star_outlined.png",
          color: MyColors.colorButton,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }

  Widget showRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: MyColors.colorButton,
              child: chatController.sessionHistory.anonymous==1 || (chatController.sessionHistory.user_profile??"").isEmpty ?
              CircleAvatar(
                radius: 15,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/sign_up/profile.png",
                    color: MyColors.black,
                  ),
                ),
              )
              : CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    ApiConstants.userUrl+(chatController.sessionHistory.user_profile??"")
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 5),
                        child: Text(
                          chatController.sessionHistory.anonymous==1 ? "Anonymous".tr : chatController.sessionHistory.user??"",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: MyColors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      showRatings(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              Essential.getPlatformReplace(chatController.sessionHistory.review??""),
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: MyColors.colorInfoGrey,
                fontWeight: FontWeight.w600
              ),
            ),

            if((chatController.sessionHistory.reply??"").isNotEmpty)
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MyColors.colorPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(
                        10
                    ),
                    border: Border.all(
                        color: MyColors.colorButton
                    )
                ),
                child: Text(
                  chatController.sessionHistory.reply??"",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.black,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget showRatings() {
    return RatingBar.builder(
      initialRating: chatController.sessionHistory.rating??0,
      allowHalfRating: true,
      direction: Axis.horizontal,
      itemCount: 5,
      unratedColor: MyColors.colorUnrated,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      ignoreGestures: true,
      itemSize: 16,
      itemBuilder: (context, _) => Image.asset(
        "assets/common/star.png",
        color: MyColors.colorButton,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }

  showPopupMenu(BuildContext context, TapDownDetails details){
    showMenu<String>(
      context: context,

      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy+10,
        details.globalPosition.dx,
        details.globalPosition.dy,),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Edit Review'), value: '1', height: 40,),
        PopupMenuItem<String>(
            child: const Text('Delete'), value: '2', height: 40,),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1") {
        chatController.manageRating();
      }
      else if(itemSelected == "2"){
        chatController.confirmDelete();
      }

    });
  }
}
