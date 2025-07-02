import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';

abstract class NewsRepository {
  Future<DataState<NewsResponseModel>> fetchLatestNews({String? page});

  void bookMarkNews();

  void removeBookmark();

  void deleteAllBookMarks();
}
