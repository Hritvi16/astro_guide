import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/KundliConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/controllers/session/CheckSessionController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/Spacing.dart';
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
          bottomNavigationBar: checkSessionController.load ? getConfirmDesign(context) : null,
          body: checkSessionController.load ? getBody(context) :
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
                child: CustomAppBar('${checkSessionController.category.toTitleCase()} Intake Form'),
              ),
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            controller: checkSessionController.scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 16),
              child: Form(
                key: checkSessionController.formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: standardVTBS),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: MyColors.colorButton
                        )
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Talk Time: ",
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            color: MyColors.colorOn
                          ),
                          children: [
                            TextSpan(
                              text: checkSessionController.free ? "10 minutes" :
                              Essential.getChatDuration(
                                  Essential.getSessionSeconds(checkSessionController.wallet, checkSessionController.category.toLowerCase()=="chat" ? checkSessionController.astrologer.p_chat??0: checkSessionController.astrologer.p_call??0), "", "-"),
                              style: GoogleFonts.manrope(
                                color: MyColors.colorOff
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
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
                          standardTFLabel(text: Essential.getPlatformKundli(), optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: DropdownSearch<KundliModel>(
                                popupProps:  PopupProps.menu(
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      decoration: InputDecoration(
                                        hintText: "Search ${Essential.getPlatformKundli()}",
                                      ),
                                    )
                                ),
                                itemAsString: (KundliModel kundli) => kundli.name,
                                items: checkSessionController.kundlis,
                                selectedItem: checkSessionController.kundli,
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
                                    checkSessionController.updateCount();
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
                            checkSessionController.changeRelation(value);
                          },
                          validator: (value) {
                            if (value==null) {
                              if(checkSessionController.cnt==0) {

                              }
                              checkSessionController.updateCount();
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
                        controller: checkSessionController.name,
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
                            if(checkSessionController.cnt==0) {

                            }
                            checkSessionController.updateCount();
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
                            pickerTitle:  Text(
                              "Set your Date of Birth",
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.colorButton,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            initialDateTime: checkSessionController.date,
                            onSubmit: (value) {
                              checkSessionController.setDOB(value);
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
                        controller: checkSessionController.dob,
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
                            if(checkSessionController.cnt==0) {

                            }
                            checkSessionController.updateCount();
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
                        key: checkSessionController.tobKey,
                        onTap: () {
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
                            initialTime: Time(hours: checkSessionController.date.hour, minutes: checkSessionController.date.minute),
                            onChange: (value) {
                              print(value);
                              checkSessionController.setTOB(value);
                            },
                            onSubmit: (value) {
                              print(value);
                              checkSessionController.setTOB(value);
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
                        controller: checkSessionController.tob,
                        // readOnly: true,
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
                            if(checkSessionController.cnt==0) {
                              checkSessionController.scrollToRequiredField(checkSessionController.tobKey);
                            }
                            checkSessionController.updateCount();
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
                          key: checkSessionController.pobKey,
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
                              if(checkSessionController.cnt==0) {
                                checkSessionController.scrollToRequiredField(checkSessionController.pobKey);
                              }
                              checkSessionController.updateCount();
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
                        key: checkSessionController.genderKey,
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
          activeColor: MyColors.colorButton,
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
