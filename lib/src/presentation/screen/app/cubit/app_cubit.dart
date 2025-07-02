import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/domain/usecases/use_cases.dart';

part 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final AppUseCase appUseCase;

  AppCubit({required this.appUseCase}) : super(AppInitial()) {
    init();
  }

  void init() {
    switch (appUseCase.getTheme()) {
      case appThemeLight:
        emit(state.copyWith(theme: ThemeMode.light));
        break;
      case appThemeDark:
        emit(state.copyWith(theme: ThemeMode.dark));
        break;
    }
  }

  void changeTheme(ThemeMode mode) {
    appUseCase.changeTheme(mode);
    init();
  }
}
