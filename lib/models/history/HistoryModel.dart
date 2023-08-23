import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/models/wallet/WalletHistoryModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide/models/banner/BannerModel.dart';

part 'HistoryModel.freezed.dart';
part 'HistoryModel.g.dart';


@freezed
class HistoryModel with _$HistoryModel {
  factory HistoryModel({
    required String status,
    required int code,
    required String message,
    double? amount,
    List<WalletHistoryModel>? wallet,
    List<WalletHistoryModel>? payment,
    List<SessionHistoryModel>? call,
    List<SessionHistoryModel>? chat,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(JSON json) => _$HistoryModelFromJson(json);
}

