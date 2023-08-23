import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/providers/BlogProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BlogsController extends GetxController {
  BlogsController();

  final storage = GetStorage();

  late BlogProvider blogsProvider = Get.find();

  late List<BlogModel> blogs;

  late bool load;

  @override
  void onInit() {
    super.onInit();
    load = false;

    start();
  }

  start() {
    getBlogs();
  }


  Future<void> getBlogs() async {
    await blogsProvider.fetch(storage.read("access"), ApiConstants.all).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        blogs = response.data??[];
      }
      load = true;
      update();
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getBlogs();
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
