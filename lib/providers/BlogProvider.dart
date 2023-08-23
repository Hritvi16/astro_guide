
import 'package:astro_guide/models/blog/BlogListModel.dart';
import 'package:astro_guide/models/blog/BlogResponseModel.dart';
import 'package:astro_guide/repositories/BlogRepository.dart';

class BlogProvider {
  final BlogRepository blogRepository;

  BlogProvider(this.blogRepository);

  Future<BlogListModel> fetch(String token, String endpoint) async {
    var blogListModel = await blogRepository.fetch(token, endpoint);

    return BlogListModel.fromJson(blogListModel);
  }

  Future<BlogResponseModel> fetchSingle(String token, String endpoint) async {
    var blogResponseModel = await blogRepository.fetch(token, endpoint);

    return BlogResponseModel.fromJson(blogResponseModel);
  }
}
