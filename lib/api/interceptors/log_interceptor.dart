/*
 * @Author: your name
 * @Date: 2023-02-15 17:18:45
 * @LastEditTime: 2023-02-23 09:32:41
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_net_work/extension/map.dart';
import 'package:get_net_work/utils/log.dart';

/// 日志拦截器
FutureOr<Request> logInterceptor(request) async {
  Request req = request as Request;
  String requestStr = "\n==================== REQUEST ====================\n"
      '- URL:\n${'${req.url.host}:${req.url.port}${req.url.path}'}\n'
      '- METHOD: ${req.method}\n';

  requestStr += '- HEADER:\n${req.headers.toStructureString()}\n';
  requestStr += '- PATH:\n${req.url.queryParameters.toStructureString()}\n';
  final data = req.bodyBytes;
  if (data is Map) {
    requestStr += '- BODY:\n${(data as Map).toStructureString()}\n';
  } else if (data is FormData) {
    final formDataMap = {}
      ..addEntries((data as Map).entries)
      ..addEntries((data as Map).entries);
    requestStr += '- BODY:\n${formDataMap.toStructureString()}\n';
  } else {
    requestStr += '- BODY:\n${data.toString()}\n';
  }
  MyLogUtil.d(requestStr);
  return request;
}
