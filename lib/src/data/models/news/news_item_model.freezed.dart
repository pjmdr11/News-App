// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsItemModel _$NewsItemModelFromJson(Map<String, dynamic> json) {
  return _NewsItemModel.fromJson(json);
}

/// @nodoc
mixin _$NewsItemModel {
  @JsonKey(name: "article_id")
  String? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: "article_id")
  set articleId(String? value) => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  set link(String? value) => throw _privateConstructorUsedError;
  dynamic get keywords => throw _privateConstructorUsedError;
  set keywords(dynamic value) => throw _privateConstructorUsedError;
  dynamic get creator => throw _privateConstructorUsedError;
  set creator(dynamic value) => throw _privateConstructorUsedError;
  dynamic get videoUrl => throw _privateConstructorUsedError;
  set videoUrl(dynamic value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  set content(String? value) => throw _privateConstructorUsedError;
  String? get pubDate => throw _privateConstructorUsedError;
  set pubDate(String? value) => throw _privateConstructorUsedError;
  String? get sourceId => throw _privateConstructorUsedError;
  set sourceId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  set imageUrl(String? value) => throw _privateConstructorUsedError;
  int? get sourcePriority => throw _privateConstructorUsedError;
  set sourcePriority(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "source_icon")
  String? get sourceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "source_icon")
  set sourceUrl(String? value) => throw _privateConstructorUsedError;
  dynamic get sourceIcon => throw _privateConstructorUsedError;
  set sourceIcon(dynamic value) => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  set language(String? value) => throw _privateConstructorUsedError;
  List<String>? get country => throw _privateConstructorUsedError;
  set country(List<String>? value) => throw _privateConstructorUsedError;
  List<String>? get category => throw _privateConstructorUsedError;
  set category(List<String>? value) => throw _privateConstructorUsedError;
  String? get aiTag => throw _privateConstructorUsedError;
  set aiTag(String? value) => throw _privateConstructorUsedError;
  String? get sentiment => throw _privateConstructorUsedError;
  set sentiment(String? value) => throw _privateConstructorUsedError;
  String? get sentimentStats => throw _privateConstructorUsedError;
  set sentimentStats(String? value) => throw _privateConstructorUsedError;
  String? get aiRegion => throw _privateConstructorUsedError;
  set aiRegion(String? value) => throw _privateConstructorUsedError;
  String? get aiOrg => throw _privateConstructorUsedError;
  set aiOrg(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsItemModelCopyWith<NewsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsItemModelCopyWith<$Res> {
  factory $NewsItemModelCopyWith(
          NewsItemModel value, $Res Function(NewsItemModel) then) =
      _$NewsItemModelCopyWithImpl<$Res, NewsItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "article_id") String? articleId,
      String? title,
      String? link,
      dynamic keywords,
      dynamic creator,
      dynamic videoUrl,
      String? description,
      String? content,
      String? pubDate,
      String? sourceId,
      @JsonKey(name: "image_url") String? imageUrl,
      int? sourcePriority,
      @JsonKey(name: "source_icon") String? sourceUrl,
      dynamic sourceIcon,
      String? language,
      List<String>? country,
      List<String>? category,
      String? aiTag,
      String? sentiment,
      String? sentimentStats,
      String? aiRegion,
      String? aiOrg});
}

/// @nodoc
class _$NewsItemModelCopyWithImpl<$Res, $Val extends NewsItemModel>
    implements $NewsItemModelCopyWith<$Res> {
  _$NewsItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? keywords = freezed,
    Object? creator = freezed,
    Object? videoUrl = freezed,
    Object? description = freezed,
    Object? content = freezed,
    Object? pubDate = freezed,
    Object? sourceId = freezed,
    Object? imageUrl = freezed,
    Object? sourcePriority = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? language = freezed,
    Object? country = freezed,
    Object? category = freezed,
    Object? aiTag = freezed,
    Object? sentiment = freezed,
    Object? sentimentStats = freezed,
    Object? aiRegion = freezed,
    Object? aiOrg = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as dynamic,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDate: freezed == pubDate
          ? _value.pubDate
          : pubDate // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIcon: freezed == sourceIcon
          ? _value.sourceIcon
          : sourceIcon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      aiTag: freezed == aiTag
          ? _value.aiTag
          : aiTag // ignore: cast_nullable_to_non_nullable
              as String?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      sentimentStats: freezed == sentimentStats
          ? _value.sentimentStats
          : sentimentStats // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRegion: freezed == aiRegion
          ? _value.aiRegion
          : aiRegion // ignore: cast_nullable_to_non_nullable
              as String?,
      aiOrg: freezed == aiOrg
          ? _value.aiOrg
          : aiOrg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsItemModelImplCopyWith<$Res>
    implements $NewsItemModelCopyWith<$Res> {
  factory _$$NewsItemModelImplCopyWith(
          _$NewsItemModelImpl value, $Res Function(_$NewsItemModelImpl) then) =
      __$$NewsItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "article_id") String? articleId,
      String? title,
      String? link,
      dynamic keywords,
      dynamic creator,
      dynamic videoUrl,
      String? description,
      String? content,
      String? pubDate,
      String? sourceId,
      @JsonKey(name: "image_url") String? imageUrl,
      int? sourcePriority,
      @JsonKey(name: "source_icon") String? sourceUrl,
      dynamic sourceIcon,
      String? language,
      List<String>? country,
      List<String>? category,
      String? aiTag,
      String? sentiment,
      String? sentimentStats,
      String? aiRegion,
      String? aiOrg});
}

/// @nodoc
class __$$NewsItemModelImplCopyWithImpl<$Res>
    extends _$NewsItemModelCopyWithImpl<$Res, _$NewsItemModelImpl>
    implements _$$NewsItemModelImplCopyWith<$Res> {
  __$$NewsItemModelImplCopyWithImpl(
      _$NewsItemModelImpl _value, $Res Function(_$NewsItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? keywords = freezed,
    Object? creator = freezed,
    Object? videoUrl = freezed,
    Object? description = freezed,
    Object? content = freezed,
    Object? pubDate = freezed,
    Object? sourceId = freezed,
    Object? imageUrl = freezed,
    Object? sourcePriority = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? language = freezed,
    Object? country = freezed,
    Object? category = freezed,
    Object? aiTag = freezed,
    Object? sentiment = freezed,
    Object? sentimentStats = freezed,
    Object? aiRegion = freezed,
    Object? aiOrg = freezed,
  }) {
    return _then(_$NewsItemModelImpl(
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as dynamic,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDate: freezed == pubDate
          ? _value.pubDate
          : pubDate // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIcon: freezed == sourceIcon
          ? _value.sourceIcon
          : sourceIcon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      aiTag: freezed == aiTag
          ? _value.aiTag
          : aiTag // ignore: cast_nullable_to_non_nullable
              as String?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      sentimentStats: freezed == sentimentStats
          ? _value.sentimentStats
          : sentimentStats // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRegion: freezed == aiRegion
          ? _value.aiRegion
          : aiRegion // ignore: cast_nullable_to_non_nullable
              as String?,
      aiOrg: freezed == aiOrg
          ? _value.aiOrg
          : aiOrg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsItemModelImpl
    with DiagnosticableTreeMixin
    implements _NewsItemModel {
  _$NewsItemModelImpl(
      {@JsonKey(name: "article_id") this.articleId,
      this.title,
      this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      this.description,
      this.content,
      this.pubDate,
      this.sourceId,
      @JsonKey(name: "image_url") this.imageUrl = "",
      this.sourcePriority,
      @JsonKey(name: "source_icon") this.sourceUrl = "",
      this.sourceIcon,
      this.language,
      this.country,
      this.category,
      this.aiTag,
      this.sentiment,
      this.sentimentStats,
      this.aiRegion,
      this.aiOrg});

  factory _$NewsItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsItemModelImplFromJson(json);

  @override
  @JsonKey(name: "article_id")
  String? articleId;
  @override
  String? title;
  @override
  String? link;
  @override
  dynamic keywords;
  @override
  dynamic creator;
  @override
  dynamic videoUrl;
  @override
  String? description;
  @override
  String? content;
  @override
  String? pubDate;
  @override
  String? sourceId;
  @override
  @JsonKey(name: "image_url")
  String? imageUrl;
  @override
  int? sourcePriority;
  @override
  @JsonKey(name: "source_icon")
  String? sourceUrl;
  @override
  dynamic sourceIcon;
  @override
  String? language;
  @override
  List<String>? country;
  @override
  List<String>? category;
  @override
  String? aiTag;
  @override
  String? sentiment;
  @override
  String? sentimentStats;
  @override
  String? aiRegion;
  @override
  String? aiOrg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsItemModel(articleId: $articleId, title: $title, link: $link, keywords: $keywords, creator: $creator, videoUrl: $videoUrl, description: $description, content: $content, pubDate: $pubDate, sourceId: $sourceId, imageUrl: $imageUrl, sourcePriority: $sourcePriority, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, language: $language, country: $country, category: $category, aiTag: $aiTag, sentiment: $sentiment, sentimentStats: $sentimentStats, aiRegion: $aiRegion, aiOrg: $aiOrg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewsItemModel'))
      ..add(DiagnosticsProperty('articleId', articleId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('keywords', keywords))
      ..add(DiagnosticsProperty('creator', creator))
      ..add(DiagnosticsProperty('videoUrl', videoUrl))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('pubDate', pubDate))
      ..add(DiagnosticsProperty('sourceId', sourceId))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('sourcePriority', sourcePriority))
      ..add(DiagnosticsProperty('sourceUrl', sourceUrl))
      ..add(DiagnosticsProperty('sourceIcon', sourceIcon))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('aiTag', aiTag))
      ..add(DiagnosticsProperty('sentiment', sentiment))
      ..add(DiagnosticsProperty('sentimentStats', sentimentStats))
      ..add(DiagnosticsProperty('aiRegion', aiRegion))
      ..add(DiagnosticsProperty('aiOrg', aiOrg));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsItemModelImplCopyWith<_$NewsItemModelImpl> get copyWith =>
      __$$NewsItemModelImplCopyWithImpl<_$NewsItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsItemModelImplToJson(
      this,
    );
  }
}

abstract class _NewsItemModel implements NewsItemModel {
  factory _NewsItemModel(
      {@JsonKey(name: "article_id") String? articleId,
      String? title,
      String? link,
      dynamic keywords,
      dynamic creator,
      dynamic videoUrl,
      String? description,
      String? content,
      String? pubDate,
      String? sourceId,
      @JsonKey(name: "image_url") String? imageUrl,
      int? sourcePriority,
      @JsonKey(name: "source_icon") String? sourceUrl,
      dynamic sourceIcon,
      String? language,
      List<String>? country,
      List<String>? category,
      String? aiTag,
      String? sentiment,
      String? sentimentStats,
      String? aiRegion,
      String? aiOrg}) = _$NewsItemModelImpl;

  factory _NewsItemModel.fromJson(Map<String, dynamic> json) =
      _$NewsItemModelImpl.fromJson;

  @override
  @JsonKey(name: "article_id")
  String? get articleId;
  @JsonKey(name: "article_id")
  set articleId(String? value);
  @override
  String? get title;
  set title(String? value);
  @override
  String? get link;
  set link(String? value);
  @override
  dynamic get keywords;
  set keywords(dynamic value);
  @override
  dynamic get creator;
  set creator(dynamic value);
  @override
  dynamic get videoUrl;
  set videoUrl(dynamic value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get content;
  set content(String? value);
  @override
  String? get pubDate;
  set pubDate(String? value);
  @override
  String? get sourceId;
  set sourceId(String? value);
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @JsonKey(name: "image_url")
  set imageUrl(String? value);
  @override
  int? get sourcePriority;
  set sourcePriority(int? value);
  @override
  @JsonKey(name: "source_icon")
  String? get sourceUrl;
  @JsonKey(name: "source_icon")
  set sourceUrl(String? value);
  @override
  dynamic get sourceIcon;
  set sourceIcon(dynamic value);
  @override
  String? get language;
  set language(String? value);
  @override
  List<String>? get country;
  set country(List<String>? value);
  @override
  List<String>? get category;
  set category(List<String>? value);
  @override
  String? get aiTag;
  set aiTag(String? value);
  @override
  String? get sentiment;
  set sentiment(String? value);
  @override
  String? get sentimentStats;
  set sentimentStats(String? value);
  @override
  String? get aiRegion;
  set aiRegion(String? value);
  @override
  String? get aiOrg;
  set aiOrg(String? value);
  @override
  @JsonKey(ignore: true)
  _$$NewsItemModelImplCopyWith<_$NewsItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
