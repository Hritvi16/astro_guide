import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/home/HomeController.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget BottomNavigation({required Color backgroundColor, required int current,  required int size, required List<BottomNavItem> items, required HomeController controller}) {
  return PhysicalModel(
    elevation: 4,
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(standardBottomBarRadius),
        topRight: Radius.circular(standardBottomBarRadius)
    ),
    color: MyColors.white,
    child: Container(
      height: standardBottomBarHeight,
      width: standardBottomBarWidth,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardBottomBarRadius),
            topRight: Radius.circular(standardBottomBarRadius)
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     // offset: Offset(0, 3),
          //   ),
          // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getItemsList(current, items, controller),
      ),
    ),
  );
}

getItemsList(int current, List<BottomNavItem> items, HomeController controller) {
  List<Widget> bottomItems = [];
  int index = 0;

  for(int i=0; i<items.length; i++) {
    bottomItems.add(bottomItem(current, i, items[i].icon, controller));
    if(i!=items.length-1) {
      bottomItems.add(SizedBox(width: 22,));
    }
  }
  return bottomItems;
}

Widget bottomItem(int current, int index, String icon, HomeController controller) {
  print("icon");
  print(icon);
  print(icon.contains("chat"));
  return Flexible(
    flex: 1,
    fit: FlexFit.tight,
    child: GestureDetector(
      onTap: () {
        controller.changeTab(index);
      },
      child: Container(
        height: standardBottomItemHeight,
        decoration: BoxDecoration(
          color: current==index ? MyColors.white : MyColors.colorPrimary,
          borderRadius: current==index ? BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)) : null

          // color: MyColors.white ,
          // borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(22, 28, 22, 20),
          child: Image.asset(
            "${current==index ? "${icon}_filled" : icon}.png",
            color: current==index && (icon.contains("call") || icon.contains("settings")) ? MyColors.colorButton : null,
            width: 100,
          ),
        ),
      ),
    ),
  );
}

class BottomNavItem {
  final String icon;

  const BottomNavItem({
    required this.icon,
  });
}

