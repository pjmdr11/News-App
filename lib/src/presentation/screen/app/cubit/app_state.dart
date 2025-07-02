part of 'app_cubit.dart';

class AppState extends Equatable {
  final ThemeMode? appTheme;

  const AppState({this.appTheme});

  AppState copyWith({
    ThemeMode? theme,
  }) {
    return AppState(
      appTheme: theme ?? appTheme,
    );
  }

  @override
  List<Object?> get props => [appTheme];
}

final class AppInitial extends AppState {}
