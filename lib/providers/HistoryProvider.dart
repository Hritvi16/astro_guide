import 'package:astro_guide/models/history/HistoryModel.dart';
import 'package:astro_guide/repositories/HistoryRepository.dart';

class HistoryProvider {
  final HistoryRepository historyRepository;

  HistoryProvider(this.historyRepository);

  Future<HistoryModel> fetch(String token, String endpoint) async {
    var historyResponse = await historyRepository.fetch(token, endpoint);

    return HistoryModel.fromJson(historyResponse);
  }
}
