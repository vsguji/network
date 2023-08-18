/*
 * @Author: your name
 * @Date: 2023-02-15 11:55:15
 * @LastEditTime: 2023-03-21 10:45:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/api/interceptors/auth.dart
 */
import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
// import 'package:jufubao_shop_app/common/services/storage.dart';
// import 'package:jufubao_shop_app/common/values/const_value.dart';
// import 'package:jufubao_shop_app/common/values/storage_value.dart';

/// 请求鉴权
FutureOr<Request> authInterceptor(request) async {
  // Request newRequest = request as Request;
  // newRequest.headers[ConstKey.tokenKey] =
  //     StorageService.instance.getString(StorageValue.userToken) ?? '';
  // return newRequest;
  return request;
}
