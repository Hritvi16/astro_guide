import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/filter/AstroFilterController.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/language/LanguageModel.dart';
import 'package:astro_guide/models/type/TypeModel.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class AstroFilter extends StatelessWidget {

  AstroFilter(List<String> sort, String ssort, List<TypeModel> types, List<TypeModel> stypes, List<LanguageModel> langs, List<LanguageModel> slangs,  List<String> gender, List<String> sgender,  List<CountryModel> countries, List<CountryModel> scountries, { Key? key }) {
    astroFilterController.onInit();
    astroFilterController.sort = sort;
    astroFilterController.ssort = ssort;
    astroFilterController.types = types;
    astroFilterController.stypes = stypes;
    astroFilterController.langs = langs;
    astroFilterController.slangs = slangs;
    astroFilterController.gender = gender;
    astroFilterController.sgender = sgender;
    astroFilterController.countries = countries;
    astroFilterController.scountries = scountries;
  }

  final AstroFilterController astroFilterController = Get.put<AstroFilterController>(AstroFilterController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<AstroFilterController>(
      builder: (controller) {
        return getBody(context);
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      height: MySize.sizeh80(context),
      color: MyColors.backgroundColor(),
      child: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Sort & Filter'.tr),
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ListView.separated(
                      itemCount: astroFilterController.filters.length,
                      padding: EdgeInsets.only(top: 10),
                      separatorBuilder: (buildContext, index) {
                        return Divider(
                          thickness: 1,
                        );
                      },
                      itemBuilder: (buildContext, index) {
                        return getFilterDesign(astroFilterController.filters[index]);
                      },
                    )
                ),
                Container(
                  width: 1,
                  color: MyColors.colorBorder,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: getFilterOption()
                )
              ],
            ),
          ),
          getActions()
        ],
      ),
    );
  }

  Widget getFilterDesign(String filter) {
    return GestureDetector(
      onTap: () {
        astroFilterController.changeFilter(filter);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          border: astroFilterController.filter == filter ? Border(
            left: BorderSide(
              color: MyColors.colorButton,
              width: 5
            )
          ) : null
        ),
        child: Text(
          filter.tr,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: MyColors.labelColor()
          ),
        ),
      ),
    );
  }

  Widget getFilterOption() {
    return astroFilterController.filter=="Sort by" ? getSortBy() : astroFilterController.filter=="Expertise" ? getExpertise() : astroFilterController.filter=="Language" ? getLanguage() : astroFilterController.filter=="Gender" ? getGender() : getCountry();
  }

  Widget getSortBy() {
    return ListView.separated(
      itemCount: astroFilterController.sort.length,
      padding: EdgeInsets.only(top: 10),
      separatorBuilder: (buildContext, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (buildContext, index) {
        return getSortDesign(astroFilterController.sort[index]);
      },
    );
  }

  Widget getSortDesign(String option) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 5),
      child: Row(
        children: [
          Radio(
            value: option,
            groupValue: astroFilterController.ssort,
            activeColor: MyColors.colorButton,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              astroFilterController.changeSortBy(value);
            },
          ),
          Text(
            option.tr,
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: MyColors.labelColor()
            ),
          ),
        ],
      ),
    );
  }

  Widget getExpertise() {
    return ListView.separated(
      itemCount: astroFilterController.types.length,
      padding: EdgeInsets.only(top: 10),
      separatorBuilder: (buildContext, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (buildContext, index) {
        return getExpertiseDesign(astroFilterController.types[index]);
      },
    );
  }

  Widget getExpertiseDesign(TypeModel option) {
    return getCheckboxDesign(astroFilterController.stypes.contains(option), option.type, (value) {
      astroFilterController.changeType(value, option);
    }, false);
  }

  Widget getLanguage() {
    return ListView.separated(
      itemCount: astroFilterController.langs.length,
      padding: EdgeInsets.only(top: 10),
      separatorBuilder: (buildContext, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (buildContext, index) {
        return getLanguageDesign(astroFilterController.langs[index]);
      },
    );
  }

  Widget getLanguageDesign(LanguageModel option) {
    return getCheckboxDesign(astroFilterController.slangs.contains(option), option.lang, (value) {
      astroFilterController.changeLanguage(value, option);
    }, false);
  }

  Widget getGender() {
    return ListView.separated(
      itemCount: astroFilterController.gender.length,
      padding: EdgeInsets.only(top: 10),
      separatorBuilder: (buildContext, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (buildContext, index) {
        return getGenderDesign(astroFilterController.gender[index]);
      },
    );
  }

  Widget getGenderDesign(String option, ) {
    return getCheckboxDesign(astroFilterController.sgender.contains(option), option, (value) {
      astroFilterController.changeGender(value, option);
    }, true);
  }

  Widget getCountry() {
    return ListView.separated(
      itemCount: astroFilterController.countries.length,
      padding: EdgeInsets.only(top: 10),
      separatorBuilder: (buildContext, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (buildContext, index) {
        return getCountryDesign(astroFilterController.countries[index]);
      },
    );
  }

  Widget getCountryDesign(CountryModel option) {
    return getCheckboxDesign(astroFilterController.scountries.contains(option), option.name, (value) {
      astroFilterController.changeCountry(value, option);
    }, false);
  }

  Widget getCheckboxDesign(bool val, String option, void Function(dynamic value) onChanged, bool convert) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 5),
      child: Row(
        children: [
          Checkbox(
            value: val,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            activeColor: MyColors.colorButton,
            onChanged: onChanged,
          ),
          Text(
            convert ? option.tr : option,
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: MyColors.labelColor()
            ),
          ),
        ],
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
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                astroFilterController.reset();
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: MyColors.white,
                      width: 0.5
                    )
                  )
                ),
                child: Text(
                  "Reset",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MyColors.labelColor()
                  )
                ),
              ),
            )
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                astroFilterController.apply();
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
                  "Apply",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MyColors.black
                  )
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

}
