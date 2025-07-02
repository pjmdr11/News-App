import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/core/constants/error_constants.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/models/app_exception_model.dart';
import 'package:kliq_technical_test/src/data/source/source.dart';
import 'package:kliq_technical_test/src/domain/repositories/repositories.dart';
import 'package:kliq_technical_test/src/domain/repositories/user_repository.dart';

@LazySingleton()
class UserUseCase {
  final UserRepository userRepo;

  UserUseCase({required this.userRepo});

  DataState<UserDb> getSession() {
    var user = userRepo.getSessionDetails();
    if (user == null) {
      return ResultFailure(
          AppException(statusCode: 401, message: errUnAuthorized));
    } else {
      return ResultSuccess(user);
    }
  }

  DataState<bool> logOutUser() {
    var result = userRepo.logOutUser();
    if (result) {
      return ResultSuccess(result);
    } else {
      return ResultFailure(AppException(message: taskCompletionFailed));
    }
  }

  Future<DataState<UserDb?>> loginUser(String email, String password) async {
    return userRepo.loginUser(email, password);
  }

  DataState<UserDb?> registerUser(String name, String email, String password) {
    String userId = "${name.substring(0, 4)}-${DateTime.timestamp()}}";
    UserDb user =
        UserDb(email: email, name: name, password: password, id: userId);
    return userRepo.registerUser(user);
  }
}
