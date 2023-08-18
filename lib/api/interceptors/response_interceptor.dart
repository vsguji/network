/*
 * @Author: your name
 * @Date: 2023-02-15 11:55:48
 * @LastEditTime: 2023-03-25 17:54:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/api/interceptors/response_interceptor.dart
 */
import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:jufubao_shop_app/common/api/net_work.dart';
import 'package:jufubao_shop_app/common/routes/app_pages.dart';
import 'package:jufubao_shop_app/common/services/auth_services.dart';
import 'package:jufubao_shop_app/common/services/storage.dart';
import 'package:jufubao_shop_app/common/values/const_value.dart';
import 'package:jufubao_shop_app/common/values/storage_value.dart';
import 'package:jufubao_shop_app/common/widgets/alert.dart';
import 'package:jufubao_shop_app/common/widgets/loading.dart';
import 'package:jufubao_shop_app/common/widgets/toast.dart';

/// 注册回调监听、错误处理
FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  bool isNeedHub = handleAlert(request);
  if (isNeedHub) {
    Loading.dismiss();
  }
  if (response.statusCode.toString() != ConstValue.code200) {
    handleErrorStatus(response);
  }
  return response;
}

void handleErrorStatus(Response response) async {
  bool isOk = await isConnected();
  if (!isOk) {
    Alert.showAlert('网路错误,请检查当前网络');
    return;
  }
  Loading.dismiss();
  switch (response.statusCode.toString()) {
    case ConstValue.code400:
      {
        if (response.body is Map) {
          Map<String, dynamic> bodyMap = response.body as Map<String, dynamic>;
          String msg = bodyMap['message'] ?? '';
          if (msg.isBlank == false) {
            if (msg.contains('/body/xml/auth_code') ||
                msg.contains('字符串规则校验失败')) {
              Alert.showAlert('请确认扫一扫为微信码');
            } else if (msg.contains('支付异常')) {
              Alert.showAlert('支付失败');
            } else if (msg.contains('版本不存在！') || msg.contains('app名称不存在！')) {
              break;
            } else {
              if (response.request != null &&
                  response.request.isBlank == false) {
                bool isNeedAlert = handleRspAlert(response.request!);
                if (isNeedAlert) {
                  String rspAlertStr = handleRspAlertStr(response.request!);
                  if (rspAlertStr.isBlank == false) {
                    Alert.showAlert(rspAlertStr);
                  } else {
                    Alert.showAlert(bodyMap['message'] ?? '');
                  }
                }
              }
            }
          }
        }
      }
      break;
    case ConstValue.code500:
      Alert.showAlert('服务器异常,请稍后再试');
      break;
    case ConstValue.code403:
      Toast.showText('登录已失效,请重新登录');
      AuthService.to.logOut();
      StorageService.instance.remove(StorageValue.userToken);
      Get.offNamedUntil(Routes.login, (route) => false);
      break;
    default:
  }
  return;
}

bool handleAlert(Request request) {
  bool isNeed = true;
  Map<String, String>? headers = request.headers;
  if (headers.isBlank == false) {
    isNeed = headers[ConstKey.hudKey].toString() == '0';
  }
  return isNeed;
}

bool handleRspAlert(Request request) {
  bool isNeed = true;
  Map<String, String>? headers = request.headers;
  if (headers.isBlank == false && headers[ConstKey.rspAlert] != null) {
    isNeed = headers[ConstKey.rspAlert].toString() == '0';
  }
  return isNeed;
}

String handleRspAlertStr(Request request) {
  String str = '';
  Map<String, String>? headers = request.headers;
  if (headers.isBlank == false &&
      headers[ConstKey.rspAlert] != null &&
      headers[ConstKey.rspAlertStr].isBlank == false) {
    str = headers[ConstKey.rspAlertStr] ?? '';
  }
  return str;
}
