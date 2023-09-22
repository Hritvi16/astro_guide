import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/providers/TestimonialProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyTestimonialController extends GetxController {
  MyTestimonialController();

  final storage = GetStorage();

  late TestimonialProvider testimonialProvider = Get.find();

  late List<TestimonialModel> testimonials;

  late bool load;


  @override
  void onInit() {
    super.onInit();
    load = false;
    testimonials = [];

    start();
  }

  start() {
    getTestimonials();
  }


  Future<void> getTestimonials() async {
    await testimonialProvider.fetch(storage.read("access"), ApiConstants.user).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        testimonials = [];
        testimonials.addAll(response.data??[]);
      }
      load = true;
      update();
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getTestimonials();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> goto(String page, {dynamic arguments}) async {
    await Get.toNamed(page, arguments: arguments)?.then((value) {
      getTestimonials();
    });
    return true;
  }

  Future<bool> delete(int id) async {
    bool status = false;

    await testimonialProvider.fetchSingle(storage.read("access"),ApiConstants.delete+id.toString()).then((response) {
      print(response.toJson());
      Essential.showSnackBar(response.message);
      if(response.code==1) {
        status = true;
      }
      else {
        status = false;
      }
    });

    return status;
  }

  void removeTestimonial(TestimonialModel testimonial) {
    testimonials.remove(testimonial);
    update();
  }
}
