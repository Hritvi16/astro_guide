import 'package:astro_guide/models/testimonial/TestimonialListModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialListModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialResponseModel.dart';
import 'package:astro_guide/repositories/TestimonialRepository.dart';

class TestimonialProvider {
  final TestimonialRepository testimonialRepository;

  TestimonialProvider(this.testimonialRepository);

  Future<TestimonialListModel> fetch(String token, String endpoint) async {
    var testimonialListModel = await testimonialRepository.fetch(token, endpoint);

    return TestimonialListModel.fromJson(testimonialListModel);
  }
  
  Future<TestimonialResponseModel> fetchSingle(String token, String endpoint) async {
    var testimonialResponseModel = await testimonialRepository.fetch(token, endpoint);

    return TestimonialResponseModel.fromJson(testimonialResponseModel);
  }
}
