import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/providers/VideoProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VideosController extends GetxController {
  VideosController();

  final storage = GetStorage();

  late VideoProvider videosProvider = Get.find();

  late List<VideoModel> videos;

  late bool load;

  @override
  void onInit() {
    super.onInit();
    load = false;

    start();
  }

  start() {
    getVideos();
  }


  Future<void> getVideos() async {
    await videosProvider.fetch(storage.read("access"), ApiConstants.all).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        videos = response.data??[];
      }
      load = true;
      update();
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getVideos();
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
