import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/core/route/route_constants.dart';
import 'package:kliq_technical_test/src/data/source/source.dart';
import 'package:kliq_technical_test/src/domain/usecases/user_use_case.dart';

part 'splashcreen_state.dart';

@injectable
class SplashcreenCubit extends Cubit<SplashcreenState> {
  final UserUseCase userUseCase;

  SplashcreenCubit({required this.userUseCase}) : super(SplashcreenInitial()) {
    initialize();
  }

  void initialize() async {
    var result = userUseCase.getSession();
    await Future.delayed(const Duration(milliseconds: 500));
    var route = routeHomepage;
    bool sessionAvailable = false;
    UserDb? user;
    if (result is ResultSuccess) {
      sessionAvailable = true;
    }
    emit(SplashCompleted(
        sessionAvailable: sessionAvailable, route: route, userDetails: user));
  }
}
