import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/setting/SettingController.dart';
import 'package:astro_guide/controllers/theme/ThemesController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Setting extends StatelessWidget {
  Setting({ Key? key }) : super(key: key);

  final SettingController settingController = Get.put<SettingController>(
      SettingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SettingController>(
      builder: (controller) {
        return Scaffold(
          body: getBody(context, theme),
        );
      },
    );
  }

  Widget getBody(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: standardHorizontalPagePadding),
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: Essential.getPlatform() ?
                  const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  ) : null
              ),
              child: SafeArea(
                child: Padding(
                  // color: Colors.white,
                  padding: const EdgeInsets.only(top: 25.0, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings'.tr,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22.0,
                          color: MyColors.black,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          settingController.goto("/myProfile");
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  settingController.user.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 22.0,
                                    color: MyColors.black,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            (settingController.user.profile??"").isEmpty ?
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                color: MyColors.grey30,
                                size: 50,
                              ),
                              backgroundColor: MyColors.white,
                            )
                                : CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  ApiConstants.userUrl+(settingController.user.profile??"")
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     CircleAvatar(
                      //       radius: 40,
                      //       backgroundImage: NetworkImage(
                      //           ApiConstants.userUrl+settingController.user.profile
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: settingController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  settingsTab('Wishlist'.tr, "assets/common/fav.png", '', null, theme, onTab: () => Get.toNamed("/wishlist", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Following'.tr, "assets/sign_up/profile.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/following", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('My Testimonials'.tr, "assets/sign_up/profile.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/myTestimonial", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Notification'.tr, "assets/common/notification.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/aboutUs", )),
                  SizedBox(
                    height: 16,
                  ),
                  GetBuilder<ThemesController>(builder: (_) {
                    return settingsTabI('Appearance'.tr, Get.isDarkMode ? Icons.dark_mode : Icons.light_mode, _.theme.toCapitalized(), MyColors.labelColor(), theme, onTab: () => showAppearanceModal(theme, _.theme));
                    // return Text(_.theme);
                  }),

                  const SizedBox(height: 16),
                  settingsTab('Change App Language'.tr, "assets/common/lang.png", (settingController.storage.read("language")??"").toUpperCase(), null, theme, onTab: () => settingController.goto("/language")),

                  const SizedBox(height: 16),
                  settingsTab('Change Mobile No.'.tr, "assets/common/telephone.png", "", MyColors.colorButton, theme, onTab: () => settingController.goto("/changeMobile", arguments: settingController.user.mobile)),

                  const SizedBox(height: 16),
                  settingsTab('Support'.tr, "assets/common/support_filled.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/support", )),

                  const SizedBox(height: 16),
                  settingsTabWI('Terms and Condition'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.tc_64, "title" : "Terms and Condition"})),

                  const SizedBox(height: 16),
                  settingsTabWI('Privacy Policy'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.privacy_64, "title" : "Privacy Policy"})),

                  const SizedBox(height: 16),
                  settingsTabWI('Refund & Cancellation Policy'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.cr_64, "title" : "Refund & Cancellation Policy"})),

                  const SizedBox(height: 16),
                  settingsTabWI('About Us'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.about_64, "title" : "About Us"})),

                  const SizedBox(height: 16),
                  settingsTabWI('Contact Us'.tr, "", null, theme, onTab: () => settingController.goto("/contactUs", arguments: settingController.setting)),

                  const SizedBox(height: 16),
                  settingsTabI('Logout'.tr, Icons.logout, "", null, theme, onTab: () => settingController.logout()),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget settingsTab(String title, String icon, String trailing, Color? color, theme, {onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: MyColors.cardColor(),
            // color: MyColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: Get.isDarkMode ? null
                : const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ]
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 25,
              color: color,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                    color: MyColors.labelColor()
                  ),
                  children: [
                    if(trailing.isNotEmpty)
                      TextSpan(
                        text: " (${trailing})",
                        style: GoogleFonts.manrope(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsTabWI(String title, String trailing, Color? color, theme, {onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ]
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                color: MyColors.colorButton,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsTabI(String title, IconData icon, String trailing, Color? color, theme, {onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: MyColors.cardColor(),
            borderRadius: BorderRadius.circular(10),
            boxShadow: Get.isDarkMode ? null
                : const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ]
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: color??MyColors.colorButton,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
                color: color
              ),
            )
          ],
        ),
      ),
    );
  }

  showAppearanceModal(ThemeData theme, String current) {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          height: 320,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a Theme", style: theme.textTheme.subtitle1,),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(Icons.brightness_5, color: Colors.blue,),
                title: Text("Light", style: theme.textTheme.bodyText1),
                onTap: () {
                  settingController.themesController.setTheme('light');
                  Get.back();
                },
                trailing: Icon(Icons.check, color: current == 'light' ? Colors.blue : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_2, color: Colors.orange,),
                title: Text("Dark", style: theme.textTheme.bodyText1),
                onTap: () {
                  settingController.themesController.setTheme('dark');
                  Get.back();
                },
                trailing: Icon(Icons.check, color: current == 'dark' ? Colors.orange : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_6, color: Colors.blueGrey,),
                title: Text("System", style: theme.textTheme.bodyText1),
                onTap: () {
                  settingController.themesController.setTheme('system');
                  Get.back();
                },
                trailing: Icon(Icons.check, color: current == 'system' ? Colors.blueGrey : Colors.transparent,),
              ),
            ],
          ),
        )
    ).then((value) {
      settingController.update();
    });
  }
}