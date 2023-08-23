import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/MySize.dart';


class ConfirmImageDialog extends StatelessWidget {
  final String text, btn1, btn2;
  final XFile file;
  TextEditingController name = TextEditingController();
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ConfirmImageDialog({Key? key, required this.text, required this.btn1, required this.btn2, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 10, top: 15),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.file(
                  File(
                  file?.path??""
                  ),
                  height: MySize.sizeh60(context),
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(text,
                  style: TextStyle(
                      fontSize: 16,
                    color: MyColors.black
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
                          if(formKey.currentState!.validate()) {
                            Navigator.pop(context, btn2);
                          }
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
        ),
      ),
    );
  }
}
