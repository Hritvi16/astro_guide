// import 'package:astro_guide/call/CallController.dart';
// import 'package:astro_guide/callview/widgets/common/joining/waiting_to_join.dart';
// import 'package:astro_guide/callview/widgets/one-to-one/one_to_one_meeting_container.dart';
// import 'package:astro_guide/colors/MyColors.dart';
// import 'package:astro_guide/constants/CommonConstants.dart';
// import 'package:astro_guide/essential/Essential.dart';
// import 'package:astro_guide/services/StorageService.dart';
// import 'package:astro_guide/services/networking/ApiConstants.dart';
// import 'package:astro_guide/shared/CustomClipPath.dart';
// import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
// import 'package:astro_guide/size/MySize.dart';
// import 'package:astro_guide/size/WidgetSize.dart';
// import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class Call extends StatelessWidget {
//   Call({ Key? key }) : super(key: key);
//
//   final CallController callController = Get.put<CallController>(CallController());
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final statusBarHeight = MediaQuery.of(context).padding.top;
//     StorageService.storeCalling(callController);
//     print(callController.type);
//     print("callController.type");
//     return GetBuilder<CallController>(
//       builder: (controller) {
//         return WillPopScope(
//           onWillPop: callController.onWillPopScope,
//           child: callController.load ? callController.type!="ACTIVE" && callController.type!="COMPLETED" ?
//           WaitingToJoin(callController.astrologer.name, callController.astrologer.profile, callController.cancelMeeting, callController.type, callController.action, callController.accept,  callController.reject, callController.back) :
//             Scaffold(
//               body: callController.type=="COMPLETED" ? getCompletedDesign(context) : getActiveDesign(context),
//               bottomNavigationBar: callController.type=="COMPLETED" ? getBottom(context) : null,
//             ) : LoadingScreen()
//           // : WaitingToJoin(callController.astrologer.name),
//         );
//       },
//     );
//   }
//
//
//   Widget getCompletedDesign(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: MySize.size100(context),
//           height: standardUpperFixedDesignHeight,
//           child: ClipPath(
//             clipper: CustomClipPath(),
//             child: Container(
//               height: standardUpperFixedDesignHeight,
//               decoration: BoxDecoration(
//                   color: MyColors.colorPrimary,
//                   image: Essential.getPlatform() ?
//                   const DecorationImage(
//                       image: AssetImage(
//                           "assets/essential/upper_bg_s.png"
//                       )
//                   ) : null
//               ),
//               child: SafeArea(
//                 child: CustomAppBar('Call Detail'.tr),
//               ),
//             ),
//           ),
//         ),
//         Flexible(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     getTitleInfo("${'Astrologer'.tr} ${'Name'.tr}", callController.astrologer.name),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     getTitleInfo("Session Type".tr, callController.sessionHistory.type, color: Essential.getSessionTypeColor(callController.sessionHistory.type)),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     getTitleInfo("Rate".tr, "${CommonConstants.rupee}${callController.sessionHistory.rate}/min"),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     getTitleInfo("Status".tr, callController.sessionHistory.status, color: Essential.getStatusColor(callController.sessionHistory.status)),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     getIconInfo("assets/common/info.png", callController.sessionHistory.reason??""),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         getIconInfo("assets/sign_up/calendar.png", Essential.getDate(Essential.getDTByStatus(callController.sessionHistory))),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         getIconInfo("assets/sign_up/time.png", Essential.getTime(Essential.getDTByStatus(callController.sessionHistory))),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     getTitleInfo("Amount".tr, "${CommonConstants.rupee}${callController.sessionHistory.amount}"),
//                   ]
//               ),
//             )
//         )
//       ],
//     );
//   }
//
//   Widget getActiveDesign(BuildContext context) {
//     return SafeArea(
//       child: Stack(
//         // mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//             height: MySize.sizeh100(context),
//             child: GestureDetector(
//                 onTap: ()  {
//                   callController.updateFullScreen();
//                 },
//                 // child: callController.joined ?
//                 child: callController.meeting!=null ?
//                 OneToOneMeetingContainer(callController: callController, meeting: callController.meeting!, token: callController.token, timer: Duration(seconds: callController.seconds),)
//                     : LoadingScreen()
//               // : WaitingToJoin(callController.astrologer.name, callController.astrologer.profile, callController.endMeeting, callController.type, callController.back, callController.accept,  callController.end)
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget getTitleInfo(String title, String info, {Color? color}) {
//     return RichText(
//       text: TextSpan(
//           text: title+": ",
//           style:GoogleFonts.manrope(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: MyColors.labelColor()
//           ),
//           children: [
//             TextSpan(
//               text: info,
//               style:GoogleFonts.manrope(
//                   fontWeight: FontWeight.w600,
//                   color: color
//               ),
//             )
//           ]
//       ),
//     );
//   }
//
//   Widget getIconInfo(String icon, String info, {Color? color}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.asset(
//           icon,
//           height: 20,
//           width: 20,
//           color: color??MyColors.colorButton,
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         Text(
//           info,
//           style: GoogleFonts.manrope(
//             fontSize: 14.0,
//             color: MyColors.labelColor(),
//             letterSpacing: 0,
//             fontWeight: FontWeight.w600,
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget getBottom(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         getReviewSection(context),
//         getEndedBottom(context),
//       ],
//     );
//   }
//
//   getReviewSection(BuildContext context) {
//     return Container(
//       width: MySize.size100(context),
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       decoration: BoxDecoration(
//         color: MyColors.colorLightPrimary,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Flexible(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Your Review".tr,
//                     style: GoogleFonts.manrope(
//                         fontSize: 18,
//                         color: MyColors.black,
//                         fontWeight: FontWeight.w500
//                     ),
//                   ),
//                 ),
//               ),
//               if(callController.sessionHistory.rating!=null)
//                 InkWell(
//                   onTapDown: (TapDownDetails details) {
//                     showPopupMenu(context, details);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Image.asset(
//                       "assets/common/more.png",
//                       height: 18,
//                       color: MyColors.colorInfoGrey,
//                     ),
//                   ),
//                 )
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           callController.sessionHistory.rating!=null ? showRating() : askRating()
//         ],
//       ),
//     );
//   }
//
//   getEndedBottom(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         width: MySize.size100(context),
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         decoration: BoxDecoration(
//           color: MyColors.colorButton,
//           // borderRadius: BorderRadius.only(
//           //   topLeft: Radius.circular(10),
//           //   topRight: Radius.circular(10)
//           // )
//         ),
//         child: Column(
//           children: [
//             Text(
//               "${'Call'.tr} ${'Duration'.tr}: ${Essential.getChatDuration(callController.action=="VIEW" ? null : callController.seconds, callController.sessionHistory.started_at??"", callController.sessionHistory.ended_at??"", )}",
//               style: GoogleFonts.manrope(
//                   fontSize: 14,
//                   color: MyColors.labelColor(),
//                   fontWeight: FontWeight.w500
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               "Please let us know your genuine and honest feedback about the astrologer. So we can serve you the best.".tr,
//               textAlign: TextAlign.center,
//               style: GoogleFonts.manrope(
//                   fontSize: 12,
//                   color: MyColors.white
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget askRating() {
//     return GestureDetector(
//       onTap: () {
//         callController.manageRating();
//       },
//       child: RatingBar.builder(
//         initialRating: 5,
//         direction: Axis.horizontal,
//         itemCount: 5,
//         unratedColor: MyColors.colorUnrated,
//         itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
//         ignoreGestures: true,
//         itemSize: 30,
//         itemBuilder: (context, _) => Image.asset(
//           "assets/common/star_outlined.png",
//           color: MyColors.colorButton,
//         ),
//         onRatingUpdate: (rating) {
//           print(rating);
//         },
//       ),
//     );
//   }
//
//   Widget showRating() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 16,
//               backgroundColor: MyColors.colorButton,
//               child: callController.sessionHistory.anonymous==1 || (callController.sessionHistory.user_profile??"").isEmpty ?
//               CircleAvatar(
//                 radius: 15,
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Image.asset(
//                     "assets/sign_up/profile.png",
//                     color: MyColors.black,
//                   ),
//                 ),
//               )
//                   : CircleAvatar(
//                 radius: 15,
//                 backgroundImage: NetworkImage(
//                     ApiConstants.userUrl+(callController.sessionHistory.user_profile??"")
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 2.0, bottom: 5),
//                         child: Text(
//                           callController.sessionHistory.anonymous==1 ? "Anonymous".tr : callController.sessionHistory.user??"",
//                           style: GoogleFonts.manrope(
//                               fontSize: 14,
//                               color: MyColors.black,
//                               fontWeight: FontWeight.w600
//                           ),
//                         ),
//                       ),
//                       showRatings(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               callController.sessionHistory.review??"",
//               style: GoogleFonts.manrope(
//                   fontSize: 14,
//                   color: MyColors.colorInfoGrey,
//                   fontWeight: FontWeight.w600
//               ),
//             ),
//
//
//             if((callController.sessionHistory.reply??"").isNotEmpty)
//               Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.only(top: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: MyColors.colorPrimary.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(
//                         10
//                     ),
//                     border: Border.all(
//                         color: MyColors.colorButton
//                     )
//                 ),
//                 child: Text(
//                   callController.sessionHistory.reply??"",
//                   style: GoogleFonts.manrope(
//                     fontSize: 14.0,
//                     color: MyColors.black,
//                     letterSpacing: 0,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget showRatings() {
//     return RatingBar.builder(
//       initialRating: callController.sessionHistory.rating??0,
//       direction: Axis.horizontal,
//       itemCount: 5,
//       itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//       ignoreGestures: true,
//       itemSize: 16,
//       unratedColor: MyColors.colorUnrated,
//       itemBuilder: (context, _) => Image.asset(
//         "assets/common/star.png",
//         color: MyColors.colorButton,
//       ),
//       onRatingUpdate: (rating) {
//       },
//     );
//   }
//
//   showPopupMenu(BuildContext context, TapDownDetails details){
//     showMenu<String>(
//       context: context,
//
//       position: RelativeRect.fromLTRB(
//         details.globalPosition.dx,
//         details.globalPosition.dy+10,
//         details.globalPosition.dx,
//         details.globalPosition.dy,),  //position where you want to show the menu on screen
//       items: [
//         PopupMenuItem<String>(
//           child: const Text('Edit Review'), value: '1', height: 40,),
//         PopupMenuItem<String>(
//           child: const Text('Delete'), value: '2', height: 40,),
//       ],
//       elevation: 8.0,
//     ).then<void>((String? itemSelected) {
//
//       if (itemSelected == null) return;
//
//       if(itemSelected == "1") {
//         callController.manageRating();
//       }
//       else if(itemSelected == "2"){
//         callController.confirmDelete();
//       }
//
//     });
//   }
// }
