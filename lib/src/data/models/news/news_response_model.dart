import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';

part 'news_response_model.freezed.dart';
part 'news_response_model.g.dart';

@freezed
class NewsResponseModel with _$NewsResponseModel {
  factory NewsResponseModel(
      {String? status,
      int? totalResults,
      String? nextPage,
      @unfreezed List<NewsItemModel>? results}) = _NewsResponseModel;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);
}
