import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/providers/TestimonialProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TestimonialsController extends GetxController {
  TestimonialsController();

  final storage = GetStorage();

  late TestimonialProvider testimonialsProvider = Get.find();

  late List<TestimonialModel> testimonials;

  late bool load;

  @override
  void onInit() {
    super.onInit();
    load = false;

    start();
  }

  start() {
    getTestimonials();
  }


  Future<void> getTestimonials() async {
    await testimonialsProvider.fetch(storage.read("access"), ApiConstants.all).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        testimonials = response.data??[];
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

  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments);
  }

}
