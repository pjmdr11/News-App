import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/domain/usecases/news_use_case.dart';

part 'news_state.dart';

@singleton
class NewsCubit extends Cubit<NewsState> {
  final NewsUseCase newsUseCase;
  bool? isPaginated;
  NewsCubit({required this.newsUseCase}) : super(NewsInitial());

  Future<void> fetchLatestNews({showLoader = true}) async {
    if (showLoader) {
      emit(state.copyWith(loading: true));
    }
    var response = await newsUseCase.getLatestNews();
    emit(state.copyWith(loading: false, state: response));
  }

  Future<void> fetchNextPage(String page) async {
    if (page.isEmpty) return;
    emit(state.copyWith(paginating: true, loading: false));
    var response = await newsUseCase.getLatestNews(page: page);
    if (response is ResultSuccess) {
      isPaginated = false;
      var data = state.state?.data;
      var newsLists = <NewsItemModel>[];
      newsLists.addAll((data?.results ?? []));
      newsLists.addAll(response.data?.results ?? []);
      var finalResults = data?.copyWith(
          totalResults: response.data?.totalResults ?? 0,
          nextPage: response.data?.nextPage,
          results: newsLists);
      emit(state.copyWith(
          loading: false,
          paginating: false,
          state: ResultSuccess(finalResults!)));
    }
  }

  bool isNewsBookMarked(String newsId) {
    return newsUseCase.isBookMarked(newsId);
  }

  void bookMarkNews(NewsItemModel model) {
    var listState = state.state;
    emit(state.copyWith(loading: true));
    bool result = newsUseCase.bookMarkNews(model);
    if (result) {
      emit(state.copyWith(loading: false, state: listState));
    }
  }
}
