/*
 * @Author: your name
 * @Date: 2022-11-23 15:31:39
 * @LastEditTime: 2023-02-22 16:36:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 存储服务
class StorageService extends GetxService {
  static StorageService get instance => Get.find();

  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setJson(String key, dynamic jasonVal) {
    String jsonString = jsonEncode(jasonVal);
    return _prefs.setString(key, jsonString);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  dynamic getJSON(String key) {
    String? jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }
}
