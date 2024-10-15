/*
 * @Author: your name
 * @Date: 2023-02-13 14:26:41
 * @LastEditTime: 2024-10-15 15:26:48
 * @LastEditors: lipeng 1162423147@qq.com
 * @Description: In User Settings Edit
 */
import 'package:get_net_work/utils/url.dart';

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

  static void setDevHost(String dev) {
    UrlUtils.devHost = dev;
  }

  static void setReleaseHost(String host) {
    UrlUtils.releaseHost = host;
  }
}
