import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/domain/usecases/user_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  GlobalKey<FormState>? formKey;
  final UserUseCase userUseCase;
  LoginCubit({required this.userUseCase}) : super(LoginInitial());

  void setFormkey(key) {
    formKey = key;
  }

  void onEmailChanged(String value) {
    emit(state.copyWith(email: value, state: null));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(password: value, state: null));
  }

  void loginUser() async {
    if (formKey?.currentState?.validate() ?? false) {
      emit(state.copyWith(isLoading: true, state: null));
      var results =
          await userUseCase.loginUser(state.email ?? "", state.password ?? "");
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(state: results, isLoading: false));
    }
  }
}
