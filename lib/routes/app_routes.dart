/*
 * @Author: your name
 * @Date: 2023-02-13 11:54:14
 * @LastEditTime: 2023-02-15 10:32:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
}

abstract class _Paths {
  // 登录
  static const login = '/login';
}
