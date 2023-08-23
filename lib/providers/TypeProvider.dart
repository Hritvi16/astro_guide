import 'package:astro_guide/models/Type/TypeListModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/Type/TypeModel.dart';
import 'package:astro_guide/repositories/TypeRepository.dart';

class TypeProvider {
  final TypeRepository typeRepository;

  TypeProvider(this.typeRepository);

  Future<TypeListModel> fetch(String token, String endpoint) async {
    var typeListResponse = await typeRepository.fetch(token, endpoint);

    return TypeListModel.fromJson(typeListResponse);
  }

}
