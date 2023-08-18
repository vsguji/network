/*
 * @Author: your name
 * @Date: 2023-02-22 09:20:31
 * @LastEditTime: 2023-02-22 10:53:55
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/utils/focus.dart
 */
import 'package:flutter/cupertino.dart';

class AppFocus {
  static void unfocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
