import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/domain/repositories/repositories.dart';

@lazySingleton
class AppUseCase {
  final AppRepository appRepository;

  AppUseCase({required this.appRepository});

  String getTheme() => appRepository.getAppTheme();

  void changeTheme(mode) {
    if (mode == ThemeMode.light) {
      appRepository.changeAppTheme(appThemeLight);
    } else {
      appRepository.changeAppTheme(appThemeDark);
    }
  }
}
