part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool? sessionState;
  final bool? isLoading;
  const HomeState({this.sessionState, this.isLoading});

  HomeState copyWith({bool? session, bool? loading}) {
    return HomeState(sessionState: session ?? sessionState, isLoading: loading);
  }

  @override
  List<Object> get props => [isLoading ?? false];
}
