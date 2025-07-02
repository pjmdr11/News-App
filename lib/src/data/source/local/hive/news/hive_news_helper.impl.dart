import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/news/hive_news_helper.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/news/news.dart';

@LazySingleton(as: HiveNewsHelper)
class HiveNewsHelperImpl extends HiveNewsHelper {
  final Box<NewsDb> newsBox;
  HiveNewsHelperImpl({@Named(hiveBoxNews) required this.newsBox});

  @override
  bool bookMarkNews(NewsDb news) {
    try {
      newsBox.add(news);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  bool deleteAllNews() {
    try {
      newsBox.values.forEach((value) => value.delete());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  List<NewsDb> getAllBookMarkedNews() {
    return newsBox.values.toList();
  }

  @override
  NewsDb? getBookMarkById(String id) {
    try {
      var newsItem =
          newsBox.values.where((item) => item.articleId == id).toList().first;
      return newsItem;
    } catch (e) {
      return null;
    }
  }

  @override
  bool isNewsBookMarked(String id) {
    try {
      return getBookMarkById(id) != null;
    } catch (e) {
      return false;
    }
  }

  @override
  bool removeBookMark(String id) {
    try {
      NewsDb? newsDbItem = getBookMarkById(id);
      newsDbItem?.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
