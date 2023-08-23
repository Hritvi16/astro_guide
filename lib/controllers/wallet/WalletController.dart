import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/WalletConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/providers/WalletProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stripe_checkout/stripe_checkout.dart';

class WalletController extends GetxController {
  WalletController();

  final storage = GetStorage();
  final WalletProvider walletProvider = Get.find();

  TextEditingController amount = TextEditingController();

  List<PackageModel> packages = [];
  PackageModel? package;
  late double wallet;
  late BuildContext context;




  @override
  void onInit() {
    super.onInit();
    wallet = 0;
    start();
  }

  start() {
    getPackages();
  }

  Future<void> getPackages() async {
    await walletProvider.fetch(storage.read("access")??CommonConstants.essential, ApiConstants.user).then((response) async {
      if(response.code==1) {
        wallet = response.amount??0;
        storage.write("wallet", wallet);
        packages = [];
        packages.addAll(response.data??[]);

        for (var element in packages) {
          if(package?.id==element.id) {
            await changePackage(element);
          }
        }
      }
      update();
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  Future<void> changePackage(PackageModel package) async {
    this.package = package;
    update();
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getPackages();
  }

  void onLoading() async{
  }

  void selectPackage(PackageModel? package, BuildContext context) {
    if(package!=null) {
      amount.text = "";
      FocusScope.of(context).unfocus();
    }

    this.package = package;
    update();
  }

  void proceed() {
    if(amount.text.isNotEmpty) {
      if(double.parse(amount.text)<50) {
        Essential.showInfoDialog("You have to recharge minimum of Rs. 50");
      }
      else {
        Essential.showBasicDialog("You will get Rs. ${amount.text} of balance. Are you sure you want to proceed?", "Yes", "No").then((value) {
          if(value=="Yes") {
            addToWallet(amount.text, amount.text, 'C', "Money added to your wallet on recharge of Rs. ${amount.text}");
          }
        });
      }
    }
    else if(package!=null) {
      print(package?.toJson());
      String text = "We are delighted to provide you with the details of our recharge offer. Upon recharging with Rs. ${package?.amount.toString()}, you will receive the following balance:"
          "\n\nWallet Amount :   Rs. ${getOfferAmount()}"
          "\nValidity :   Lifetime"
          "\nDo you want to proceed?";

      print(text);

      Essential.showBasicDialog(text, "Yes", "No").then((value) {
        if(value=="Yes") {
          addToWallet((package?.amount??0).toString(), getOfferAmount(), 'P', "Money added to your wallet on package recharge of Rs. ${package?.amount.toString()}");
        }
      });
    }
  }

  String getOfferAmount() {
    if(package?.discount==null || package?.discount==0) {
      return (package?.amount??"").toString();
    }
    else {
      if(package?.type=="AMOUNT") {
        return ((package?.amount??0)+(package?.discount??0)).toString();
      }
      else {
        return ((package?.amount??0)+((package?.amount??0) * (package?.discount??0)/100)).toStringAsFixed(2);
      }
    }
  }

  void addToWallet(String amount, String wallet_amount, String type, String description) {
    Map<String, dynamic> data = {
      WalletConstants.amount : amount,
      WalletConstants.wallet_amount : wallet_amount,
      WalletConstants.type : type,
      WalletConstants.description : description,
      if(type=="P")
        WalletConstants.p_id : package?.id??"",
    };

    walletProvider.transaction(data, ApiConstants.transactionAPI+ApiConstants.add, storage.read("access")??CommonConstants.essential).then((response) {
      print(response.toJson());
      if(response.code==1) {
        getCheckout(response.id??-1, response.transaction_id??"");
        // package = null;
        // this.amount.text = "";
        // getPackages();
      }
      update();
    });
  }

  Future<void> getCheckout(int id, String sessionId) async {
    // final String sessionId = await _createCheckoutSession();
    final result = await redirectToCheckout(
      context: context,
      sessionId: sessionId,
      publishableKey: ApiConstants.publishablekey,
      successUrl: 'https://checkout.stripe.dev/success',
      canceledUrl: 'https://checkout.stripe.dev/cancel',
    );

    print("resultttttt");
    print(result);

    final text = result.when(
      success: () {
        updateWalletStatus(1, id);
      },
      canceled: () {
        updateWalletStatus(2, id);
      },
      error: (e) {
        updateWalletStatus(3, id);
      },
      redirected: () {
        print("redirected");
      },
    );

    // Essential.showSnackBar(text);
  }

  updateWalletStatus(int status, int id) {
    Map<String, dynamic> data = {
      WalletConstants.status : status,
      WalletConstants.id : id,
    };

    walletProvider.transaction(data, ApiConstants.transactionAPI+ApiConstants.statuss, storage.read("access")??CommonConstants.essential).then((response) {
      print(response.toJson());
      if(response.code==1) {
        // getCheckout(response.id??-1, response.transaction_id??"");
        package = null;
        this.amount.text = "";
        getPackages();
      }
      update();
    });
  }

  // Future<String> createCheckoutSession() async {
  //   final url = Uri.parse('${kApiUrl}/api/create-checkout-session');
  //   print(url);
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       if (kIsWeb) 'port': getUrlPort(),
  //     }),
  //   );
  //   final Map<String, dynamic> bodyResponse = json.decode(response.body);
  //
  //   final id = bodyResponse['id'] as String;
  //   log('Checkout session id $id');
  //   return id;
  // }
}
