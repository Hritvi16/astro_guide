import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class StateRepository {
  final ApiService apiService;

  StateRepository(this.apiService);

  Future<JSON> getStates(Map<String, dynamic> data, String endpoint, String token) async {
    var states = await apiService.post(endpoint: ApiConstants.stateAPI+endpoint, body: data, token: token);
    return states;
  }

}
