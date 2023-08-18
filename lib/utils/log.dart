/*
 * @Author: your name
 * @Date: 2023-02-22 16:17:30
 * @LastEditTime: 2023-02-22 17:45:49
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/utils/log.dart
 */
import 'package:logger/logger.dart';

class MyLogUtil {
  static final log = Logger();

  // Level.debug
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.d(message, error, stackTrace);
  }

  // Level.verbose
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.v(message, error, stackTrace);
  }

  // Level.warning
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.w(message, error, stackTrace);
  }

  // Level.wtf
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.wtf(message, error, stackTrace);
  }

  // Level.error
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.e(message, error, stackTrace);
  }

  // Level.info
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.i(message, error, stackTrace);
  }
}
