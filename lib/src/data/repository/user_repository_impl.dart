import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/data/source/source.dart';
import 'package:kliq_technical_test/src/domain/repositories/repositories.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final HiveUserHelper hiveUserDb;
  final HiveHelper hiveDb;

  UserRepositoryImpl({required this.hiveUserDb, required this.hiveDb});

  @override
  UserDb? getSessionDetails() {
    String sessionId = hiveDb.getData(hiveKeySession, def: "");
    return hiveUserDb.getUserById(sessionId);
  }

  @override
  bool logOutUser() {
    try {
      hiveDb.delete(hiveKeySession);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  DataState<UserDb> loginUser(String email, String password) {
    UserDb? user = getUserByEmail(email);
    if (user == null) {
      return ResultFailure(
          AppException(statusCode: 403, message: errUserNotFound));
    } else {
      if (user.password != password) {
        return ResultFailure(
            AppException(statusCode: 401, message: errInvalidEmailOrPassword));
      } else {
        hiveDb.setData(hiveKeySession, user.id);
        return ResultSuccess(user);
      }
    }
  }

  @override
  DataState<UserDb> registerUser(UserDb user) {
    try {
      final userDb = getUserByEmail(user.email);
      if (userDb != null) {
        return ResultFailure(
            AppException(statusCode: 403, message: errUserAlreadyExists));
      }
      hiveUserDb.setUser(user);
      hiveDb.setData(hiveKeySession, user.id);
      return ResultSuccess(user);
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }

  @override
  UserDb? getUserByEmail(String email) {
    return hiveUserDb.getUserByEmail(email);
  }
}
