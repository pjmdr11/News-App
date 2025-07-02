abstract class HiveHelper {
  bool setData(String key, dynamic value);
  dynamic getData(String key, {dynamic def = ""});
  dynamic delete(String key);
  bool clearTempData();
}
