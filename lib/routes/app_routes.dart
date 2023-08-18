/*
 * @Author: your name
 * @Date: 2023-02-13 11:54:14
 * @LastEditTime: 2023-02-15 10:32:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/routes/app_routes.dart
 */
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const partment = _Paths.partment;
  static const orderOff = _Paths.orderOff;
  static const scan = _Paths.scan;
  static const setting = _Paths.setting;
  static const oderDetails = _Paths.oderDetails;
  static const printer = _Paths.printer;
}

abstract class _Paths {
  // 首页
  static const home = '/home';
  // 登录
  static const login = '/login';
  // 门店
  static const partment = '/partment';
  // 线下订单
  static const orderOff = '/order_off';
  // 门店核销
  static const scan = '/scan';
  // 设置
  static const setting = '/setting';
  // 订单详情
  static const oderDetails = '/oder_details';
  // 打印
  static const printer = '/printer';
}
