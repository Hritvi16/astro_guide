import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/history/HistoryController.dart';
import 'package:astro_guide/controllers/theme/ThemesController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/models/wallet/WalletHistoryModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/themes/Themes.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';


class History extends StatelessWidget  {
  History({ Key? key }) : super(key: key);

  final HistoryController historyController = Get.put<HistoryController>(HistoryController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ThemesController themeController = Get.put(ThemesController());
    return GetBuilder<HistoryController>(
      builder: (controller) {
        return MaterialApp(
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: Essential.getThemeMode(themeController.theme),
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: getBody(context),
            ),
          ),
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
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
                child: CustomAppBar('History'.tr, options: Row(
                  children: [
                    Image.asset(
                      "assets/common/notification.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        historyController.goto("/wallet");
                      },
                      child: Image.asset(
                        "assets/common/wallet.png",
                        height: 25,
                        color: MyColors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        historyController.goto("/language");
                      },
                      child: Image.asset(
                        "assets/common/lang.png",
                        height: 25,
                        color: MyColors.black,
                      ),
                    )
                  ],
                ), arrow: false),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: CustomRefreshIndicator(
            onRefresh: historyController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: Column(
              children: [
                getTabs(),
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: getTabBody(context),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getTabDesign(0, "Wallet".tr),
          SizedBox(
            width: 8,
          ),
          getTabDesign(1, "Call".tr),
          SizedBox(
            width: 8,
          ),
          getTabDesign(2, "Chat".tr),
        ],
      ),
    );
  }


  Widget getTabDesign(int index, String title) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          historyController.changeMainTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: historyController.current==index ?
          BoxDecoration(
              color: MyColors.colorLightPrimary,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: MyColors.colorButton
              )
          )
              : BoxDecoration(
              color: MyColors.cardColor(),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: MyColors.borderColor()
              )
          ),
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 16.0,
              letterSpacing: 0,
              color: historyController.current==index ? MyColors.colorButton : MyColors.labelColor(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getTabBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: historyController.current==0 ? getWalletView(context) : historyController.current==1 ?  getCallView(context) : getChatView(context),
    );
  }

  Widget getWalletView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getMyAmountDesign(),
        SizedBox(
          height: 28,
        ),
        Divider(
          color: MyColors.colorDivider,
          height: 0,
        ),
        TabBar(
          controller: historyController.tabController,
          tabs: [
            Tab(text: "Wallet Transactions".tr),
            Tab(text: "Payment Logs".tr),
          ],
          labelColor: MyColors.labelColor(),
          labelStyle: GoogleFonts.manrope(
            fontSize: 14.0,
            color: MyColors.labelColor(),
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
          indicatorColor: MyColors.colorButton,
          onTap: (index) {
            historyController.changeTab(index);
          },
        ),
        Flexible(
          flex: 1,
          child: getWalletBody(context)
        )
      ],
    );
  }

  Widget getCallView(BuildContext context) {
    return historyController.call.isNotEmpty
        ? ListView.separated(
      // itemCount: 1,
        itemCount: historyController.call.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (buildContext, index) {
          return getCallDesign(index, context);
        }
    )
        : getNoDataWidget("You've not taken any call consultations yet!".tr);
  }

  Widget getChatView(BuildContext context) {
    return historyController.chat.isNotEmpty
        ? ListView.separated(
        // itemCount: 1,
        itemCount: historyController.chat.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (buildContext, index) {
          return getChatDesign(index, context);
        }
    )
        : getNoDataWidget("You've not taken any chat consultations yet!".tr);
  }

  Widget getMyAmountDesign() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: MyColors.colorWalletBG,
                child: Image.asset(
                  "assets/common/my_wallet.png",
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Available Balance".tr,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20.0,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${CommonConstants.rupee} ${historyController.amount%1==0 ? historyController.amount.toInt().toString() : historyController.amount.toStringAsFixed(2)}",
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.colorGrey,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  historyController.goto("/wallet");
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric( vertical: 8),
                  decoration: BoxDecoration(
                      color: MyColors.colorLightPrimary,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: MyColors.colorButton
                      )
                  ),
                  child: Text(
                    "Recharge".tr,
                    style: GoogleFonts.manrope(
                      fontSize: 12.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getWalletBody(BuildContext context) {
    return historyController.tabController.index==0 ? getWalletTransactions(context) : getPaymentLogs(context);
  }

  Widget getWalletTransactions(BuildContext context) {
    return historyController.wallet.isNotEmpty
    ? ListView.separated(
      itemCount: historyController.wallet.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      separatorBuilder: (buildContext, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemBuilder: (buildContext, index) {
        return getWTDesign(index, context);
      }
    )
    : getNoDataWidget("You've not done any money transaction yet!".tr);
  }

  Widget getPaymentLogs(BuildContext context) {
    return historyController.payment.isNotEmpty ?
    ListView.separated(
        itemCount: historyController.payment.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (buildContext, index) {
          return getPLDesign(index, context);
        }
    )
    : getNoDataWidget("You've not recharged yet!".tr);
  }

  Widget getWTDesign(int index, BuildContext context) {
    WalletHistoryModel walletHistory = historyController.wallet[index];
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: MyColors.colorBorder
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  walletHistory.description,
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.black,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "${walletHistory.t_type=="CREDIT" ? '+' : '-'}INR ${walletHistory.wallet_amount}",
                style: GoogleFonts.manrope(
                  fontSize: 14.0,
                  color: walletHistory.t_type=="CREDIT" ? MyColors.colorSuccess : MyColors.colorError,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getIconInfo("assets/sign_up/calendar.png", Essential.getDate(walletHistory.created_at)),
              SizedBox(
                width: 10,
              ),
              getIconInfo("assets/sign_up/time.png", Essential.getTime(walletHistory.created_at)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "ORD: ",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.colorGrey,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: "#${walletHistory.order_id}",
                      style: GoogleFonts.manrope(
                        fontSize: 14.0,
                        color: MyColors.colorButton,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: "#${walletHistory.order_id}"));
                  Essential.showSnackBar("Copied to clipboard", time: 1);
                },
                child: getIconInfo("assets/common/copy.png", "Copy".tr, color: MyColors.colorGrey)
              ),
            ],
          ),
          if(walletHistory.invoice_id!=null)
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "INV: ",
                          style: GoogleFonts.manrope(
                            fontSize: 14.0,
                            color: MyColors.colorGrey,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "#${walletHistory.invoice_id}",
                              style: GoogleFonts.manrope(
                                fontSize: 14.0,
                                color: MyColors.colorButton,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(text: "#${walletHistory.invoice_id}"));
                          Essential.showSnackBar("Copied to clipboard", time: 1);
                        },
                        child: getIconInfo("assets/common/copy.png", "Copy".tr, color: MyColors.colorGrey)
                    ),
                  ],
                ),
                if(walletHistory.transaction_id!=null)
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                  text: "TID: ",
                                  style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    color: MyColors.colorGrey,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "#${walletHistory.transaction_id}",
                                      style: GoogleFonts.manrope(
                                        fontSize: 14.0,
                                        color: MyColors.colorButton,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(text: "#${walletHistory.order_id}"));
                                Essential.showSnackBar("Copied to clipboard", time: 1);
                              },
                              child: getIconInfo("assets/common/copy.png", "Copy".tr, color: MyColors.colorGrey)
                          ),
                        ],
                      ),
                    ],
                  ),
                GestureDetector(
                  onTap: () {
                    historyController.goto("/invoice", arguments: walletHistory);
                  },
                  child: standardButton(
                    context: context,
                    height: 40,
                    backgroundColor: MyColors.colorButton,
                    margin: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Download Invoice'.tr,
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.white,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget getPLDesign(int index, BuildContext context) {
    WalletHistoryModel transaction = historyController.payment[index];
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: MyColors.colorBorder
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "Recharge".tr,
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "INR ${transaction.amount.toDouble()}",
                style: GoogleFonts.manrope(
                  fontSize: 14.0,
                  color: index%3==0 ? MyColors.colorSuccess : MyColors.colorError,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getIconInfo("assets/sign_up/calendar.png", Essential.getDate(DateTime.now().toString())),
              SizedBox(
                width: 10,
              ),
              getIconInfo("assets/sign_up/time.png", Essential.getTime(DateTime.now().toString())),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "#${transaction.transaction_id}",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.colorGrey,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: "#${transaction.transaction_id}"));
                  Essential.showSnackBar("Copied to clipboard", time: 1);
                },
                child: getIconInfo("assets/common/copy.png", "Copy".tr, color: MyColors.colorGrey)
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
            },
            child: standardButton(
              context: context,
              height: 40,
              backgroundColor: index%3==0 ? MyColors.colorSuccess : MyColors.colorError,
              margin: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/common/${index%3==0 ? 'success' : 'error'}.png",
                    height: 18,
                    width: 18,
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    index%3==0 ? "Success" : "Failed",
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.white,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget getTitleInfo(String title, String info, {Color? color, bool flex = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title+" : ",
          style: GoogleFonts.manrope(
            fontSize: 14.0,
            letterSpacing: 0,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: color??null,
              letterSpacing: 0,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }


  Widget getIconInfo(String icon, String info, {Color? color, bool flex = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          height: 15,
          width: 15,
          color: color??MyColors.colorButton,
        ),
        SizedBox(
          width: 3,
        ),
        flex ?
        Flexible(
          child: Text(
            info,
            style: GoogleFonts.manrope(
              fontSize: 12.0,
              color: MyColors.colorGrey,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
            : Text(
          info,
          style: GoogleFonts.manrope(
            fontSize: 12.0,
            color: MyColors.colorGrey,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  getNoDataWidget(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/common/no_data.png",
            height: 240,
            width: 240,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Uh-Oh!".tr,
            style: GoogleFonts.manrope(
              fontSize: 22.0,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: MyColors.colorGrey,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget getChatDesign(int index, BuildContext context) {
    SessionHistoryModel sessionHistory = historyController.chat[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: MyColors.colorBorder
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              Essential.getDateTime(historyController.getDTByStatus(sessionHistory)),
              style: GoogleFonts.manrope(
                fontSize: 10.0,
                color: MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  sessionHistory.astrologer??"",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if(sessionHistory.status=="COMPLETED")
                Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "-INR ${sessionHistory.type=="FREE" ? '0.00' : sessionHistory.amount}",
                    style: GoogleFonts.manrope(
                      fontSize: 14.0,
                      color: MyColors.colorError,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            sessionHistory.status,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: Essential.getStatusColor(sessionHistory.status),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          getTitleInfo("Session Type".tr, sessionHistory.type, color: Essential.getSessionTypeColor(sessionHistory.type), flex: true),
          SizedBox(
            height: 5,
          ),
          getTitleInfo("Rate".tr, "${CommonConstants.rupee}${sessionHistory.type=="FREE"  ? 0 : sessionHistory.rate}/${'min'.tr}", flex: true),
          SizedBox(
            height: 5,
          ),
          if((sessionHistory.reason??"").isNotEmpty)
            Column(
              children: [
                getIconInfo("assets/common/info.png", sessionHistory.reason??"", color: Essential.getStatusColor(sessionHistory.status), flex: true),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getIconInfo("assets/sign_up/calendar.png", Essential.getDate(historyController.getDTByStatus(sessionHistory)), color: Essential.getStatusColor(sessionHistory.status)),
              // getIconInfo("assets/sign_up/calendar.png", DateFormat("dd MMM, yy").format(DateTime.parse(historyController.getDate(sessionHistory)))),
              SizedBox(
                width: 10,
              ),
              getIconInfo("assets/sign_up/time.png", Essential.getTime(historyController.getDTByStatus(sessionHistory)), color: Essential.getStatusColor(sessionHistory.status)),
            ],
          ),
          if(sessionHistory.status=='ACTIVE' || sessionHistory.status=='COMPLETED')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(sessionHistory.status=='COMPLETED')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Essential.getChatDuration(null, sessionHistory.started_at??"", sessionHistory.ended_at??""),
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                GestureDetector(
                  onTap: () {
                    historyController.goto("/chat", arguments: {"type" : sessionHistory.status, "action" : sessionHistory.status=="ACTIVE" ? sessionHistory.status : "VIEW", "astro_id" : sessionHistory.astro_id, "session_history" : sessionHistory});
                  },
                  child: standardButton(
                    context: context,
                    height: 40,
                    backgroundColor: MyColors.colorButton,
                    margin: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHOW CHAT'.tr,
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.white,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget getCallDesign(int index, BuildContext context) {
    SessionHistoryModel sessionHistory = historyController.call[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: MyColors.colorBorder
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              (historyController.getDTByStatus(sessionHistory)??"").isNotEmpty ? Essential.getDateTime(historyController.getDTByStatus(sessionHistory)) : "",
              style: GoogleFonts.manrope(
                fontSize: 10.0,
                color: MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  sessionHistory.astrologer??"",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if(sessionHistory.status=="COMPLETED")
                Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "-INR ${sessionHistory.type=="FREE" ? '0.00' : sessionHistory.amount}",
                    style: GoogleFonts.manrope(
                      fontSize: 14.0,
                      color: MyColors.colorError,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            sessionHistory.status,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: Essential.getStatusColor(sessionHistory.status),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          getTitleInfo("Session Type".tr, sessionHistory.type, color: Essential.getSessionTypeColor(sessionHistory.type), flex: true),
          SizedBox(
            height: 5,
          ),
          getTitleInfo("Rate".tr, "${CommonConstants.rupee}${sessionHistory.type=="FREE"  ? 0 : sessionHistory.rate}/${'min'.tr}", flex: true),
          SizedBox(
            height: 5,
          ),
          if((sessionHistory.reason??"").isNotEmpty)
            Column(
              children: [
                getIconInfo("assets/common/info.png", sessionHistory.reason??"", color: Essential.getStatusColor(sessionHistory.status), flex: true),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getIconInfo("assets/sign_up/calendar.png", Essential.getDate(historyController.getDTByStatus(sessionHistory)), color: Essential.getStatusColor(sessionHistory.status)),
              // getIconInfo("assets/sign_up/calendar.png", DateFormat("dd MMM, yy").format(DateTime.parse(historyController.getDate(sessionHistory)))),
              SizedBox(
                width: 10,
              ),
              getIconInfo("assets/sign_up/time.png", Essential.getTime(historyController.getDTByStatus(sessionHistory)), color: Essential.getStatusColor(sessionHistory.status)),
            ],
          ),
          if(sessionHistory.status=='ACTIVE' || sessionHistory.status=='COMPLETED')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(sessionHistory.status=='COMPLETED')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Essential.getChatDuration(null, sessionHistory.started_at??"", sessionHistory.ended_at??""),
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                GestureDetector(
                  onTap: () {
                    // if (sessionHistory.status == 'ACTIVE') {
                      historyController.goto("/call", arguments: {
                        "type": sessionHistory.status,
                        "action": sessionHistory.status == "ACTIVE"
                            ? sessionHistory.status
                            : "VIEW",
                        "astro_id": sessionHistory.astro_id,
                        "session_history": sessionHistory,
                        'astrologer': AstrologerModel(
                            id: sessionHistory.astro_id ?? -1,
                            name: sessionHistory.astrologer ?? "",
                            profile: sessionHistory.astro_profile ?? "",
                            mobile: '',
                            email: '',
                            experience: 0,
                            about: '')
                      });
                    // }
                  },
                  child: standardButton(
                    context: context,
                    height: 40,
                    backgroundColor: MyColors.colorButton,
                    margin: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sessionHistory.status=='ACTIVE' ? 'RESUME CALL'.tr : 'SHOW DETAILS'.tr,
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.white,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

}
