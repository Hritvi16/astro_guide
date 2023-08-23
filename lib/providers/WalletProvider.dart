
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/transaction/TransactionResponseModel.dart';
import 'package:astro_guide/models/wallet/WalletResponseModel.dart';
import 'package:astro_guide/repositories/WalletRepository.dart';

class WalletProvider {
  final WalletRepository walletRepository;

  WalletProvider(this.walletRepository);

  Future<WalletResponseModel> fetch(String token, String endpoint) async {
    var walletResponseResponse = await walletRepository.fetch(token, endpoint);

    return WalletResponseModel.fromJson(walletResponseResponse);
  }

  Future<TransactionResponseModel> transaction(Map<String, dynamic> data, String endpoint, String token) async {
    var response = await walletRepository.transaction(data, endpoint, token);

    return TransactionResponseModel.fromJson(response);
  }
}
