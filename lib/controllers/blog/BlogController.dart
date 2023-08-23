import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/providers/BlogProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BlogController extends GetxController {
  BlogController();

  final storage = GetStorage();

  late BlogProvider blogProvider = Get.find();

  late BlogModel blog;

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
    getBlog();
  }


  Future<void> getBlog() async {
    await blogProvider.fetchSingle(storage.read("access"), id.toString()).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        blog = response.data!;
      }
      load = true;
      update();
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getBlog();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
