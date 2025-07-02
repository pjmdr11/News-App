import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/domain/usecases/use_cases.dart';

part 'home_state.dart';

@LazySingleton()
class HomeCubit extends Cubit<HomeState> {
  final UserUseCase userUseCase;
  HomeCubit({required this.userUseCase}) : super(const HomeState()) {
    init();
  }

  void init() {
    emit(state.copyWith(loading: true));
    var sessionDetails = userUseCase.getSession();
    bool session = false;
    if (sessionDetails is ResultSuccess) {
      session = true;
    }
    emit(state.copyWith(session: session, loading: false));
  }
}
