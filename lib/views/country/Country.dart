import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/country/CountryController.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Country extends StatelessWidget {

  Country(List<CountryModel> countries, CountryModel country, { Key? key }) {
    countryController.countries = countries;
    countryController.country = country;
    countryController.onInit();
  }

  final CountryController countryController = Get.put<CountryController>(CountryController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<CountryController>(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              standardTFLabel(text: 'Select Code'),
              Padding(
                padding: EdgeInsets.only(top: standardVTBS, right: 10),
                child: GestureDetector(
                  onTap: () {
                    countryController.back();
                  },
                  child: Icon(
                    Icons.close
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: getListView(),
          ),
        ],
      ),
    );
  }
  
  Widget getListView() {
    return SingleChildScrollView(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
        itemCount: countryController.countries.length,
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            height: standardVerticalGap,
          );
        },
        itemBuilder: (buildContext, index) {
          return getDesign(countryController.countries[index]);
        },
      ),
    );
  }

  Widget getDesign(CountryModel country) {
    return InkWell(
      onTap: () {
        countryController.changeCountry(country);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,),
        child: Row(
          children: [
            Image.network(
              country.imageFullUrl,
              height: 16,
            ),
            SizedBox(
              width: 15,
            ),
            RichText(
              text: TextSpan(
                  text: country.code+"  ",
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black
                ),
                children: [
                  TextSpan(
                    text: country.name.toTitleCase(),
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}
