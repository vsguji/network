/*
 * @Author: your name
 * @Date: 2023-02-15 11:04:33
 * @LastEditTime: 2023-02-23 11:48:26
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:get/get.dart';
import 'package:get_net_work/widgets/loading.dart';
import 'package:get_net_work/widgets/toast.dart';
import 'env_config.dart';
import 'interceptors/interceptors.dart';

/// 基础接口
class BaseApi extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = EnviromentConfig.appEnvHost();
    httpClient.timeout = const Duration(seconds: 30);
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.addRequestModifier((logInterceptor));
  }

  /// 是否需要加载器
  String getNeedHud(bool isNeed) {
    return isNeed ? '0' : '1';
  }

  /// 是否请求队列
  String getQueue(bool isQuery) {
    return isQuery ? '0' : '1';
  }

  /// 是否需要请求回调弹框
  String getRspAlert(bool isNeed) {
    return isNeed ? '0' : '1';
  }

  /// 请求超时
  void onCloseConnect([String text = '请求超时,稍后重试', bool isNeed = true]) {
    super.onClose();
    Loading.dismiss();
    if (isNeed) {
      Toast.showText(text);
    }
  }
}
