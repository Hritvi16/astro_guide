import 'dart:io';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/myProfile/MyProfileController.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatelessWidget {
  MyProfile({ Key? key }) : super(key: key);

  final MyProfileController myProfileController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MyProfileController>(
      builder: (controller) {
        return myProfileController.load ?
        Scaffold(
          // resizeToAvoidBottomInset: false,
          resizeToAvoidBottomInset: true,
          body: getBody(),
        )
        : LoadingScreen();
      },
    );
  }

  Widget getBody() {
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
                child: CustomAppBar("My Profile".tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: MySize.size100(context),
            height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                image: Essential.getPlatform() ?
                DecorationImage(
                    image: AssetImage("assets/essential/bg.png")
                ) : null
            ),
            child: SingleChildScrollView(
              child: Container(
                // height: 500,
                // padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24)
                  ),
                  child: Theme(
                    data: ThemeData(
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: MyColors.colorButton,
                        ),
                        shadowColor: Colors.transparent,
                        canvasColor: MyColors.white
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: getCustomStepper(),
                    ),
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getSteps() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(0, myProfileController.eval1),
        ),
        getConnector(0),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(1, myProfileController.eval2),
        ),
        getConnector(1),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(2, myProfileController.eval3),
        ),
      ],
    );
  }

  Widget getStep(int step, int eval) {
    return step==myProfileController.current ?
    Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MyColors.white,
        border: Border.all(
          color: MyColors.colorButton
        )
      ),
      child: Container(
          height: 16,
          width: 16,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.colorButton
          ),
      )
    ) :
    eval==0 ?
    Container(
        height: 24,
        width: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.colorButton
        ),
        child: Text(
          (step+1).toString(),
        )
    ) :
    eval==1 ? Icon(
      Icons.check_circle,
      color: MyColors.green500,
      size: 24,
    ) :
    Icon(
      Icons.warning,
      color: MyColors.red,
      size: 24,
    );
  }



  getStepDesign(int step) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS, left: 10, right: 10),
      child: step==0 ? getStep1() : step==1 ? getStep2() : getStep3(),
    );
  }

  getStep1() {
    return Form(
      key: myProfileController.step1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: MyColors.colorButton,
                  child: myProfileController.image==null ?
                  (myProfileController.user.profile??"").isEmpty ?
                  CircleAvatar(
                    radius: 67,
                    child: Icon(
                      Icons.person,
                      color: MyColors.grey30,
                      size: 50,
                    ),
                    backgroundColor: MyColors.white,
                  ) :
                  CircleAvatar(
                    radius: 67,
                    backgroundImage: NetworkImage(ApiConstants.userUrl+(myProfileController.user.profile??""))
                  ) :
                  CircleAvatar(
                      radius: 67,
                      backgroundImage: FileImage(File(myProfileController.image?.path??""))
                  )
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      myProfileController.chooseSource(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.colorButton
                      ),
                      child: Image.asset(
                        "assets/sign_up/camera.png",
                        color: MyColors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
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
              controller: myProfileController.name,
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
          myProfileController.user.joined_via=="CUSTOM" ?
          standardTFLabel(text: 'Mobile Number', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16)
          : standardTFLabel(text: 'Mobile Number', optional: '\t(Optional)', optionalFontSize: 11),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              readOnly: true,
              enabled: false,
              controller: myProfileController.mobile,
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
                  hintText: "Enter Mobile No.",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: (myProfileController.code?.imageFullUrl??"").startsWith("http") ?
                        Image.network(
                          myProfileController.code?.imageFullUrl??"",
                          height: 24,
                          width: 33,
                        )
                            : Image.asset(
                          "assets/country/India.png",
                          height: 24,
                          width: 33,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          myProfileController.code?.code??"+91",
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.black,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        color: MyColors.colorDivider,
                        width: 2,
                        height: 20,
                      )
                    ],
                  )
              ),

              validator: (value) {
                if ((value??"").isEmpty && myProfileController.user.joined_via=="CUSTOM") {
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
          myProfileController.user.joined_via!="CUSTOM" ?
          standardTFLabel(text: 'Email Address', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16)
          : standardTFLabel(text: 'Email Address', optional: '\t(Optional)', optionalFontSize: 11),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              readOnly: myProfileController.user.joined_via!="CUSTOM",
              enabled: myProfileController.user.joined_via=="CUSTOM",
              keyboardType: TextInputType.name,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.labelColor(),
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: myProfileController.email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Email Address",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/sign_up/email.png",
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
                if ((value??"").isEmpty && myProfileController.user.joined_via!="CUSTOM") {
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  getStep2() {
    return Form(
      key: myProfileController.step2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // standardTFLabel(text: 'Nationality', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          // Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 5),
          //     child: DropdownSearch<CountryModel>(
          //       popupProps: PopupProps.menu(
          //         showSearchBox: true,
          //         searchFieldProps: TextFieldProps(
          //           decoration: InputDecoration(
          //             hintText: "Search Nationality",
          //           ),
          //         ),
          //         itemBuilder: (buildContext, country, isSelected) {
          //           return Padding(
          //             padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //             child: Row(
          //               children: [
          //                 Image.network(
          //                   ApiConstants.countryUrl+country.icon,
          //                   height: 24,
          //                   width: 33,
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Text(
          //                   country.nationality,
          //                   style: GoogleFonts.manrope(
          //                     fontSize: 16.0,
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         }
          //       ),
          //       itemAsString: (CountryModel country) => country.nationality,
          //       items: myProfileController.countries,
          //       selectedItem: myProfileController.nationality,
          //       dropdownDecoratorProps:  DropDownDecoratorProps(
          //           baseStyle: GoogleFonts.manrope(
          //             fontSize: 16.0,
          //             color: MyColors.labelColor(),
          //             letterSpacing: 0,
          //             fontWeight: FontWeight.w400,
          //           ),
          //           dropdownSearchDecoration: InputDecoration(
          //               border: OutlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: MyColors.colorButton,
          //                 ),
          //                 borderRadius: BorderRadius.circular(16),
          //               ),
          //               hintText: "Enter Nationality",
          //               contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //               prefixIcon: myProfileController.nationality==null
          //                   ? Padding(
          //                   padding: const EdgeInsets.symmetric(vertical: 14),
          //                   child: Image.asset(
          //                     "assets/sign_up/location.png",
          //                     height: 10,
          //                     color: MyColors.colorButton,
          //                   )
          //               ) :
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 14, right: 10),
          //                 child: Image.network(
          //                   ApiConstants.countryUrl+myProfileController.nationality!.icon,
          //                   height: 24,
          //                   width: 33,
          //                 ),
          //               )
          //           )
          //       ),
          //       onChanged: (value) {
          //         myProfileController.changeNationality(value);
          //       },
          //       validator: (value) {
          //         if (value==null) {
          //           return "* Required";
          //         }  else {
          //           return null;
          //         }
          //       },
          //     )
          // ),
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
                  backgroundColor: MyColors.cardColor(),
                  closeIconColor: MyColors.iconColor(),
                  initialDateTime: myProfileController.date,
                  maxDateTime: DateTime.now(),
                  onSubmit: (value) {
                    myProfileController.setDOB(value);
                  },
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
              controller: myProfileController.dob,
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
          standardTFLabel(text: 'Gender', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    myProfileController.changeGender(UserConstants.F);
                  },
                  child: Image.asset(
                    "assets/sign_up/${myProfileController.gender==UserConstants.F ? "female_on" : "female_off"}.png",
                    height: 80,
                    width: 80
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    myProfileController.changeGender(UserConstants.M);
                  },
                  child: Image.asset("assets/sign_up/${myProfileController.gender==UserConstants.M ? "male_on" : "male_off"}.png",
                    height: 80,
                    width: 80
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  getStep3() {
    return Form(
      key: myProfileController.step3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // standardTFLabel(text: 'Country', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   child: DropdownSearch<CountryModel>(
          //     popupProps: PopupProps.menu(
          //         showSearchBox: true,
          //         searchFieldProps: TextFieldProps(
          //           decoration: InputDecoration(
          //             hintText: "Search Country",
          //           ),
          //         ),
          //         itemBuilder: (buildContext, country, isSelected) {
          //           return Padding(
          //             padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Image.network(
          //                   ApiConstants.countryUrl+country.icon,
          //                   height: 24,
          //                   width: 33,
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Flexible(
          //                   child: Text(
          //                     country.name,
          //                     style: GoogleFonts.manrope(
          //                       fontSize: 16.0,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         }
          //     ),
          //     itemAsString: (CountryModel country) => country.name,
          //     items: myProfileController.countries,
          //     selectedItem: myProfileController.country,
          //     dropdownDecoratorProps:  DropDownDecoratorProps(
          //       baseStyle: GoogleFonts.manrope(
          //         fontSize: 16.0,
          //         color: MyColors.labelColor(),
          //         letterSpacing: 0,
          //         fontWeight: FontWeight.w400,
          //       ),
          //       dropdownSearchDecoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: MyColors.colorButton,
          //             ),
          //             borderRadius: BorderRadius.circular(16),
          //           ),
          //           hintText: "Enter Country",
          //           contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //           prefixIcon: myProfileController.country==null
          //           ? Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 14),
          //             child: Image.asset(
          //               "assets/sign_up/location.png",
          //               height: 10,
          //               color: MyColors.colorButton,
          //             )
          //           ) :
          //           Padding(
          //             padding: const EdgeInsets.only(left: 14, right: 10),
          //             child: Image.network(
          //               ApiConstants.countryUrl+myProfileController.country!.icon,
          //               height: 24,
          //               width: 33,
          //             ),
          //           )
          //       )
          //     ),
          //     onChanged: (value) {
          //       myProfileController.changeCountry(value);
          //     },
          //     validator: (value) {
          //       if (value==null) {
          //         return "* Required";
          //       }  else {
          //         return null;
          //       }
          //     },
          //   )
          // ),
          // standardTFLabel(text: 'State', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          // Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 5),
          //     child: DropdownSearch<StateModel>(
          //       enabled: myProfileController.country!=null,
          //       popupProps:  const PopupProps.menu(
          //           showSearchBox: true,
          //           searchFieldProps: TextFieldProps(
          //             decoration: InputDecoration(
          //               hintText: "Search State",
          //             ),
          //           )
          //       ),
          //       itemAsString: (StateModel state) => state.name??"",
          //       items: myProfileController.states,
          //       selectedItem: myProfileController.state,
          //       dropdownDecoratorProps:  DropDownDecoratorProps(
          //           baseStyle: GoogleFonts.manrope(
          //             fontSize: 16.0,
          //             color: MyColors.labelColor(),
          //             letterSpacing: 0,
          //             fontWeight: FontWeight.w400,
          //           ),
          //           dropdownSearchDecoration: InputDecoration(
          //               border: OutlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: MyColors.colorButton,
          //                 ),
          //                 borderRadius: BorderRadius.circular(16),
          //               ),
          //               hintText: "Enter State",
          //               contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //               prefixIcon: Padding(
          //                 padding: const EdgeInsets.symmetric(vertical: 14.0),
          //                 child: Image.asset(
          //                   "assets/sign_up/location.png",
          //                   height: 10,
          //                   color: MyColors.colorButton,
          //                 ),
          //               )
          //           )
          //       ),
          //       onChanged: (value) {
          //         myProfileController.changeState(value);
          //       },
          //       validator: (value) {
          //         if (value==null) {
          //           return "* Required";
          //         }  else {
          //           return null;
          //         }
          //       },
          //     )
          // ),
          standardTFLabel(text: 'City', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<CityModel>(
                // enabled: myProfileController.state!=null,
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search City",
                      ),
                    )
                ),
                itemAsString: (CityModel city) => "${city.name}, ${city.state??""}, ${city.country??""}",
                items: myProfileController.cities,
                selectedItem: myProfileController.city,
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
                  myProfileController.changeCity(value);
                },
              )
          ),
          // standardTFLabel(text: 'Postal Code', optional: '\t(Optional)', optionalFontSize: 11),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 5),
          //   child: TextFormField(
          //     keyboardType: TextInputType.name,
          //     controller: myProfileController.pincode,
          //     style: GoogleFonts.manrope(
          //       fontSize: 16.0,
          //       color: MyColors.labelColor(),
          //       letterSpacing: 0,
          //       fontWeight: FontWeight.w400,
          //     ),
          //     decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //           borderSide: BorderSide(
          //             color: MyColors.colorButton,
          //           ),
          //           borderRadius: BorderRadius.circular(16),
          //         ),
          //         hintText: "Enter Postal Code",
          //         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //         prefixIcon: Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 14.0),
          //           child: Image.asset(
          //             "assets/sign_up/location.png",
          //             height: 10,
          //             color: MyColors.colorButton,
          //           ),
          //         )
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }


  getState(int step) {
    if(step==myProfileController.current) {
      return StepState.editing;
    }
    else if(step<myProfileController.current) {
      return StepState.complete;
    }
    else {
      return StepState.disabled;
    }
  }

  getActive(int step) {
    if(step==myProfileController.current) {
      return true;
    }
    else if(step<myProfileController.current) {
      return true;
    }
    else {
      return false;
    }
  }

  getConnector(int step) {
    return step!=2 ? Text(
      "-------------",
      style: GoogleFonts.manrope(
          color: getColor(step)
      ),
    ) : Container();
  }

  getColor(int step) {
    if(step<myProfileController.current) {
      return MyColors.colorButton;
    }
    else {
      return MyColors.colorDivider;
      // return Colors.grey.shade400;
    }
  }

  getCustomStepper() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: standardVTBS),
      child: Column(
        children: [
          getSteps(),
          getStepDesign(myProfileController.current),
          SizedBox(
            height: 20,
          ),
          getStepButton(myProfileController.current),
        ],
      ),
    );
  }

  getStepButton(int current) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(myProfileController.current!=0)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: myProfileController.onStepCancel,
                child: standardButton(
                  context: context,
                  backgroundColor: MyColors.borderColor(),
                  borderColor: MyColors.colorBorder,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/controls/arrow_previous.png",
                        height: standardArrowH,
                        width: standardArrowW,
                        color: MyColors.labelColor(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: standardHTIS),
                        child: Text(
                          'Previous',
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.labelColor(),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          if(myProfileController.current!=0)
            SizedBox(
              width: standardHBBS,
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: myProfileController.onStepContinue,
              child: standardButton(
                context: context,
                backgroundColor: myProfileController.current==2
                ? myProfileController.eval1==1 && myProfileController.eval2==1
                  ? myProfileController.city==null
                    ? MyColors.borderColor()
                    : MyColors.colorButton
                  : MyColors.borderColor()
                : MyColors.colorButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: standardHTIS),
                      child: Text(
                        myProfileController.current==2 ? 'Update' : 'Continue',
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: myProfileController.current==2
                            ? myProfileController.eval1==1 && myProfileController.eval2==1
                              ? myProfileController.city==null
                                ? MyColors.labelColor()
                              : MyColors.white
                            : MyColors.labelColor()
                          : MyColors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/controls/arrow_next.png",
                      height: standardArrowH,
                      width: standardArrowW,
                      color: myProfileController.current==2
                        ? myProfileController.eval1==1 && myProfileController.eval2==1
                          ? myProfileController.city==null
                            ? MyColors.labelColor()
                          : MyColors.white
                        : MyColors.labelColor()
                      : MyColors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}