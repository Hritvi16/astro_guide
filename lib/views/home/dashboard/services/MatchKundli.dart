import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/service/MatchKundliController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootMilanModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class MatchKundli extends StatelessWidget {
  MatchKundli({ Key? key }) : super(key: key);

  final MatchKundliController matchKundliController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<MatchKundliController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: matchKundliController.load ? matchKundliController.matched==false ? getConfirmDesign(context) : null : null,
          body: matchKundliController.load ? getBody(context) :
          LoadingScreen()
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Container(
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
                child: CustomAppBar('Match Kundli', options: matchKundliController.matched==false ? GestureDetector(
                  onTap: () {
                    matchKundliController.goto("/kundli");
                  },
                  child: Image.asset(
                    "assets/common/add.png",
                    height: 25,
                  ),
                ) : null
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: matchKundliController.matched ? getResults(context) : getKundli(context),
            ),
          ),
        )
      ],
    );
  }

  Widget getKundli(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: matchKundliController.tabController,
            tabs: [
              Tab(text: "MALE".tr),
              Tab(text: "FEMALE".tr),
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
              matchKundliController.changeTab(index);
            },
          ),
        ListView.separated(
            itemCount: matchKundliController.showKundlis.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            separatorBuilder: (buildContext, index) {
              return SizedBox(height: 15,);
            },
            itemBuilder: (buildContext, index) {
              return getKundliDesign(matchKundliController.showKundlis[index]);
            }
        )
      ],
    );
  }

  Widget getKundliDesign(KundliModel kundli) {
    return GestureDetector(
      onTap: () {
        matchKundliController.selectKundli(kundli);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: matchKundliController.male==kundli || matchKundliController.female==kundli ? MyColors.colorLightPrimary : MyColors.white,
          border: Border.all(
            color: matchKundliController.male==kundli || matchKundliController.female==kundli ? MyColors.colorPrimary : MyColors.borderColor()
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
              "${Essential.getRawDate(kundli.dob)}, ${Essential.getRawTime(kundli.dob)}",
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


  Widget getResults(BuildContext context) {
    List<String> keys = matchKundliController.ashtakoot.ashtakoot_milan.keys.toList();
    return Column(
      children: [
        Container(
          height: 200,
          width: MySize.size100(context),
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: matchKundliController.ashtakoot.ashtakoot_milan_result.max_ponits,
                radiusFactor: 1,
                showLabels: false,
                showTicks: false,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: matchKundliController.getSingleBlock(),
                    color: Colors.red.shade900,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock(),
                    endValue: matchKundliController.getSingleBlock() * 2,
                    color: Colors.red,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock() * 2,
                    endValue: matchKundliController.getSingleBlock() * 3,
                    color: Colors.yellow.shade900,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock() * 3,
                    endValue: matchKundliController.getSingleBlock() * 4,
                    color: Colors.yellow.shade700,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock() * 4,
                    endValue: matchKundliController.getSingleBlock() * 5,
                    color: Colors.yellow.shade600,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock() * 5,
                    endValue: matchKundliController.getSingleBlock() * 6,
                    color: Colors.yellow,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock() * 6,
                    endValue: matchKundliController.getSingleBlock() * 7,
                    color: Colors.lightGreen,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                  GaugeRange(
                    startValue: matchKundliController.getSingleBlock() * 7,
                    endValue: matchKundliController.getSingleBlock() * 8,
                    color: Colors.green,
                    startWidth: 40,
                    endWidth: 40,
                  ),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: matchKundliController.ashtakoot.ashtakoot_milan_result.points_obtained,
                    enableAnimation: true,
                    needleLength: 0.8,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding,),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: matchKundliController.ashtakoot.ashtakoot_milan_result.points_obtained.toString(),
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      color: MyColors.black,
                      fontSize: 22,
                    ),
                    children: [
                      TextSpan(
                        text: " / ",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 35
                        ),
                      ),
                      TextSpan(
                        text: "${matchKundliController.ashtakoot.ashtakoot_milan_result.max_ponits.toString()}",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 21
                        ),
                      )
                    ]
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemCount: keys.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 0),
                separatorBuilder: (buildContext, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (buildContext, index) {
                  return getAshtakootDetails(keys[index], context);
                },
              )
            ],
          ),
        ),
      ],
    );
  }


  Widget? getConfirmDesign(BuildContext context) {
    return PhysicalModel(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(standardBottomBarRadius),
          topRight: Radius.circular(standardBottomBarRadius)
      ),
      shadowColor: MyColors.labelColor(),
      color: MyColors.white,
      child: Container(
        height: 70,
        // height: standardBottomBarHeight,
        width: standardBottomBarWidth,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(standardBottomBarRadius),
              topRight: Radius.circular(standardBottomBarRadius)
          ),
        ),
        child: GestureDetector(
          onTap: () {
            matchKundliController.validate();
          },
          child: standardButton(
            context: context,
            backgroundColor: MyColors.colorButton,
            child: Center(
              child: Text(
                'MATCH',
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  color: MyColors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getAshtakootDetails(String key, BuildContext context) {
    AshtakootMilanModel ashtakootMilan = matchKundliController.ashtakoot.ashtakoot_milan[key]!;
    Color color = MyColors.ashtakootColor(key);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(
            color: color
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 7,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "${ashtakootMilan.area_of_life}",
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: " (${key.replaceAll("_", " ").toTitleCase()})",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ]
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  CommonConstants.ashtakootDetails[key]!,
                  style: GoogleFonts.manrope(
                    fontSize: 12.0,
                    color: MyColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: SizedBox(
              height: MySize.size30(context),
              child: Stack(
                children: [
                  SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: ashtakootMilan.max_ponits,
                        isInversed: true,
                        showLabels: false,
                        showTicks: false,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: ashtakootMilan.max_ponits,
                            color: color.withOpacity(0.3),
                          ),
                        ],
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: ashtakootMilan.points_obtained,
                            color: color,
                            enableAnimation: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "${matchKundliController.getProperNumber(ashtakootMilan.points_obtained)}/${matchKundliController.getProperNumber(ashtakootMilan.max_ponits)}",
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: color
                      ),

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget getTypeBox(String value, String label) {
  //   return Row(
  //     children: [
  //       Radio(
  //         value: value,
  //         groupValue: matchKundliController.type,
  //         activeColor: MyColors.colorButton,
  //         onChanged: (val) {
  //           matchKundliController.changeType(value);
  //         },
  //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //       ),
  //       Text(
  //         label,
  //         style: GoogleFonts.manrope(
  //           fontSize: 16.0,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  getActionButton(KundliModel kundli, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        if(title=="Edit") {
          matchKundliController.goto("/kundli", arguments: kundli);
        }
        else {
          matchKundliController.confirmDelete(kundli);
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
