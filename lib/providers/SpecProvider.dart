import 'package:astro_guide/models/spec/SpecListModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';

class SpecProvider {
  final SpecRepository specRepository;

  SpecProvider(this.specRepository);

  Future<SpecListModel> fetch(String token, String endpoint) async {
    var specListResponse = await specRepository.fetch(token, endpoint);

    return SpecListModel.fromJson(specListResponse);
  }

}
