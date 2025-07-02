import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';

part 'news.g.dart';

@Order(0)
@HiveType(typeId: 2, adapterName: "NewsAdapter")
class NewsDb extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? articleId;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final String? link;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? pubDate;

  NewsDb(
      {this.title,
      this.articleId,
      this.imageUrl,
      this.link,
      this.description,
      this.pubDate});

  NewsItemModel modelFromDb() {
    return NewsItemModel(
        articleId: articleId,
        title: title,
        description: description,
        imageUrl: imageUrl,
        link: link,
        pubDate: pubDate);
  }
}
