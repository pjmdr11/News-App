import 'package:kliq_technical_test/src/data/source/local/hive/users/user.dart';

abstract class HiveUserHelper {
  bool setUser(UserDb user);
  UserDb? getUserById(String userId);

  UserDb? getUserByEmail(String email);
}
