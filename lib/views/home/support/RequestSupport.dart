import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/support/RequestSupportController.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class RequestSupport extends StatelessWidget {

  RequestSupport({ Key? key }) {
    requestSupportController.onInit();
  }

  final RequestSupportController requestSupportController = Get.put<RequestSupportController>(RequestSupportController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<RequestSupportController>(
      builder: (controller) {
        return getBody(context);
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      height: MySize.sizeh60(context),
      color: MyColors.cardColor(),
      child: Column(
        children: [
          SizedBox(
            width: MySize.size100(context),
            height: standardBSUpperFixedDesignHeight,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: standardBSUpperFixedDesignHeight,
                decoration: BoxDecoration(
                    color: MyColors.colorPrimary,
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/essential/upper_bg.png"
                        )
                    )
                ),
                child: SafeArea(
                  child: CustomAppBar('Request Support'),
                ),
              ),
            ),
          ),
          Flexible(
            child: getForm(),
          ),
          getActions(),
        ],
      ),
    );
  }
  
  Widget getForm() {
    return SingleChildScrollView(
      child: Form(
        key: requestSupportController.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              standardTFLabel(text: 'Reason', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: DropdownSearch<String>(
                    itemAsString: (String reason) => reason,
                    items: requestSupportController.reasons,
                    selectedItem: requestSupportController.reason,
                    dropdownDecoratorProps:  DropDownDecoratorProps(
                        baseStyle: GoogleFonts.manrope(
                          fontSize: 16.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.colorButton,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: "Select Reason",
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        )
                    ),
                    validator: (value) {
                      if (value==null) {
                        return "* Required";
                      }  else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      requestSupportController.changeReason(value);
                    },
                  )
              ),
              standardTFLabel(text: 'Message', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.newline,
                  controller: requestSupportController.message,
                  maxLines: 6,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.colorButton,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Write your query",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if ((value??"").isEmpty) {
                      return "* Required";
                    }  else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getActions() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MyColors.colorBorder
          )
        )
      ),
      child: GestureDetector(
        onTap: () {
          requestSupportController.request();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
              color: MyColors.colorPrimary,
              border: Border(
                  right: BorderSide(
                      color: MyColors.colorPrimary,
                      width: 0.5
                  )
              )
          ),
          child: Text(
              "Request Support",
              style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyColors.black
              )
          ),
        ),
      ),
    );
  }

}
