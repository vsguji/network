/*
 * @Author: your name
 * @Date: 2023-02-09 10:52:36
 * @LastEditTime: 2023-02-09 21:48:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:get_storage/get_storage.dart';

class StoreUtils {
  static final box = GetStorage();

  static Future<bool> init() async {
    return GetStorage.init();
  }

  static write(String key, dynamic value) async {
    await box.write(key, value);
  }

  static T? read<T>(String key) {
    return box.read<T>(key);
  }

  static Future<void> remove(String key) async {
    await box.remove(key);
  }
  
  static Future<void> removeAll() async {
    await box.erase();
  }
}
