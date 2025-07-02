part of 'account_cubit.dart';

class AccountState extends Equatable {
  DataState<UserDb>? userDb;
  bool? isLoading;
  AccountState({this.userDb, this.isLoading});

  AccountState copyWith({bool? loading, DataState<UserDb>? user}) {
    return AccountState(isLoading: loading ?? isLoading, userDb: user);
  }

  @override
  List<Object> get props => [isLoading ?? false];
}

final class AccountInitial extends AccountState {}
