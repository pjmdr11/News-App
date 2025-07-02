part of 'splashcreen_cubit.dart';

sealed class SplashcreenState {}

final class SplashcreenInitial extends SplashcreenState {}

final class SplashCompleted extends SplashcreenState {
  final bool sessionAvailable;
  final UserDb? userDetails;
  final String route;

  SplashCompleted(
      {required this.sessionAvailable, required this.route, this.userDetails});
}
