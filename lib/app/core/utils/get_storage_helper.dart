import 'package:get_storage/get_storage.dart';

class GetStorageHelper {

  GetStorageHelper._();

  static final GetStorage _box = GetStorage();

  static dynamic get(String key) {
    return _box.read(key);
  }

  static Future<void> save({required String key, required dynamic value}) async {
    await _box.write(key, value);
  }

  static Future<void> delete(String key) async {
    await _box.remove(key);
  }

  static Future<void> deleteAll(String key) async {
    await _box.erase();
  }

  static bool hasData(String key) {
    return _box.hasData(key);
  }
}
