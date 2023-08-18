/*
 * @Author: your name
 * @Date: 2023-02-15 11:55:38
 * @LastEditTime: 2023-02-28 15:14:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/api/interceptors/request_interceptor.dart
 */
import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:jufubao_shop_app/common/values/const_value.dart';
import 'package:jufubao_shop_app/common/widgets/loading.dart';

/// 注册请求监听
FutureOr<Request> requestInterceptor(Request request) async {
  Map<String, String> headers = request.headers;
  bool isNeedHub = headers[ConstKey.hudKey].toString() == '0';
  if (isNeedHub) {
    Map<String, String> headers = request.headers;
    String hudStr = '加载中...';
    if (headers[ConstKey.hudStr] != null &&
        headers[ConstKey.hudStr].isBlank == false) {
      hudStr = headers[ConstKey.hudStr] ?? '';
      hudStr = Uri.decodeComponent(hudStr);
    }
    Loading.showLoading(hudStr);
  }
  return request;
}
