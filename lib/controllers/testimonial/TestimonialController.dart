import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/providers/TestimonialProvider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TestimonialController extends GetxController {
  TestimonialController();

  final storage = GetStorage();

  late TestimonialProvider testimonialProvider = Get.find();

  late TestimonialModel testimonial;

  late bool load;

  late int id;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments;
    load = false;

    start();
  }

  start() {
    getTestimonial();
  }


  Future<void> getTestimonial() async {
    await testimonialProvider.fetchSingle(storage.read("access"), id.toString()).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        testimonial = response.data!;
      }
      load = true;
      update();
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getTestimonial();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
