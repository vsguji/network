/*
 * @Author: your name
 * @Date: 2023-02-15 11:20:10
 * @LastEditTime: 2023-03-30 17:05:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:get/get.dart';
import 'package:get_net_work/services/storage.dart';
import 'package:get_net_work/values/storage_value.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final isLoggedIn = false.obs;

  bool get isLoggedInValue => isLoggedIn.value;

  void login() {
    isLoggedIn.value = true;
    StorageService.instance.setBool(StorageValue.userOnLine, true);
  }

  void logOut() {
    isLoggedIn.value = false;
    StorageService.instance.setBool(StorageValue.userOnLine, false);
  }
}
