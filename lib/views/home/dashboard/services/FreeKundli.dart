import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/service/FreeKundliController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimMahaDashaDateModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimMahaDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YogAntarDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YogMahaDashaModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class FreeKundli extends StatelessWidget {
  FreeKundli({ Key? key }) : super(key: key);

  final FreeKundliController freeKundliController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<FreeKundliController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          body: getBody(context),
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
                  image: Essential.getPlatform() ?
                  const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  ) : null
              ),
              child: SafeArea(
                  child: CustomAppBar("Free Kundli".tr, options: freeKundliController.kundli==null ? GestureDetector(
                    onTap: () {
                      freeKundliController.goto("/kundli");
                    },
                    child: Image.asset(
                      "assets/common/add.png",
                      height: 25,
                    ),
                  ) : GestureDetector(
                    onTap: () {
                      if(freeKundliController.load==true) {
                        freeKundliController.load = false;
                        freeKundliController.update();
                        freeKundliController.getKundli();
                      }
                    },
                    child: Image.asset(
                      "assets/common/refresh.png",
                      height: 25,
                    ),
                  ))
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: freeKundliController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  Essential.getPlatform() ? "assets/essential/loading.png" : "assets/app_icon/ios_icon.jpg",
                  height: 30,
                );
              },
            ),
            child: freeKundliController.kundli==null ? getKundlis() :  getKundliDetails(context),
            ),
        ),
      ],
    );
  }
  
  Widget getKundlis() {
    return ListView.separated(
        itemCount: freeKundliController.kundlis.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        separatorBuilder: (buildContext, index) {
          return SizedBox(height: 15,);
        },
        itemBuilder: (buildContext, index) {
          return getKundliDesign(freeKundliController.kundlis[index]);
        }
    );
  }

  Widget getKundliDesign(KundliModel kundli) {
    return GestureDetector(
      onTap: () {
        freeKundliController.selectKundli(kundli);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: freeKundliController.kundli==kundli ? MyColors.colorLightPrimary : MyColors.white,
          border: Border.all(
              color: freeKundliController.kundli==kundli ? MyColors.colorPrimary : MyColors.borderColor()
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                getActionButton(kundli, "Edit", Icons.edit, MyColors.colorButton),
                SizedBox(
                  width: 10,
                ),
                getActionButton(kundli, "Delete", Icons.delete, MyColors.colorError),

              ],
            ),
            RichText(
              text: TextSpan(
                text: kundli.name,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: MyColors.black
                ),
                children: [
                  TextSpan(
                    text: " (${kundli.relation??"SELF"})",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )
                ]
              ),
            ),
            Text(
              kundli.gender,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: MyColors.genderColor(kundli.gender),
              ),
            ),
            Text(
              "${Essential.getDate(kundli.dob)}, ${Essential.getTime(kundli.dob)}",
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ("${kundli.city}, ${kundli.state??""}, ${kundli.country??""}").toTitleCase(),
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget getKundliDetails(BuildContext context) {
    return Column(
      children: [
        getTabs(),
        Flexible(
          flex: 1,
          // child: freeKundliController.detailLoad[freeKundliController.selected] ? SingleChildScrollView(
          child: freeKundliController.load ? SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: getTabBody(context),
          ) : LoadingScreen(),
        )
      ],
    );
  }

  Widget getTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getTabDesign(0, CommonConstants.kundli[0].tr),
          const SizedBox(
            width: 8,
          ),
          getTabDesign(1, CommonConstants.kundli[1].tr),
          const SizedBox(
            width: 8,
          ),
          getTabDesign(2, CommonConstants.kundli[2].tr),
          const SizedBox(
            width: 8,
          ),
          getTabDesign(3, CommonConstants.kundli[3].tr),
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
          freeKundliController.changeTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: freeKundliController.selected==index ?
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
              fontSize: 14.0,
              letterSpacing: 0,
              color: freeKundliController.selected==index ? MyColors.colorButton : MyColors.labelColor(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getTabBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      // child: getBasicDetails(),
      // child: getKPDetails(),
      child: freeKundliController.selected==0 ? getBasicDetails() : freeKundliController.selected==1 ? getChartDetails() : freeKundliController.selected==2 ? getKPDetails() : getDashaDetails(),
    );
  }

  Widget getBasicDetails() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          getBasic(),
          const SizedBox(height: 15),
          getPanchang(),
          const SizedBox(height: 15),
          getAvakhada(),
        ],
      ),
    );
  }

  Widget getCard(String title, String info) {
    Color color = MyColors.horoscopeColor(title);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(
          color: color
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toTitleCase(),
            style: GoogleFonts.manrope(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 14
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            info,
            style: GoogleFonts.manrope(
              color: MyColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }

  Widget getBasic() {
    DateTime dob = DateTime.parse("${freeKundliController.basic.date} ${freeKundliController.basic.hour}:${freeKundliController.basic.minute}:00");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Basic Details",
          style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.colorBorder
            ),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Column(
            children: [
              getTitleInfo("Name", freeKundliController.basic.full_name, MyColors.colorLightPrimary, border: "t"),
              getTitleInfo("Date", DateFormat("dd MMMM yyyy").format(dob), MyColors.white),
              getTitleInfo("Time", DateFormat("hh:mm a").format(dob), MyColors.colorLightPrimary),
              getTitleInfo("Place", freeKundliController.basic.place, MyColors.white),
              getTitleInfo("Latitude", freeKundliController.basic.latitude, MyColors.colorLightPrimary),
              getTitleInfo("Longitude", freeKundliController.basic.longitude, MyColors.white),
              getTitleInfo("Timezone", freeKundliController.basic.timezone, MyColors.colorLightPrimary),
              getTitleInfo("Sunrise", freeKundliController.basic.sunrise, MyColors.white),
              getTitleInfo("Sunset", freeKundliController.basic.sunset, MyColors.colorLightPrimary, border: "b"),
            ],
          ),
        ),
      ],
    );
  }

  Widget getPanchang() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Panchang Details",
        style: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.w500
        ),
      ),
      const SizedBox(height: 15),
      Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.colorBorder
            ),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Column(
            children: [
              getTitleInfo("Tithi", freeKundliController.basic.tithi, MyColors.colorLightPrimary, border: "t"),
              getTitleInfo("Nakshtra", freeKundliController.basic.nakshatra, MyColors.white),
              getTitleInfo("Sunrise", DateFormat("hh:mm:ss a").format(DateTime.parse(freeKundliController.basic.sunrise)), MyColors.colorLightPrimary),
              getTitleInfo("Sunset", DateFormat("hh:mm:ss a").format(DateTime.parse(freeKundliController.basic.sunset)), MyColors.white, border: "b"),
            ],
          ),
        ),
    ],
  );
  }

  Widget getAvakhada() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Avakhada Details",
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 15),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.colorBorder
              ),
              borderRadius: BorderRadius.circular(14)
            ),
            child: Column(
              children: [
                getTitleInfo("Varna", freeKundliController.basic.varna, MyColors.colorLightPrimary, border: "t"),
                getTitleInfo("Vashya", freeKundliController.basic.vashya, MyColors.white),
                getTitleInfo("Yoni", freeKundliController.basic.yoni, MyColors.colorLightPrimary),
                getTitleInfo("Gan", freeKundliController.basic.gana, MyColors.white),
                getTitleInfo("Nadi", freeKundliController.basic.nadi, MyColors.colorLightPrimary),
                getTitleInfo("Sunsign", freeKundliController.basic.sunsign, MyColors.white),
                getTitleInfo("Moonsign", freeKundliController.basic.moonsign, MyColors.colorLightPrimary),
                getTitleInfo("Nakshatra-Charan", freeKundliController.basic.nakshatra, MyColors.white),
                getTitleInfo("Tithi", freeKundliController.basic.tithi, MyColors.colorLightPrimary),
                getTitleInfo("Tatva", freeKundliController.basic.tatva, MyColors.white),
                getTitleInfo("Name Alphabet", freeKundliController.basic.rashi_akshar, MyColors.colorLightPrimary),
                getTitleInfo("Paya", freeKundliController.basic.paya.type, MyColors.white, border: "b"),
              ],
            ),
          ),
      ],
    );
  }

  Widget getChartDetails() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: freeKundliController.tabController,
            tabs: [
              Tab(text: "Birth".tr),
              Tab(text: "Navamsa".tr),
              // Tab(text: "Transit".tr),
              Tab(text: "Divisional".tr),
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
              freeKundliController.changeChartTab(index);
            },
          ),
          const SizedBox(height: 10),
          if(freeKundliController.tabController.index==2)
            Column(
              children: [
                getDivisionalCharts(),
                const SizedBox(height: 10),
              ],
            ),
          getChart(freeKundliController.getChartSVG()),
          const SizedBox(height: 15),
          getPlanets(),
          // const SizedBox(height: 15),
          // getAvakhada(),
        ],
      ),
    );
  }

  Widget getChart(String svg) {
    print("freeKundliController.charts");
    print(freeKundliController.charts);
    print("svg");
    print(svg);
    // print(svg.replaceAll("\\", "").replaceAll("\n", ""));
    // print(svg.replaceAll("\\", ""));
    return freeKundliController.charts.isNotEmpty ?
    SvgPicture.string(svg)
    // SvgPicture.string(svg.replaceAll("\\", "").replaceAll("\n", ""))
        : Container();
  }

  Widget getKPDetails() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          getKPPlanets(),
          const SizedBox(height: 15),
          getPanchang(),
        ],
      ),
    );
  }

  Widget getPlanets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Planets",
          style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 5),
        getPlanetTabs(),
        const SizedBox(height: 15),
        Table(
          border: TableBorder.all(color: MyColors.colorBorder, borderRadius: BorderRadius.circular(14)),
          children: getPlanetList()
        ),
      ],
    );
  }

  Widget getKPPlanets() {
    return Table(
      border: TableBorder.all(color: MyColors.colorBorder, borderRadius: BorderRadius.circular(14)),
      children: getKPPlanetList()
    );
  }

  Widget getDashaDetails() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getDashaTabs(),
          const SizedBox(height: 15),
          getDashaTabBody(),
        ],
      ),
    );
  }

  Widget getTitleInfo(String title, String info, Color color, {String? border}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      decoration: BoxDecoration(
        color: color,
        borderRadius: border!=null ?
        border=="t" ?
        const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        )
        : const BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ) : null
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: getTitle(title),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: getInfo(info),
          )
        ],
      ),
    );
  }

  Widget getTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        color: MyColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600
      )
    );
  }

  Widget getInfo(String info) {
    return Text(
      info,
      style: GoogleFonts.manrope(
        color: MyColors.black,
        fontSize: 14,
      )
    );
  }

  Widget getTableTitle(String title, {double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical??5, horizontal: 5),
      child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
              color: MyColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600
          )
      ),
    );
  }

  Widget getTableInfo(String info, {String? next, VimMahaDashaModel? dasha, double? vertical}) {
    return GestureDetector(
      onTap: (next??"").trim().isNotEmpty ? () {
        freeKundliController.updateDashaLevel(dasha!);
      } : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: vertical??5, horizontal: 5),
        child: RichText(
          text: TextSpan(
            text: info,
            style: GoogleFonts.manrope(
              color: MyColors.black,
              fontSize: 12,
            ),
            children: (next??"").trim().isNotEmpty ?
            [
              TextSpan(
                text: next,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                )
              )
            ] : null
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<TableRow> getPlanetList() {
    List<TableRow> planets = [
      TableRow(
        decoration: BoxDecoration(
          color: MyColors.colorLightPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          )
        ),
          children: freeKundliController.selectedPlanet==0 ?
          [
            getTableTitle("Planet"),
            getTableTitle("Sign"),
            getTableTitle("Sign Lord"),
            getTableTitle("Degree"),
            getTableTitle("House"),
          ]
          : [
            getTableTitle("Planet"),
            getTableTitle("Nakshatra"),
            getTableTitle("Naksh Lord"),
            getTableTitle("House"),
          ]
      )
    ];

    for (var element in freeKundliController.planet) {
      planets.add(
        TableRow(
          children: freeKundliController.selectedPlanet==0 ?
          [
            getTableInfo(element.name),
            getTableInfo(element.sign),
            getTableInfo(element.rashi_lord),
            getTableInfo(element.full_degree),
            getTableInfo(element.house.toString()),
          ]
          : [
            getTableInfo(element.name),
            getTableInfo(element.nakshatra),
            getTableInfo(element.nakshatra_lord),
            getTableInfo(element.house.toString()),
          ]
        )
      );
    }

    return planets;
  }


  List<TableRow> getKPPlanetList() {
    List<TableRow> planets = [
      TableRow(
        decoration: BoxDecoration(
          color: MyColors.colorLightPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          )
        ),
          children: [
            getTableTitle("Planet"),
            getTableTitle("cusp"),
            getTableTitle("Sign"),
            getTableTitle("Sign Lord"),
            getTableTitle("Star Lord"),
            getTableTitle("Sub Lord"),
          ]
      )
    ];

    for (var element in freeKundliController.kpPlanet) {
      planets.add(
        TableRow(
          children: [
            getTableInfo(element.planet),
            getTableInfo(element.planet_in.toString()),
            getTableInfo(""),
            getTableInfo(element.nakshatra_lord.substring(0, 2)),
            getTableInfo(element.sub_sub_lord.substring(0, 2)),
            getTableInfo(element.sub_lord.substring(0, 2)),
          ]
        )
      );
    }

    return planets;
  }


  Widget getDashaTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getDashaTabDesign(0, CommonConstants.dasha[0].tr),
          const SizedBox(
            width: 8,
          ),
          getDashaTabDesign(1, CommonConstants.dasha[1].tr),
        ],
      ),
    );
  }

  Widget getPlanetTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getPlanetTabDesign(0, CommonConstants.planet[0].tr),
          const SizedBox(
            width: 8,
          ),
          getPlanetTabDesign(1, CommonConstants.planet[1].tr),
        ],
      ),
    );
  }

  Widget getPlanetTabDesign(int index, String title) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          freeKundliController.changePlanetTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: freeKundliController.selectedPlanet==index ?
          BoxDecoration(
              color: MyColors.colorLightPrimary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: MyColors.colorButton
              )
          )
              : BoxDecoration(
              color: MyColors.cardColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: MyColors.borderColor()
              )
          ),
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              letterSpacing: 0,
              color: freeKundliController.selectedPlanet==index ? MyColors.colorButton : MyColors.labelColor(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getDashaTabDesign(int index, String title) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          freeKundliController.changeDashaTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: freeKundliController.selectedDasha==index ?
          BoxDecoration(
              color: MyColors.colorLightPrimary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: MyColors.colorButton
              )
          )
              : BoxDecoration(
              color: MyColors.cardColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: MyColors.borderColor()
              )
          ),
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              letterSpacing: 0,
              color: freeKundliController.selectedDasha==index ? MyColors.colorButton : MyColors.labelColor(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getDashaTabBody() {
    return freeKundliController.selectedDasha==0 ? getVimshottariDetails() : getYoginiDetails();
  }

  Widget getVimshottariDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // getTitle("Mahadasha"),
        RichText(
          text: TextSpan(
            text: "MahaDasha",
            style: GoogleFonts.manrope(
              color: freeKundliController.dasha_level==0 ?MyColors.black : MyColors.colorInfoGrey,
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              freeKundliController.jumpDashaLevel(0);
            },
            children: freeKundliController.dasha_level>=1 ?
            [
              TextSpan(
                text: "> AntarDasha",
                style: GoogleFonts.manrope(
                    color: freeKundliController.dasha_level==1 ?MyColors.black : MyColors.colorInfoGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  freeKundliController.jumpDashaLevel(1);
                },
                children: freeKundliController.dasha_level==2 ?
                [
                  TextSpan(
                    text: "> PratyantarDasha",
                    style: GoogleFonts.manrope(
                        color: MyColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      freeKundliController.jumpDashaLevel(2);
                    },
                  )
                ] : null
              )
            ] : null
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Table(
            border: TableBorder.all(color: MyColors.colorBorder, borderRadius: BorderRadius.circular(14)),
            children: getVimMahadashaList()
        ),
      ],
    );
  }

  List<TableRow> getVimMahadashaList() {
    List<TableRow> dasha = [
      TableRow(
          decoration: BoxDecoration(
              color: MyColors.colorLightPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              )
          ),
          children: [
            getTableTitle("Planet", vertical: 15),
            getTableTitle("Start Date", vertical: 15),
            getTableTitle("End Date", vertical: 15),
          ]
      )
    ];

    Map<String, dynamic> mahadashaList = freeKundliController.getVimDasha();

    print(mahadashaList);
    for (var element in mahadashaList.keys) {
      VimMahaDashaDateModel mahadashaDateModel = mahadashaList[element];
      print("mahadashaDateModel.start_date");
      print(mahadashaDateModel.start_date);
      dasha.add(
          TableRow(
              children: [
                getTableInfo(element, vertical: 10),
                getTableInfo(Essential.getChartDateFormat(mahadashaDateModel.start_date??mahadashaDateModel.start_time??""), vertical: 10),
                getTableInfo(Essential.getChartDateFormat(mahadashaDateModel.end_date??mahadashaDateModel.end_time??""),
                    next: (freeKundliController.dasha_level<2 ? " >" : ""), dasha: mahadashaDateModel.antar_dasha??mahadashaDateModel.pratyantar_dasha, vertical: 10),
                // getTableInfo(DateFormat('dd MMM, yyyy').format(DateTime.parse(mahadashaDateModel.start_date??mahadashaDateModel.start_time??"")), vertical: 10),
                // getTableInfo(DateFormat('dd MMM, yyyy').format(DateTime.parse(mahadashaDateModel.end_date??mahadashaDateModel.end_time??"")),
                //     next: (freeKundliController.dasha_level<2 ? " >" : ""), dasha: mahadashaDateModel.antar_dasha??mahadashaDateModel.pratyantar_dasha, vertical: 10),
              ]
          )
      );
    }

    return dasha;
  }

  Widget getYoginiDetails() {
    // List<YogMahaDashaModel> maha_dasha = freeKundliController.yogini.maha_dasha;
    // return ListView.separated(
    //   itemCount: maha_dasha.length,
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   padding: EdgeInsets.zero,
    //   separatorBuilder: (buildContext, index) {
    //     return SizedBox(
    //       height: 15,
    //     );
    //   },
    //   itemBuilder: (buildContext, index) {
    //     return getYogDashas(maha_dasha[index]);
    //   },
    // );
    return getYogDashas(freeKundliController.yogini.maha_dasha);
  }

  Widget getYogDashas(List<YogMahaDashaModel> yogMahaDashas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // getTitle(yogMahaDasha.dasha),
        // SizedBox(
        //   height: 10,
        // ),
        Table(
            border: TableBorder.all(color: MyColors.colorBorder, borderRadius: BorderRadius.circular(14)),
            children: getYogAntarDashaList(yogMahaDashas)
        ),
      ],
    );
  }
  List<TableRow> getYogAntarDashaList(List<YogMahaDashaModel> yogMahaDashas) {
    List<TableRow> mahadasha = [
      TableRow(
          decoration: BoxDecoration(
              color: MyColors.colorLightPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              )
          ),
          children: [
            getTableTitle("Planet", vertical: 15),
            getTableTitle("Start Date", vertical: 15),
            getTableTitle("End Date", vertical: 15),
          ]
      )
    ];

    for (var element in yogMahaDashas) {
      mahadasha.add(
          TableRow(
              children: [
                getTableInfo(element.dasha, vertical: 10),
                getTableInfo(DateFormat('dd MMM, yyyy').format(DateTime.parse(element.start_date)), vertical: 10),
                getTableInfo(DateFormat('dd MMM, yyyy').format(DateTime.parse(element.end_date)), vertical: 10),
              ]
          )
      );
    }

    return mahadasha;
  }

  Widget getDivisionalCharts() {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        itemCount: CommonConstants.divCharts.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 0),
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            width: 15,
          );
        },
        itemBuilder: (buildContext, index) {
          return getDivChartTabDesign(index);
        },
      ),
    );
  }

  Widget getDivChartTabDesign(int index) {
    return GestureDetector(
      onTap: () {
        freeKundliController.changeDivChartTab(index);
      },
      child: Container(
        alignment: Alignment.center,
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: freeKundliController.selectedDiv==index ?
        BoxDecoration(
            color: MyColors.colorLightPrimary,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: MyColors.colorButton
            )
        )
            : BoxDecoration(
            color: MyColors.cardColor(),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: MyColors.borderColor()
            )
        ),
        child: Text(
          CommonConstants.divCharts[index],
          style: GoogleFonts.manrope(
            fontSize: 14.0,
            letterSpacing: 0,
            color: freeKundliController.selectedDiv==index ? MyColors.colorButton : MyColors.labelColor(),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  getActionButton(KundliModel kundli, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        if(title=="Edit") {
          freeKundliController.goto("/kundli", arguments: kundli);
        }
        else {
          freeKundliController.confirmDelete(kundli);
        }
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          )
        ],
      ),
    );
  }

}

