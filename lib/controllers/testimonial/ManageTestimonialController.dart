import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/providers/TestimonialProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageTestimonialController extends GetxController {
  ManageTestimonialController();

  final storage = GetStorage();

  late TestimonialProvider testimonialProvider = Get.find();

  TestimonialModel? testimonial;

  late TextEditingController description;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    testimonial = Get.arguments;
    description = TextEditingController(text: testimonial?.description);


  }



  Future<void> manage() async {
    Essential.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));

    Map<String, dynamic> data = {
      "description": description.text,
      if(testimonial!=null)
        "id": testimonial?.id
    };

    await testimonialProvider.manage(storage.read("access"), testimonial==null ? ApiConstants.add : ApiConstants.update, data).then((response) async {
      print(response.toJson());
      Get.back();
      if(testimonial==null) {
        Get.back();
      }
      Essential.showSnackBar(response.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments);
  }

}
