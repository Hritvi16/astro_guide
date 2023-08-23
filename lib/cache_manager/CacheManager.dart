import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

class CacheManager {
  static checkKey({
    required dynamic key,
    required dynamic actionIfNull,
    required dynamic actionIfNotNull}) {

    bool cacheData = storage.hasData(key);
    if(cacheData) {
      actionIfNotNull();
    }
    else {
      actionIfNull();
    }
  }

  static readCache({
    required dynamic key
  }) {
    return storage.read(key);
  }

  static writeCache({
    required dynamic key,
    required dynamic value
  }) {
    storage.write(key, value);
  }

  static deleteKeys() {
    List<String> keys = storage.getKeys().toList();

    for (var element in keys) {
      if(element.startsWith("cache")) {
        storage.remove(element);
      }
    }
  }

  static deleteAllKeys() {
    List<String> keys = storage.getKeys().toList();

    for (var element in keys) {
      storage.remove(element);
    }
  }
}