/*
 * @Author: your name
 * @Date: 2023-02-24 14:50:08
 * @LastEditTime: 2023-02-24 16:45:38
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/utils/package_info.dart
 */
import 'package:package_info_plus/package_info_plus.dart';
/// 获取应用信息
class PackageUtil {
  //
  static PackageInfo? _packageInfo;

  /// 
  static Future<void> initPlatformState() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// 应用名称
  static String get appName => _packageInfo?.appName ?? '';

  /// 应用唯一标识
  static String get bundleIdentifier => _packageInfo?.packageName ?? '';

  /// 应用版本
  static String get version => _packageInfo?.version ?? '';

  /// 应用运行版本
  static String get buildNumber => _packageInfo?.buildNumber ?? '';

  /// 应用签名
  static String get buildSignature => _packageInfo?.buildSignature ?? '';
}
