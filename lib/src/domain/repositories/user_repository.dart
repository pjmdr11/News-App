import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/data/source/source.dart';

abstract class UserRepository {
  UserDb? getSessionDetails();

  UserDb? getUserByEmail(String email);
  DataState<UserDb> loginUser(String username, String password);

  DataState<UserDb> registerUser(UserDb user);

  bool logOutUser();
}
