import 'package:get_storage/get_storage.dart';


class CacheStorageService {
  static late GetStorage instance;
  static init() async {
    await GetStorage.init();
    instance = GetStorage();
  }

  static write({required String key, required dynamic value}) async {
    await instance.write(key, value);
  }

  static read({required String key}) async {
    return instance.read(key);
  }

  static clear() async {
    await instance.erase();
  }

}
