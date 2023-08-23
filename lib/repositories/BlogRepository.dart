import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class BlogRepository {
  final ApiService apiService;

  BlogRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var blogs = await apiService.get(endpoint: ApiConstants.blogAPI+endpoint, token: token);
    return blogs;
  }

}
