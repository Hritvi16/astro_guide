import 'package:flutter/material.dart';
import 'package:astro_guide/colors/MyColors.dart';


class BasicDialog extends StatelessWidget {
  final String text, btn1, btn2;
  const BasicDialog({Key? key, required this.text, required this.btn1, required this.btn2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: MyColors.cardColor(),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 10, top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(text,
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new TextButton(
                    onPressed: () {
                      Navigator.pop(context, btn1);
                    },
                    child: Text(btn1,
                      style: TextStyle(
                          color: MyColors.colorPrimary
                      ),
                    )
                ),
                new TextButton(
                    onPressed: () {
                      Navigator.pop(context, btn2);
                    },
                    child: Text(btn2,
                      style: TextStyle(
                          color: MyColors.colorPrimary
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
