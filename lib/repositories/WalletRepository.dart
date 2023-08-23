import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class WalletRepository {
  final ApiService apiService;

  WalletRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var countries = await apiService.get(endpoint: ApiConstants.walletAPI+endpoint, token: token);
    return countries;
  }

  Future<JSON> transaction(Map<String, dynamic> data, String endpoint, String token) async {
    var response = await apiService.post(endpoint: ApiConstants.walletAPI+endpoint, body: data, token: token);
    return response;
  }

}
