import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/core/services/api/news_api_services.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/data/source/local/env_helper.dart';
import 'package:kliq_technical_test/src/domain/repositories/news_repository.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl extends BaseApiResponseModel
    implements NewsRepository {
  final NewsApiService newsApiService;
  final EnvHelper envHelper;

  NewsRepositoryImpl({required this.newsApiService, required this.envHelper});

  @override
  void bookMarkNews() {}

  @override
  void deleteAllBookMarks() {}

  @override
  Future<DataState<NewsResponseModel>> fetchLatestNews({String? page}) {
    var serviceCall;
    if (page?.isNotEmpty ?? false) {
      serviceCall = newsApiService
          .fetchLatestNews(envHelper.getEnvData(envApiKey), {"page": page});
    } else {
      serviceCall =
          newsApiService.fetchLatestNews(envHelper.getEnvData(envApiKey), {});
    }
    return getStateOf<NewsResponseModel>(request: () => serviceCall);
  }

  @override
  void removeBookmark() {}
}
