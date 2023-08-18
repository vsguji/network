/*
 * @Author: your name
 * @Date: 2023-02-15 11:29:59
 * @LastEditTime: 2023-08-18 10:40:04
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:network/api/api_provider.dart';
import 'package:network/services/storage.dart';
import 'package:network/values/storage_value.dart';

class ApiRepository {
  ApiRepository({required this.api});
  final ApiProvider api;

  String get _token =>
      StorageService.instance.getString(StorageValue.userToken) ?? '';

  void dispose() {
    api.dispose();
  }
}
