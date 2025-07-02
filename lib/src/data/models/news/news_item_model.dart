import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kliq_technical_test/src/domain/entities/entities.dart';

part 'news_item_model.freezed.dart';
part 'news_item_model.g.dart';

@unfreezed
class NewsItemModel extends NewsItem with _$NewsItemModel {
  factory NewsItemModel({
    @JsonKey(name: "article_id") String? articleId,
    String? title,
    String? link,
    dynamic keywords,
    dynamic creator,
    dynamic videoUrl,
    String? description,
    String? content,
    String? pubDate,
    String? sourceId,
    @Default("") @JsonKey(name: "image_url") String? imageUrl,
    int? sourcePriority,
    @Default("") @JsonKey(name: "source_icon") String? sourceUrl,
    dynamic sourceIcon,
    String? language,
    List<String>? country,
    List<String>? category,
    String? aiTag,
    String? sentiment,
    String? sentimentStats,
    String? aiRegion,
    String? aiOrg,
  }) = _NewsItemModel;

  factory NewsItemModel.fromJson(Map<String, dynamic> json) =>
      _$NewsItemModelFromJson(json);
}
