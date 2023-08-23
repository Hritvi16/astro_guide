import 'dart:async';

import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  int seconds = 1;
  late Timer timer;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    startTimer();
  }

  void startTimer() {
    timer = new Timer.periodic(
      Duration(seconds: 2),
          (Timer timer) => setState(
            () {
              print(seconds);
          seconds = seconds + 1;
        },
      ),
    );
  }

  String getIcon() {
    print(seconds);
    if(seconds%5==1) {
      return "om.png";
    }
    else if(seconds%5==2) {
      return "hand.png";
    }
    else if(seconds%5==3) {
      return "swastik.png";
    }
    else if(seconds%5==4) {
      return "trishul.png";
    }
    else  {
      return "star.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      width: MySize.size100(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: MyColors.colorOrange.withOpacity(0.1),
            radius: 30,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
              child: Image.asset(
                "assets/signs/"+getIcon(),
                height: 40,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    timer.cancel();
    super.dispose();
  }
}
