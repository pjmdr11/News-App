import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/default/hive_helper.dart';

@LazySingleton(as: HiveHelper)
class HiveHelperImpl extends HiveHelper {
  final Box hive;

  HiveHelperImpl({@Named(hiveDefaultBox) required this.hive});

  @override
  bool clearTempData() {
    return false;
  }

  @override
  delete(String key) {
    //test
    hive.delete(key);
  }

  @override
  getData(String key, {def = ""}) {
    try {
      return hive.get(key) ?? def;
    } catch (e) {
      return def;
    }
  }

  @override
  bool setData(String key, value) {
    try {
      hive.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
