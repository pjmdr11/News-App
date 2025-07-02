import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/news/hive_news_helper.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/news/news.dart';
import 'package:kliq_technical_test/src/domain/repositories/repositories.dart';

@LazySingleton()
class NewsUseCase {
  final NewsRepository newsRepository;
  final HiveNewsHelper newsDbHelper;

  NewsUseCase({required this.newsRepository, required this.newsDbHelper});

  Future<DataState<NewsResponseModel>> getLatestNews({String? page}) {
    return newsRepository.fetchLatestNews(page: page);
  }

  bool isBookMarked(String id) {
    return newsDbHelper.isNewsBookMarked(id);
  }

  bool deleteAll() {
    return newsDbHelper.deleteAllNews();
  }

  List<NewsItemModel> getAllBookmarkedNews() {
    List<NewsDb> db = newsDbHelper.getAllBookMarkedNews();
    List<NewsItemModel> bookmarked = [];
    db.forEach((item) {
      bookmarked.add(item.modelFromDb());
    });
    return bookmarked;
  }

  bool bookMarkNews(NewsItemModel newsItem) {
    if (isBookMarked(newsItem.articleId ?? "")) {
      return removeFromBookMark(newsItem);
    } else {
      return newsDbHelper.bookMarkNews(NewsDb(
        articleId: newsItem.articleId,
        description: newsItem.description,
        imageUrl: newsItem.imageUrl,
        link: newsItem.link,
        title: newsItem.title,
        pubDate: newsItem.pubDate ?? "",
      ));
    }
  }

  bool removeFromBookMark(NewsItemModel newsItem) {
    return newsDbHelper.removeBookMark(newsItem.articleId ?? "");
  }
}
