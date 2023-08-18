/*
 * @Author: your name
 * @Date: 2023-02-13 14:26:41
 * @LastEditTime: 2023-08-08 09:54:33
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:network/utils/url.dart';

class AppEnv {
  //
  static const String envDebug = 'Debug';
  //
  static const String envPro = 'Profile';
  //
  static const String envRelease = 'Release';
}

class EnviromentConfig {
  //
  static const String appRunEnv = String.fromEnvironment('AppRunEnv');
  //
  static String host = '';

  ///
  static String appEnvHost() {
    switch (appRunEnv) {
      case AppEnv.envDebug:
        host = UrlUtils.devHost;
        break;
      case AppEnv.envPro:
        host = UrlUtils.releaseHost;
        break;
      case AppEnv.envRelease:
        host = UrlUtils.releaseHost;
        break;
      default:
        host = UrlUtils.releaseHost;
        break;
    }
    return host;
  }
}
