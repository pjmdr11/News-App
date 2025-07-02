import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/news/news.dart';

import '../../data/source/source.dart';
import '../constants/constants.dart';

@module
abstract class HiveModule {
  @Named(hiveDefaultBox)
  @singleton
  Future<Box> hive() {
    return Hive.openBox(hiveDefaultBox);
  }

  @Named(hiveBoxUsers)
  @singleton
  Future<Box<UserDb>> hiveUser() {
    return Hive.openBox(hiveBoxUsers);
  }

  @Named(hiveBoxNews)
  @singleton
  Future<Box<NewsDb>> hiveNews() {
    return Hive.openBox(hiveBoxNews);
  }
}
