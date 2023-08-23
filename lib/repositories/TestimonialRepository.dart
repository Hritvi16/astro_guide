import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class TestimonialRepository {
  final ApiService apiService;

  TestimonialRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var testimonials = await apiService.get(endpoint: ApiConstants.testimonialAPI+endpoint, token: token);
    return testimonials;
  }

}
