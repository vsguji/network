/*
 * @Author: your name
 * @Date: 2023-02-15 11:29:59
 * @LastEditTime: 2023-08-18 15:04:12
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:get_net_work/api/api_provider.dart';
import 'package:get_net_work/services/storage.dart';
import 'package:get_net_work/values/storage_value.dart';

class ApiRepository {
  ApiRepository({required this.api});
  final ApiProvider api;

  String get _token =>
      StorageService.instance.getString(StorageValue.userToken) ?? '';

  void dispose() {
    api.dispose();
  }
}
