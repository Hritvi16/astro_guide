import 'dart:io';

import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/state/StateModel.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/signUp/SignUpController.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/button/Button.dart';

class SignUp extends StatelessWidget {
  SignUp({ Key? key }) : super(key: key);

  final SignUpController signUpController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: MyColors.colorPrimary,
      // resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MySize.size100(context),
        height: MySize.sizeh100(context),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/essential/upper_bg_s.png"
                )
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0, bottom: 8),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 32.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'Create your account now',
                            style: GoogleFonts.manrope(
                              fontSize: 18.0,
                              color: MyColors.black11,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<SignUpController>(
                      builder: (controller) {
                        return Container(
                          // height: 500,
                          // padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: MyColors.white,
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
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.manrope(
                        fontSize: 16.0,
                        color: MyColors.black,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.back();
                          }
                        )
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getSteps() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(0, signUpController.eval1),
        ),
        getConnector(0),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(1, signUpController.eval2),
        ),
        getConnector(1),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(2, signUpController.eval3),
        ),
      ],
    );
  }

  Widget getStep(int step, int eval) {
    return step==signUpController.current ?
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
      key: signUpController.step1,
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
                  child: signUpController.image==null ?
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
                    backgroundImage: FileImage(File(signUpController.image?.path??""))
                  )
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      signUpController.chooseSource();
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
          standardTFLabel(text: 'Full Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.name,
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
          standardTFLabel(text: 'Mobile Number', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: signUpController.mobile,
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
                  hintText: "Enter Mobile No.",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      signUpController.changeCode();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: signUpController.code.imageFullUrl.startsWith("http") ?
                          Image.network(
                            signUpController.code.imageFullUrl,
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
                            signUpController.code.code,
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
          standardTFLabel(text: 'Email Address', optional: '\t(Optional)', optionalFontSize: 11),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.email,
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
            ),
          ),
        ],
      ),
    );
  }


  getStep2() {
    return Form(
      key: signUpController.step2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Nationality', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<CountryModel>(
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search Nationality",
                      ),
                    )
                ),
                itemAsString: (CountryModel country) => country.nationality,
                items: signUpController.countries,
                selectedItem: signUpController.nationality,
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
                        hintText: "Enter Nationality",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        // prefixIcon: signUpController.country==null
                        prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Image.asset(
                              "assets/sign_up/location.png",
                              height: 10,
                              color: MyColors.colorButton,
                            )
                        // ) :
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 14, right: 10),
                        //   child: Image.asset(
                        //     "assets/country/India.png",
                        //     height: 24,
                        //     width: 33,
                        //   ),
                        )
                    )
                ),
                onChanged: (value) {
                  signUpController.changeNationality(value);
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
          standardTFLabel(text: 'Date of Birth', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              onTap: () {
                BottomPicker.date(
                  title:  "Set your Date of Birth",
                  titleStyle: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.colorButton,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                  onSubmit: (value) {
                    signUpController.setDOB(value);
                  },
                  backgroundColor: MyColors.cardColor(),
                  closeIconColor: MyColors.iconColor(),
                  initialDateTime: signUpController.date,
                  maxDateTime: DateTime.now(),
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
              controller: signUpController.dob,
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
          standardTFLabel(text: 'Gender', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    signUpController.changeGender(UserConstants.F);
                  },
                  child: Image.asset(
                    "assets/sign_up/${signUpController.gender==UserConstants.F ? "female_on" : "female_off"}.png",
                    height: 80,
                    width: 80
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    signUpController.changeGender(UserConstants.M);
                  },
                  child: Image.asset("assets/sign_up/${signUpController.gender==UserConstants.M ? "male_on" : "male_off"}.png",
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
      key: signUpController.step3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Country', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: DropdownSearch<CountryModel>(
              popupProps:  const PopupProps.menu(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Search Country",
                    ),
                  )
              ),
              itemAsString: (CountryModel country) => country.name,
              items: signUpController.countries,
              selectedItem: signUpController.country,
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
                    hintText: "Enter Country",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    // prefixIcon: signUpController.country==null
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Image.asset(
                        "assets/sign_up/location.png",
                        height: 10,
                        color: MyColors.colorButton,
                      )
                    // ) :
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 14, right: 10),
                    //   child: Image.asset(
                    //     "assets/country/India.png",
                    //     height: 24,
                    //     width: 33,
                    //   ),
                    )
                )
              ),
              onChanged: (value) {
                signUpController.changeCountry(value);
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
          standardTFLabel(text: 'State', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<StateModel>(
                enabled: signUpController.country!=null,
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search State",
                      ),
                    )
                ),
                itemAsString: (StateModel state) => state.name??"",
                items: signUpController.states,
                selectedItem: signUpController.state,
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
                        hintText: "Enter State",
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
                onChanged: (value) {
                  signUpController.changeState(value);
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
          standardTFLabel(text: 'City', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<CityModel>(
                enabled: signUpController.state!=null,
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search City",
                      ),
                    )
                ),
                itemAsString: (CityModel city) => city.name??"",
                items: signUpController.cities,
                selectedItem: signUpController.city,
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
                  signUpController.changeCity(value);
                },
              )
          ),
          standardTFLabel(text: 'Postal Code', optional: '\t(Optional)', optionalFontSize: 11),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Postal Code",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/sign_up/location.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }


  getState(int step) {
    if(step==signUpController.current) {
      return StepState.editing;
    }
    else if(step<signUpController.current) {
      return StepState.complete;
    }
    else {
      return StepState.disabled;
    }
  }

  getActive(int step) {
    if(step==signUpController.current) {
      return true;
    }
    else if(step<signUpController.current) {
      return true;
    }
    else {
      return false;
    }
  }

  getConnector(int step) {
    return step!=2 ? Text(
      "-------------",
      style: TextStyle(
          color: getColor(step)
      ),
    ) : Container();
  }

  getColor(int step) {
    if(step<signUpController.current) {
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
          getStepDesign(signUpController.current),
          getStepButton(signUpController.current),
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
          if(signUpController.current!=0)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: signUpController.onStepCancel,
                child: standardButton(
                  context: context,
                  backgroundColor: MyColors.white,
                  borderColor: MyColors.colorBorder,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/controls/arrow_previous.png",
                        height: standardArrowH,
                        width: standardArrowW,
                        color: MyColors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: standardHTIS),
                        child: Text(
                          'Previous',
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.black,
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
          if(signUpController.current!=0)
            SizedBox(
              width: standardHBBS,
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: signUpController.onStepContinue,
              child: standardButton(
                context: context,
                backgroundColor: signUpController.current==2
                ? signUpController.eval1==1 && signUpController.eval2==1
                  ? signUpController.country==null
                    ? MyColors.colorDivider
                    : MyColors.colorButton
                  : MyColors.colorDivider
                : MyColors.colorButton,
                child: signUpController.process ?
                  Center(
                    child: CircularProgressIndicator(
                    color: MyColors.white,
                    )
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: standardHTIS),
                        child: Text(
                          signUpController.current==2 ? 'Register' : 'Continue',
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: signUpController.current==2
                              ? signUpController.eval1==1 && signUpController.eval2==1
                                ? signUpController.country==null
                                  ? MyColors.black
                                : MyColors.white
                              : MyColors.black
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
                        color: signUpController.current==2
                          ? signUpController.eval1==1 && signUpController.eval2==1
                            ? signUpController.country==null
                              ? MyColors.black
                            : MyColors.white
                          : MyColors.black
                        : MyColors.white,
                      )
                    ],
                  ),
                )
              ),
            ),
        ],
      ),
    );
  }
}