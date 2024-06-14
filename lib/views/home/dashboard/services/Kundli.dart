import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/KundliConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/controllers/service/KundliController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Kundli extends StatelessWidget {
  Kundli({ Key? key }) : super(key: key);

  final KundliController kundliController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<KundliController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: kundliController.load ? getConfirmDesign(context) : null,
          body: kundliController.load ? getBody(context) :
          LoadingScreen()
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
                child: CustomAppBar('${kundliController.kundli==null ? 'Add' : 'Update'} Kundli'),
              ),
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 16),
              child: Form(
                key: kundliController.formKey,
                child: Column(
                  children: [
                    standardTFLabel(text: 'Relation', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: DropdownSearch<RelationModel>(
                          popupProps:  const PopupProps.menu(
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: "Search Relation",
                                ),
                              )
                          ),
                          itemAsString: (RelationModel relation) => relation.name,
                          items: kundliController.relations,
                          selectedItem: kundliController.relation,
                          dropdownDecoratorProps:  DropDownDecoratorProps(
                              baseStyle: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.labelColor(),
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
                                  hintText: "Enter Relation",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  // prefixIcon: Padding(
                                  //     padding: const EdgeInsets.symmetric(vertical: 7),
                                  //     child: Image.asset(
                                  //       "assets/astrology/kundali.png",
                                  //       height: 20,
                                  //     )
                                  // )
                              )
                          ),
                          onChanged: (value) {
                            kundliController.changeRelation(value);
                          },
                          validator: (value) {
                            if (value==null) {
                              return "* Required";
                            }  else {
                              return null;
                            }
                          },
                        )
                    ),
                    standardTFLabel(text: 'Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.labelColor(),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: kundliController.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.colorButton,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Enter Name",
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Image.asset(
                              "assets/sign_up/profile.png",
                              height: 10,
                              color: MyColors.colorButton,
                            ),
                          ),
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
                    standardTFLabel(text: 'Gender', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              kundliController.changeGender(UserConstants.F);
                            },
                            child: Image.asset(
                                "assets/sign_up/${kundliController.gender==UserConstants.F ? "female_on" : "female_off"}.png",
                                height: 80,
                                width: 80
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              kundliController.changeGender(UserConstants.M);
                            },
                            child: Image.asset("assets/sign_up/${kundliController.gender==UserConstants.M ? "male_on" : "male_off"}.png",
                                height: 80,
                                width: 80
                            ),
                          )
                        ],
                      ),
                    ),
                    standardTFLabel(text: 'Date of Birth', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        onTap: () {
                          BottomPicker.date(
                            pickerTitle:  Text(
                              "Set your Date of Birth",
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.colorButton,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            initialDateTime: kundliController.date,
                            onSubmit: (value) {
                              kundliController.setDOB(value);
                            },
                            backgroundColor: MyColors.cardColor(),
                            closeIconColor: MyColors.iconColor(),
                            bottomPickerTheme:  BottomPickerTheme.plumPlate,
                            pickerTextStyle: GoogleFonts.manrope(
                              fontSize: 14.0,
                              color: MyColors.labelColor(),
                              letterSpacing: 0,
                            ),
                            buttonContent: Text(
                              "Done",
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            buttonSingleColor: Colors.transparent,
                            displaySubmitButton: true,
                          ).show(context);
                        },
                        controller: kundliController.dob,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.labelColor(),
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
                            hintText: "Enter Date of Birth",
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              child: Image.asset(
                                "assets/sign_up/calendar.png",
                                height: 10,
                                color: MyColors.colorButton,
                                // child: Image.asset(
                                //   "assets/sign_up/profile.png",
                                //   height: 15,
                                //   width: 10,
                                //   color: MyColors.colorButton,
                                // ),
                              ),
                            )
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
                    standardTFLabel(text: 'Time of Birth', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        onTap: () {
                          print("hhello");
                          BottomPicker.time(
                            pickerTitle:  Text(
                              "Set your Time of Birth",
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.colorButton,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            initialTime: Time(hours: kundliController.date.hour, minutes: kundliController.date.minute),
                            onChange: (value) {
                              print("valueeeee");
                              print(value);
                              kundliController.setTOB(value);
                            },
                            onSubmit: (value) {
                              print("closee");
                              kundliController.setTOB(value);
                            },
                            backgroundColor: MyColors.cardColor(),
                            closeIconColor: MyColors.iconColor(),
                            bottomPickerTheme:  BottomPickerTheme.plumPlate,
                            pickerTextStyle: GoogleFonts.manrope(
                              fontSize: 14.0,
                              color: MyColors.labelColor(),
                              letterSpacing: 0,
                            ),
                            buttonContent: Text(
                              "Done",
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            buttonSingleColor: Colors.transparent,
                            displaySubmitButton: true,
                            // displaySubmitButton: true,
                          ).show(context);
                        },
                        controller: kundliController.tob,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.labelColor(),
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
                            hintText: "Enter Time of Birth",
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              child: Image.asset(
                                "assets/sign_up/calendar.png",
                                height: 10,
                                color: MyColors.colorButton,
                                // child: Image.asset(
                                //   "assets/sign_up/profile.png",
                                //   height: 15,
                                //   width: 10,
                                //   color: MyColors.colorButton,
                                // ),
                              ),
                            )
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
                    standardTFLabel(text: 'Place of Birth', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: DropdownSearch<CityModel>(
                          popupProps:  const PopupProps.menu(
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: "Search City",
                                ),
                              )
                          ),
                          itemAsString: (CityModel city) => ("${city.name}, ${city.state??""}, ${city.country??""}").toTitleCase(),
                          items: kundliController.cities,
                          selectedItem: kundliController.city,
                          dropdownDecoratorProps:  DropDownDecoratorProps(
                              baseStyle: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.labelColor(),
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
                                  hintText: "Enter City",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                                    child: Image.asset(
                                      "assets/sign_up/location.png",
                                      height: 10,
                                      color: MyColors.colorButton,
                                    ),
                                  )
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
                            kundliController.changeCity(value);
                          },
                        )
                    ),
                    standardTFLabel(text: 'Marital Status', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              kundliController.changeMaritalStatus(KundliConstants.MA);
                            },
                            child: CircleAvatar(
                              radius: 38,
                              backgroundColor: kundliController.marital_status==KundliConstants.MA ? MyColors.colorButton : MyColors.colorGrey.withOpacity(0.2),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: kundliController.marital_status==KundliConstants.MA ? null : MyColors.colorGrey.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/kundli/married.png",
                                    color: kundliController.marital_status==KundliConstants.MA ? null : MyColors.colorGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              kundliController.changeMaritalStatus(KundliConstants.S);
                            },
                            child: CircleAvatar(
                              radius: 38,
                              backgroundColor: kundliController.marital_status==KundliConstants.S ? MyColors.colorButton : MyColors.colorGrey.withOpacity(0.2),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: kundliController.marital_status==KundliConstants.S ? null : MyColors.colorGrey.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/kundli/single.png",
                                    color: kundliController.marital_status==KundliConstants.S ? null : MyColors.colorGrey,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
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
        height: standardBottomBarHeight,
        width: standardBottomBarWidth,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(standardBottomBarRadius),
              topRight: Radius.circular(standardBottomBarRadius)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 46),
          child: GestureDetector(
            onTap: () {
              kundliController.validate();
            },
            child: standardButton(
              context: context,
              backgroundColor: MyColors.colorButton,
              child: Center(
                child: Text(
                  kundliController.kundli==null ? 'ADD' : 'UPDATE',
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
      ),
    );
  }
}
