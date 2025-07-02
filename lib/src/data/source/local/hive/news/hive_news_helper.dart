import 'package:kliq_technical_test/src/data/source/local/hive/news/news.dart';

abstract class HiveNewsHelper {
  bool bookMarkNews(NewsDb news);
  bool isNewsBookMarked(String id);

  bool removeBookMark(String id);
  bool deleteAllNews();

  NewsDb? getBookMarkById(String id);

  List<NewsDb> getAllBookMarkedNews();
}
