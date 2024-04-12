import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/WalletConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/models/payment/PaymentModel.dart';
import 'package:astro_guide/models/razorpay/ErrorModel.dart';
import 'package:astro_guide/models/razorpay/PaymentResponseModel.dart';
import 'package:astro_guide/models/razorpay/SuccessModel.dart';
import 'package:astro_guide/providers/WalletProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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

  late Razorpay razorpay;
  Object? result;

  late PaymentModel payment;
  late int id;


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
    await walletProvider.fetch(storage.read("access"), ApiConstants.user).then((response) async {
      if(response.code==1) {
        wallet = response.amount??0;
        await storage.write("wallet", wallet);
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
      // if(double.parse(amount.text)<50) {
      if(double.parse(amount.text)<1) {
        Essential.showInfoDialog("You have to recharge minimum of Rs. 50");
      }
      else {
        String text = "We are delighted to provide you with the details of your recharge. Upon recharging with Rs. ${amount.text}, you will receive the following balance:"
            "\n\nWallet Amount :   Rs. ${amount.text}"
            "\nValidity :   Lifetime"
            "\nGST :   ${double.parse(amount.text)*0.18}"
            "\nTotal Payment :   ${(double.parse(amount.text)*0.18)+double.parse(amount.text)}"
            "\nDo you want to proceed?";

        // Essential.showBasicDialog("You will get Rs. ${amount.text} of balance. Are you sure you want to proceed?", "Yes", "No").then((value) {
        Essential.showBasicDialog(text, "Yes", "No").then((value) {
          if(value=="Yes") {
            selectMethod(amount.text, amount.text, 'CUS', "Money added to your wallet on recharge of Rs. ${amount.text}");
          }
        });
      }
    }
    else if(package!=null) {
      print(package?.toJson());
      String text = "We are delighted to provide you with the details of our recharge offer. Upon recharging with Rs. ${package?.amount.toString()}, you will receive the following balance:"
          "\n\nWallet Amount :   Rs. ${getOfferAmount()}"
          "\nValidity :   Lifetime"
          "\nGST :   ${(package?.amount??0)*0.18}"
          "\nTotal Payment :   ${((package?.amount??0)*0.18)+(package?.amount??0)}"
          "\nDo you want to proceed?";

      print(text);

      Essential.showBasicDialog(text, "Yes", "No").then((value) {
        if(value=="Yes") {
          selectMethod((package?.amount??0).toString(), getOfferAmount(), 'P', "Money added to your wallet on package recharge of Rs. ${package?.amount.toString()}");
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

  void selectMethod(String amount, String wallet_amount, String type, String description) {
    Get.toNamed("/paymentMethod")?.then((value) {
      if(value!=null) {
        addToWallet(amount, wallet_amount, type, description, value);
      }
    });
  }

  void addToWallet(String amount, String wallet_amount, String type, String description, String payment_type) {
    Map<String, dynamic> data = {
      WalletConstants.payment_type : payment_type,
      WalletConstants.amount : amount,
      WalletConstants.wallet_amount : wallet_amount,
      WalletConstants.type : type,
      WalletConstants.description : description,
      WalletConstants.successUrl : '',
      WalletConstants.cancelUrl : '',
      if(type=="P")
        WalletConstants.p_id : package?.id??"",
    };

    print(data);

    walletProvider.transaction(data, ApiConstants.transactionAPI+ApiConstants.add, storage.read("access")??CommonConstants.essential).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        if(payment_type=="RAZORPAY") {
          await initRazorpay();
          id = response.id??-1;
          payment = response.payment!;
          update();
          getRazorpayCheckout();
        }
        if(payment_type=="STRIPE") {
          getStripeCheckout(response.id ?? -1, response.transaction_id ?? "");
        }
        else if(payment_type=="PHONEPE") {
          phonePeInit(response.body ?? "", response.checksum ?? "");
        }
        // package = null;
        // this.amount.text = "";
        // getPackages();
      }
      update();
    });
  }

  Future<void> initRazorpay() async {
    try {
      razorpay = Razorpay();
      update();

      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    }
    catch(e) {
      print(e);
      print(e.toString());
    }
  }

  void getRazorpayCheckout() {
    print("---------------------------------------------------");
    print(payment.toJson());
    print(payment.amount_due);
    var options = {
      // 'key': "rzp_test_cXprx1a09EIpa4",
      'key': "rzp_live_9K8UTtB73p7JTM",
      'amount': payment.amount_due * 100, //in the smallest currency sub-unit.
      'order_id': payment.id, // Generate order_id using Orders API
      'timeout': 600, // in seconds
    };
    print(options);
    // var options = {
    //   'key': payment.id,
    //   'amount': payment.amount_due * 100, //in the smallest currency sub-unit.
    //   // 'name': 'Acme Corp.',
    //   'order_id': payment.receipt, // Generate order_id using Orders API
    //   // 'description': 'Fine T-Shirt',
    //   'timeout': 60, // in seconds
    //   'prefill': {
    //     'contact': '9586033791',
    //     'email': 'hritvi16gajiwala@gmail.com'
    //   }
    // };

    razorpay.open(options);
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print("------------------------Success--------------------------");
    print(response.toString());
    print(response.data);
    print(response.orderId);
    print(response.paymentId);
    print(response.signature);
    PaymentResponseModel paymentResponse = PaymentResponseModel(
        status: "Success",
        code: 1,
        success: SuccessModel(orderId: response.orderId, paymentId: response.paymentId, signature: response.signature)
    );
    processPayment(paymentResponse);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print("------------------------Error--------------------------");
    print(response.message??"");
    Map<String, dynamic> res;
    bool first;
    if((response.message??"").startsWith("{") && (response.message??"").endsWith("}")) {
      first = true;
      res = json.decode(response.message ?? "");
    }
    else {
      first = false;
      res = {
        "code" : response.code.toString(),
        "reason" : response.message
      };
    }
    print(res);
    print(res!=null);
    print(response.code);
    PaymentResponseModel paymentResponse = PaymentResponseModel(
        status: "Failure",
        code: response.code,
        error: ErrorModel.fromJson(first ? res['error'] : res)
    );
    cancelPayment(paymentResponse);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print("------------------------Wallet--------------------------");
    print(response.toString());
    print(response.walletName);
    print(response);
    PaymentResponseModel paymentResponse = PaymentResponseModel(
        status: "Success",
        code: 1,
        success: SuccessModel(orderId: payment?.id??"", wallet: response.walletName)
    );
    processPayment(paymentResponse);

  }

  clearRazorpay() {
    razorpay.clear(); // Removes all listeners
  }


  Future<void> getStripeCheckout(int id, String sessionId) async {
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

  void updateWalletStatus(int status, int id) {
    Map<String, dynamic> data = {
      WalletConstants.status : status,
      WalletConstants.id : id,
      "method" : "STRIPE",
    };

    walletProvider.transaction(data, ApiConstants.transactionAPI+ApiConstants.statuss, storage.read("access")??CommonConstants.essential).then((response) {
      print("response.toJson()");
      print(response.toJson());
      if(response.code==1) {
        package = null;
        amount.text = "";
        getPackages();
      }
      update();
    });
  }

  Future<void> processPayment(PaymentResponseModel paymentResponse) async {
    final Map<String, dynamic> data = {
      "method" : "RAZORPAY",
      "id" : id.toString(),
      "status" : paymentResponse.code,
      "status_type" : paymentResponse.status,
      "payment_id" : paymentResponse.success?.paymentId??"",
      "receipt" : payment?.receipt??"",
      "wallet" : paymentResponse.success?.wallet??"",
    };

    print(data);

    await walletProvider.transaction(data, ApiConstants.transactionAPI+ApiConstants.statuss, storage.read("access")).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        package = null;
        amount.text = "";
        getPackages();
      }
      update();
    });
  }

  Future<void> cancelPayment(PaymentResponseModel paymentResponse) async {
    final Map<String, dynamic> data = {
      "method" : "RAZORPAY",
      "id" : id.toString(),
      "status" : paymentResponse.code,
      "status_type" : paymentResponse.status,
      "payment_id" : paymentResponse.success?.paymentId??"",
      "receipt" : payment?.receipt??"",
      "error_code" : paymentResponse.error?.code??"",
      "rdescription" : paymentResponse.error?.description??"",
      "source" : paymentResponse.error?.source??"",
      "step" : paymentResponse.error?.step??"",
      "reason" : paymentResponse.error?.reason??"",
    };

    await walletProvider.transaction(data, ApiConstants.transactionAPI+ApiConstants.statuss, storage.read("access")).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        package = null;
        amount.text = "";
        getPackages();
      }
      update();
    });
  }

  void phonePeInit(String body, String checksum) {
    PhonePePaymentSdk.init(CommonConstants.environment, CommonConstants.appId, CommonConstants.merchantId, CommonConstants.enableLogging)
        .then((val)
    {
      result = '$result \n PhonePe SDK Initialized - $val';
      update();
      print("checksum");
      print(checksum);
      getPackageSignatureForAndroid(body, checksum);
    })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void getPackageSignatureForAndroid(String body, String checksum) {
    if (Platform.isAndroid) {
      PhonePePaymentSdk.getPackageSignatureForAndroid()
          .then((packageSignature) {
          print(packageSignature.toString());
          result = '$result \n Generated Package Signature - $packageSignature';
          update();
          startPGTransaction(body, checksum);
      })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }
  }

  void handleError(error) {
    result = "$result \n $error ";
    update();
  }

  void startPGTransaction(String body, String checksum) async {
    try {
      var response = PhonePePaymentSdk.startTransaction(
          body, CommonConstants.callbackUrl, checksum, CommonConstants.packageName);
      response
          .then((val) {
          if (val != null) {
            print("valllll");
            print(val);
            String status = val['status'].toString();
            String error = val['error'].toString();

            if (status == 'SUCCESS') {
              result = "$result \n Flow Complete - STATUS SUCESS";
            } else {
              result =
              "$result \n Flow Complete - STATUS $status and error $error";
            }
          } else {
            result = " $result \n FLOW INCOMPLETE";
          }
          update();

          print(result);
          print(result.toString());
      })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
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
