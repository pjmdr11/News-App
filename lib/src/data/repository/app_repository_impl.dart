import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/default/hive_helper.dart';
import 'package:kliq_technical_test/src/domain/repositories/app_repository.dart';

@Singleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final HiveHelper hiveHelper;

  AppRepositoryImpl({required this.hiveHelper});

  @override
  String getAppTheme() {
    return hiveHelper.getData(hiveKeyTheme, def: "");
  }

  @override
  void changeAppTheme(String theme) {
    hiveHelper.setData(hiveKeyTheme, theme);
  }
}
