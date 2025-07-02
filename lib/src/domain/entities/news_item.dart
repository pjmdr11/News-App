class NewsItem {
  final String? articleId;
  final String? title;
  final String? link;
  final dynamic keywords;
  final dynamic creator;
  final dynamic videoUrl;
  final String? description;
  final String? content;
  final String? pubDate;
  final String? imageUrl;
  final String? sourceId;
  final int? sourcePriority;
  final String? sourceUrl;
  final dynamic sourceIcon;
  final String? language;
  final List<String>? country;
  final List<String>? category;
  final String? aiTag;
  final String? sentiment;
  final String? sentimentStats;
  final String? aiRegion;
  final String? aiOrg;

  NewsItem({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
  });
}
