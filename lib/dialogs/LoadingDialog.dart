import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:astro_guide/colors/MyColors.dart';


class LoadingDialog extends StatelessWidget {
  final String text, btn1, btn2;
  const LoadingDialog({Key? key, required this.text, required this.btn1, required this.btn2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: MyColors.cardColor(),
      child: Container(
        alignment: Alignment.center,
        child: LoadingScreen()
      ),
    );
  }
}
