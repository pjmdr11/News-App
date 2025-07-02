import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

part 'user.g.dart';

@Order(0)
@lazySingleton
@HiveType(typeId: 1, adapterName: "UserAdapter")
class UserDb extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String name;

  UserDb(
      {required this.email,
      required this.password,
      required this.id,
      required this.name});
}
