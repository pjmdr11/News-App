part of 'news_cubit.dart';

class NewsState extends Equatable {
  bool? isLoading;
  bool? isPaginating;
  DataState<NewsResponseModel>? state;

  NewsState copyWith(
      {bool? loading, DataState<NewsResponseModel>? state, bool? paginating}) {
    return NewsState(
        isLoading: loading ?? isLoading,
        state: (paginating ?? false) ? state ?? this.state : state,
        isPaginating: paginating ?? isPaginating);
  }

  NewsState({this.isLoading, this.state, this.isPaginating});

  @override
  List<Object> get props => [isLoading ?? false, isPaginating ?? false];
}

class NewsInitial extends NewsState {}
