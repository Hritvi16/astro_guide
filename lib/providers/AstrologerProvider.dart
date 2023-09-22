import 'package:astro_guide/models/astrologer/AstrologerListModel.dart';
import 'package:astro_guide/models/astrologer/AstrologerResponseModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/review/ReviewListModel.dart';
import 'package:astro_guide/models/values/ValuesModel.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';

class AstrologerProvider {
  final AstrologerRepository astrologerRepository;

  AstrologerProvider(this.astrologerRepository);

  Future<AstrologerListModel> fetch(String token, String endpoint) async {
    var astrologerListResponse = await astrologerRepository.fetch(token, endpoint);

    return AstrologerListModel.fromJson(astrologerListResponse);
  }

  Future<ValuesModel> fetchValues(String token, String endpoint) async {
    var valuesModel = await astrologerRepository.fetch(token, endpoint);

    return ValuesModel.fromJson(valuesModel);
  }

  Future<AstrologerListModel> fetchByID(String token, String endpoint, Map<String, String> data) async {
    var astrologerListResponse = await astrologerRepository.fetchByID(token, endpoint, data);

    return AstrologerListModel.fromJson(astrologerListResponse);
  }

  Future<ResponseModel> add(String token, String endpoint, Map<String, String> data) async {
    var response = await astrologerRepository.add(token, endpoint, data);

    return ResponseModel.fromJson(response);
  }

  Future<AstrologerResponseModel> fetchSingle(String token, String endpoint, Map<String, String> data) async {
    var astrologerResponseModel = await astrologerRepository.fetchByID(token, endpoint, data);

    return AstrologerResponseModel.fromJson(astrologerResponseModel);
  }

  Future<ReviewListModel> fetchReviews(String token, String endpoint) async {
    var reviewListModel = await astrologerRepository.fetch(token, endpoint);

    return ReviewListModel.fromJson(reviewListModel);
  }

}
