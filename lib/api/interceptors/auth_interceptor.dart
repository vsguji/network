/*
 * @Author: your name
 * @Date: 2023-02-15 11:55:15
 * @LastEditTime: 2023-03-21 10:45:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

/// 请求鉴权
FutureOr<Request> authInterceptor(request) async {
  return request;
}
