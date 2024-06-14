import 'package:astro_guide/controllers/notifications/NotificationsController.dart';
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

class Notifications extends StatelessWidget {
  Notifications({ Key? key }) : super(key: key);

  final NotificationsController notificationsController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<NotificationsController>(
      builder: (controller) {
        return notificationsController.load ?
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: getBody(),
        )
            : LoadingScreen();
      },
    );
  }

  Widget getBody() {
    return Column(
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
                child: CustomAppBar("My Notifications".tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: ListView.separated(
              itemCount: notificationsController.notifications.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemBuilder: (context, index) {
                return getNotificationsDesign(index, notificationsController.notifications[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget getNotificationsDesign(int index, NotificationModel notification) {
    return
      GestureDetector(
        onTap: () {
          notificationsController.goto("/notificationDetail", arguments: notification);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.colorGrey,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.created_at,
                style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.labelColor(),
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(
                notification.title,
                style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.labelColor(),
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                notification.description,
                style: GoogleFonts.manrope(
                  fontSize: 14.0,
                  color: MyColors.labelColor(),
                ),
              ),
            ],
          ),
        ),
      );
  }

}