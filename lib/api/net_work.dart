/*
 * @Author: your name
 * @Date: 2023-02-16 10:34:40
 * @LastEditTime: 2023-02-16 10:35:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/api/net.dart
 */

// 是否有网
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }