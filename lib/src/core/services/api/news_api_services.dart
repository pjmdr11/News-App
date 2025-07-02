import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/data/source/local/env_helper.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_services.g.dart';

@lazySingleton
@RestApi(
  baseUrl: "https://newsdata.io/api/1/",
)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;
  @factoryMethod
  static NewsApiService create() {
    Dio dio = getIt();
    EnvHelper envHelper = getIt();
    return NewsApiService(dio, baseUrl: envHelper.getEnvData(envBaseApi));
  }

  @GET(latestNewsEndpoint)
  Future<NewsResponseModel> fetchLatestNews(
      @Path("key") String key, @Queries() Map<String, dynamic> params);
}
