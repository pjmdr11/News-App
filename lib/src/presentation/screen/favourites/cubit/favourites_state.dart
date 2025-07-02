part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  bool? isLoading;
  List<NewsItemModel>? news;

  FavouritesState({this.isLoading, this.news});

  FavouritesState copyWith({bool? loading, List<NewsItemModel>? items}) {
    return FavouritesState(
        isLoading: loading ?? isLoading, news: items ?? news);
  }

  @override
  List<Object> get props => [isLoading ?? false, news ?? []];
}
