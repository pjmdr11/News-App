import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/domain/usecases/use_cases.dart';

part 'favourites_state.dart';

@lazySingleton
class FavouritesCubit extends Cubit<FavouritesState> {
  NewsUseCase newsUseCase;
  FavouritesCubit({required this.newsUseCase}) : super(FavouritesState());

  void fetchAllBookMarked({delay = true}) async {
    emit(state.copyWith(loading: true));
    List<NewsItemModel> news = newsUseCase.getAllBookmarkedNews();
    if (delay) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    emit(state.copyWith(loading: false, items: news));
  }
}
