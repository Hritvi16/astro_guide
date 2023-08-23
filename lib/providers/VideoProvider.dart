import 'package:astro_guide/models/video/VideoListModel.dart';
// import 'package:astro_guide/models/video/VideoResponseModel.dart';
import 'package:astro_guide/repositories/VideoRepository.dart';

class VideoProvider {
  final VideoRepository videoRepository;

  VideoProvider(this.videoRepository);

  Future<VideoListModel> fetch(String token, String endpoint) async {
    var videoListModel = await videoRepository.fetch(token, endpoint);

    return VideoListModel.fromJson(videoListModel);
  }

  // Future<VideoResponseModel> fetchSingle(String token, String endpoint) async {
  //   var videoResponseModel = await videoRepository.fetch(token, endpoint);
  //
  //   return VideoResponseModel.fromJson(videoResponseModel);
  // }
}
