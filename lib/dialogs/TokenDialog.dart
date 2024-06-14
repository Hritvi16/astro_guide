import 'package:astro_guide/cache_manager/CacheManager.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/token/TokenController.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/label/Label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro_guide/colors/MyColors.dart';


class TokenDialog extends StatelessWidget {

  TokenDialog({Key? key, required SessionHistoryModel sessionHistory, required AstrologerModel astrologer, required Map<String, String> token_amount}) {
    tokenController.sessionHistory = sessionHistory;
    tokenController.astrologer = astrologer;
    tokenController.token = "";
    tokenController.token_amount = token_amount;
    tokenController.amount = TextEditingController(text: "");
  }

  final TokenController tokenController = Get.put<TokenController>(TokenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TokenController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: MyColors.cardColor(),
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "APPRECIATION TOKEN",
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/common/wallet.png",
                            height: 25,
                            color: MyColors.colorButton,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${CommonConstants.rupee}${(storage.read("wallet")??0.0).toStringAsFixed(2)}",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      getTokenDesign("gift.png", "GIFT"),
                      getTokenDesign("rose.png", "ROSE"),
                      getTokenDesign("custom.png", "CUSTOM"),
                    ],
                  ),
                  if(tokenController.token=="CUSTOM")
                    Column(
                      children: [
                        standardTFLabel(text: 'Payable Amount'.tr,),
                        Form(
                            key: tokenController.formKey,
                            child: TextFormField(
                              readOnly: tokenController.token!="CUSTOM",
                              enabled: tokenController.token=="CUSTOM",
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                letterSpacing: 0,
                                color: MyColors.labelColor(),
                                fontWeight: FontWeight.w400,
                              ),
                              controller: tokenController.amount,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors.colorButton,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                hintText: "Enter Amount".tr,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              ),
                              validator: (value) {
                                print(value);
                                if((value??"").isEmpty) {
                                  return tokenController.token.isEmpty ? "* Select a token of appreciation" : "* Required Amount";
                                }
                                return null;
                              },
                            )
                        ),
                      ],
                    ),
                  if(tokenController.token.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        tokenController.validate();
                      },
                      child: standardButton(
                        context: context,
                        height: 40,
                        // backgroundColor: tokenController.token.isNotEmpty ? MyColors.colorButton : MyColors.colorLightExpired,
                        backgroundColor: MyColors.colorButton,
                        margin: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SUBMIT'.tr,
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.white,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                ]
              ),
            ),
          ),
        );
      },
    );
  }

  getTokenDesign(String image, String title) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          tokenController.selectToken(title);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 90,
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: tokenController.token==title ? BoxDecoration(
            color: MyColors.colorBG,
            borderRadius: BorderRadius.circular(5)
          )
          : null,
          child: Column(
            children: [
              Image.asset(
                "assets/token/$image",
                width: 25,
                // color: tokenController.token!=title ? MyColors.grey : null,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title.toTitleCase(),
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  // fontWeight: FontWeight.w500
                ),
              ),
              if(title!="CUSTOM")
                Text(
                CommonConstants.rupee+tokenController.token_amount[title].toString(),
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
