import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/KundliConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/controllers/session/CheckSessionController.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
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


class CheckSession extends StatelessWidget {
  CheckSession({ Key? key }) : super(key: key);

  final CheckSessionController checkSessionController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<CheckSessionController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          bottomNavigationBar: checkSessionController.load ? getConfirmDesign(context) : null,
          body: getBody(context),
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
    return checkSessionController.load ?
    Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeight,
              padding: EdgeInsets.symmetric(
                  horizontal: standardHorizontalPagePadding),
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('${checkSessionController.category.toTitleCase()} Intake Form'),
              ),
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 16),
              child: Form(
                key: checkSessionController.formKey,
                child: Column(
                  children: [
                    standardTFLabel(text: 'Type', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          getTypeBox(KundliConstants.existing, "Existing"),
                          getTypeBox(KundliConstants.nonexisting, "Non-Existing"),
                        ],
                      ),
                    ),
                    if(checkSessionController.type==KundliConstants.existing)
                      Column(
                        children: [
                          standardTFLabel(text: 'Kundli', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: DropdownSearch<KundliModel>(
                                popupProps:  const PopupProps.menu(
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      decoration: InputDecoration(
                                        hintText: "Search Kundli",
                                      ),
                                    )
                                ),
                                itemAsString: (KundliModel kundli) => kundli.name,
                                items: checkSessionController.kundlis,
                                selectedItem: checkSessionController.kundli,
                                dropdownDecoratorProps:  DropDownDecoratorProps(
                                    baseStyle: GoogleFonts.manrope(
                                      fontSize: 16.0,
                                      color: MyColors.black,
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
                                        hintText: "Enter Kundli",
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                        prefixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 7),
                                            child: Image.asset(
                                              "assets/astrology/kundali.png",
                                              height: 20,
                                            )
                                        )
                                    )
                                ),
                                onChanged: (value) {
                                  checkSessionController.changeKundli(value);
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
                        ],
                      ),
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
                          items: checkSessionController.relations,
                          selectedItem: checkSessionController.relation,
                          dropdownDecoratorProps:  DropDownDecoratorProps(
                              baseStyle: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.black,
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
                            checkSessionController.changeRelation(value);
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
                    standardTFLabel(text: 'Full Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: checkSessionController.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.colorButton,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Enter Full Name",
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
                              checkSessionController.changeGender(UserConstants.F);
                            },
                            child: Image.asset(
                                "assets/sign_up/${checkSessionController.gender==UserConstants.F ? "female_on" : "female_off"}.png",
                                height: 80,
                                width: 80
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              checkSessionController.changeGender(UserConstants.M);
                            },
                            child: Image.asset("assets/sign_up/${checkSessionController.gender==UserConstants.M ? "male_on" : "male_off"}.png",
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
                            title:  "Set your Date of Birth",
                            initialDateTime: checkSessionController.date,
                            titleStyle: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: MyColors.colorButton,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                            onSubmit: (value) {
                              checkSessionController.setDOB(value);
                            },
                            bottomPickerTheme:  BottomPickerTheme.plumPlate,
                            buttonText: "Done",
                            buttonTextStyle: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                            buttonSingleColor: Colors.transparent,
                            displayButtonIcon: false,
                          ).show(context);
                        },
                        controller: checkSessionController.dob,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
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
                          BottomPicker.time(
                            title:  "Set your Time of Birth",
                            initialDateTime: checkSessionController.date,
                            titleStyle: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: MyColors.colorButton,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                            onSubmit: (value) {
                              print(value);
                              checkSessionController.setTOB(value);
                            },
                            bottomPickerTheme:  BottomPickerTheme.plumPlate,
                            buttonText: "Done",
                            buttonTextStyle: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                            buttonSingleColor: Colors.transparent,
                            displayButtonIcon: false,
                          ).show(context);
                        },
                        controller: checkSessionController.tob,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
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
                          items: checkSessionController.cities,
                          selectedItem: checkSessionController.city,
                          dropdownDecoratorProps:  DropDownDecoratorProps(
                              baseStyle: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.black,
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
                            checkSessionController.changeCity(value);
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
                              checkSessionController.changeMaritalStatus(KundliConstants.MA);
                            },
                            child: CircleAvatar(
                              radius: 38,
                              backgroundColor: checkSessionController.marital_status==KundliConstants.MA ? MyColors.colorButton : MyColors.colorGrey.withOpacity(0.2),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: checkSessionController.marital_status==KundliConstants.MA ? null : MyColors.colorGrey.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/kundli/married.png",
                                    color: checkSessionController.marital_status==KundliConstants.MA ? null : MyColors.colorGrey,
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
                              checkSessionController.changeMaritalStatus(KundliConstants.S);
                            },
                            child: CircleAvatar(
                              radius: 38,
                              backgroundColor: checkSessionController.marital_status==KundliConstants.S ? MyColors.colorButton : MyColors.colorGrey.withOpacity(0.2),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: checkSessionController.marital_status==KundliConstants.S ? null : MyColors.colorGrey.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/kundli/single.png",
                                    color: checkSessionController.marital_status==KundliConstants.S ? null : MyColors.colorGrey,
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
    ) :
    LoadingScreen();
  }


  Widget? getConfirmDesign(BuildContext context) {
    return PhysicalModel(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(standardBottomBarRadius),
          topRight: Radius.circular(standardBottomBarRadius)
      ),
      shadowColor: MyColors.black,
      color: MyColors.white,
      child: Container(
        height: standardBottomBarHeight,
        width: standardBottomBarWidth,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(standardBottomBarRadius),
              topRight: Radius.circular(standardBottomBarRadius)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 46),
          child: GestureDetector(
            onTap: () {
              checkSessionController.validate();
            },
            child: standardButton(
              context: context,
              backgroundColor: MyColors.colorButton,
              child: Center(
                child: Text(
                  'Start ${checkSessionController.category.toLowerCase()} with ${checkSessionController.astrologer.name}',
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

  Widget getTypeBox(String value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: checkSessionController.type,
          onChanged: (val) {
            checkSessionController.changeType(value);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

}
