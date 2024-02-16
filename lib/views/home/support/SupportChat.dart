import 'package:astro_guide/chat_ui/sreceived_message_screen.dart';
import 'package:astro_guide/chat_ui/ssend_message_screen.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/support/SupportChatController.dart';
import 'package:astro_guide/models/support/SupportChatModel.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SupportChat extends StatelessWidget {
  SupportChat({ Key? key }) : super(key: key);

  final SupportChatController supportChatController = Get.put<SupportChatController>(SupportChatController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SupportChatController>(
      builder: (controller) {
        return supportChatController.load ?  Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.colorButton,
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#${supportChatController.sup_id}",
                  style: GoogleFonts.manrope(
                      fontSize: 20
                  ),
                ),
                if(supportChatController.status=="REQUESTED" || supportChatController.status=="ACTIVE")
                  GestureDetector(
                    onTap: () {
                      supportChatController.endChat();
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
                // if(supportChatController.status=="ENDED")
                //   Icon(
                //       Icons.share
                //   )
              ],
            ),
          ),
          // bottomNavigationBar: getBottomPage(),
          backgroundColor: MyColors.white,
          body: getBody(context),
        ) : LoadingScreen();
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: supportChatController.chats.isNotEmpty ?
          ListView.separated(
            controller: supportChatController.controller,
            reverse: true,
            itemCount: supportChatController.chats.length,
            separatorBuilder: (buildContext, index) {
              return SizedBox(
                height: 0,
              );
            },
            itemBuilder: (buildContext, index) {
              return getChatDesign(index, supportChatController.chats[index]);
            },
          )
              : SizedBox(
            height: 100,
          ),
        ),
        supportChatController.status=="REQUESTED" || supportChatController.status=="ACTIVE" ? getBottomPage()
            : getBottom(context)
      ],
    );
  }

  Widget getChatDesign(int index, SupportChatModel chat) {
    return chat.sender=="U" ?
    Column(
      children: [
        SSentMessageScreen(chat: chat, color: MyColors.black,),
      ],
    ) : SReceivedMessageScreen(chat: chat);
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
                    "Your Review",
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        color: MyColors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              if(supportChatController.support.rating!=null)
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
          supportChatController. support.rating!=null ? showRating() : askRating()
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
              "Please let us know your genuine and honest feedback about the astrologer. So we can serve you the best.",
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


  getBottomPage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                onChanged: (value) {
                  supportChatController.changeSend();
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.newline,
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  color: MyColors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
                controller: supportChatController.message,
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
              ),
            ),
            SizedBox(
              width: 10,
            ),
            supportChatController.send ?
            GestureDetector(
              onTap: () {
                supportChatController.sendMessage();
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
            CircleAvatar(
              backgroundColor: MyColors.colorButton,
              child: Icon(
                Icons.mic,
                color: MyColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget askRating() {
    return GestureDetector(
      onTap: () {
        supportChatController.manageRating();
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showRatings(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              supportChatController.support.review??"",
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: MyColors.colorInfoGrey,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget showRatings() {
    return RatingBar.builder(
      initialRating: supportChatController.support.rating??0,
      allowHalfRating: true,
      direction: Axis.horizontal,
      unratedColor: MyColors.colorUnrated,
      itemCount: 5,
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
        supportChatController.manageRating();
      }
      else if(itemSelected == "2"){
        supportChatController.confirmDelete();
      }

    });
  }
}
