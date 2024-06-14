import 'package:astro_guide/controllers/notifications/NotificationDetailController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/notification/NotificationModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationDetail extends StatelessWidget {
  NotificationDetail({ Key? key }) : super(key: key);

  final NotificationDetailController notificationDetailController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<NotificationDetailController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: getBody(),
        );
      },
    );
  }

  Widget getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar("Notification Detail".tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Essential.getDateTime(notificationDetailController.notification.created_at),
                    style: GoogleFonts.manrope(
                        fontSize: 14.0,
                        color: MyColors.colorButton,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  notificationDetailController.notification.title,
                  style: GoogleFonts.manrope(
                      fontSize: 20.0,
                      color: MyColors.labelColor(),
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  notificationDetailController.notification.description,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.labelColor(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getNotificationDetailDesign(int index, NotificationModel notification) {
    return
      Column(
        children: [
          Text(
            notification.title,
            style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.labelColor(),
                fontWeight: FontWeight.w700
            ),
          ),
          Text(
            notification.description,
            style: GoogleFonts.manrope(
              fontSize: 12.0,
              color: MyColors.labelColor(),
            ),
          ),
        ],
      );
  }

}