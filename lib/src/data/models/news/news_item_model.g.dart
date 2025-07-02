// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsItemModelImpl _$$NewsItemModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsItemModelImpl(
      articleId: json['article_id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      keywords: json['keywords'],
      creator: json['creator'],
      videoUrl: json['videoUrl'],
      description: json['description'] as String?,
      content: json['content'] as String?,
      pubDate: json['pubDate'] as String?,
      sourceId: json['sourceId'] as String?,
      imageUrl: json['image_url'] as String? ?? "",
      sourcePriority: (json['sourcePriority'] as num?)?.toInt(),
      sourceUrl: json['source_icon'] as String? ?? "",
      sourceIcon: json['sourceIcon'],
      language: json['language'] as String?,
      country:
          (json['country'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      aiTag: json['aiTag'] as String?,
      sentiment: json['sentiment'] as String?,
      sentimentStats: json['sentimentStats'] as String?,
      aiRegion: json['aiRegion'] as String?,
      aiOrg: json['aiOrg'] as String?,
    );

Map<String, dynamic> _$$NewsItemModelImplToJson(_$NewsItemModelImpl instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'title': instance.title,
      'link': instance.link,
      'keywords': instance.keywords,
      'creator': instance.creator,
      'videoUrl': instance.videoUrl,
      'description': instance.description,
      'content': instance.content,
      'pubDate': instance.pubDate,
      'sourceId': instance.sourceId,
      'image_url': instance.imageUrl,
      'sourcePriority': instance.sourcePriority,
      'source_icon': instance.sourceUrl,
      'sourceIcon': instance.sourceIcon,
      'language': instance.language,
      'country': instance.country,
      'category': instance.category,
      'aiTag': instance.aiTag,
      'sentiment': instance.sentiment,
      'sentimentStats': instance.sentimentStats,
      'aiRegion': instance.aiRegion,
      'aiOrg': instance.aiOrg,
    };
