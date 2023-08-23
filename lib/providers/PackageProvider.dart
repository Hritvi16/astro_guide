import 'package:astro_guide/models/package/PackageListModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/repositories/PackageRepository.dart';

class PackageProvider {
  final PackageRepository packageRepository;

  PackageProvider(this.packageRepository);

  Future<PackageListModel> fetch(String token, String endpoint) async {
    var packageListResponse = await packageRepository.fetch(token, endpoint);

    return PackageListModel.fromJson(packageListResponse);
  }

}
