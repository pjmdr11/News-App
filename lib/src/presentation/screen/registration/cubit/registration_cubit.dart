import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/domain/usecases/user_use_case.dart';

part 'registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  final UserUseCase userUseCase;
  GlobalKey<FormState>? formState;
  RegistrationCubit({required this.userUseCase}) : super(RegistrationState());

  void setFormState(key) {
    formState = key;
  }

  void onNameChanged(String fullName) {
    emit(state.copyWith(fullName: fullName));
  }

  void onEmailChanged(String value) {
    emit(state.copyWith(email: value, state: null));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(password: value, state: null));
  }

  void registerUser() async {
    if (formState?.currentState?.validate() ?? false) {
      emit(state.copyWith(isLoading: true, state: null));
      var results = userUseCase.registerUser(
          state.fullName ?? "", state.email ?? "", state.password ?? "");
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(state: results, isLoading: false));
    }
  }
}
