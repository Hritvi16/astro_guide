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
    countryController.show = countryController.countries;
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextFormField(
              controller: countryController.search,
              onChanged: (value) {
                countryController.searchCountry();
              },
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
                hintText: "Search Country",
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
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
        padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 5),
        itemCount: countryController.show.length,
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            height: 5,
          );
        },
        itemBuilder: (buildContext, index) {
          return getDesign(countryController.show[index]);
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
            Flexible(
              child: RichText(
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
            ),
          ],
        ),
      ),
    );
  }

}
