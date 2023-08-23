import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class VideoRepository {
  final ApiService apiService;

  VideoRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var videos = await apiService.get(endpoint: ApiConstants.videoAPI+endpoint, token: token);
    return videos;
  }

}
