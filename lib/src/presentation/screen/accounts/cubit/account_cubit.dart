import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/users/user.dart';
import 'package:kliq_technical_test/src/domain/usecases/use_cases.dart';

part 'account_state.dart';

@lazySingleton
class AccountCubit extends Cubit<AccountState> {
  UserUseCase userUseCase;
  NewsUseCase newUseCase;
  AccountCubit({required this.userUseCase, required this.newUseCase})
      : super(AccountInitial());

  getAccountDetails() async {
    emit(state.copyWith(loading: true));
    DataState<UserDb> user = userUseCase.getSession();
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(loading: false, user: user));
  }

  void logoutUser() async {
    userUseCase.logOutUser();
    newUseCase.deleteAll();
  }
}
