import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/users/hive_user_helper.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/users/user.dart';

@LazySingleton(as: HiveUserHelper)
class HiveUserHelperImpl extends HiveUserHelper {
  final Box<UserDb> userBox;
  HiveUserHelperImpl({@Named(hiveBoxUsers) required this.userBox});

  @override
  bool setUser(UserDb user) {
    try {
      userBox.add(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  UserDb? getUserById(String userId) {
    try {
      UserDb user = userBox.values
          .where((userItem) => userItem.id == userId)
          .toList()
          .first;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  UserDb? getUserByEmail(String email) {
    try {
      List<UserDb> users =
          userBox.values.where((userItem) => userItem.email == email).toList();
      if (users.isNotEmpty) {
        return users.first;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
