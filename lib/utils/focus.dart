/*
 * @Author: your name
 * @Date: 2023-02-22 09:20:31
 * @LastEditTime: 2023-02-22 10:53:55
 * @LastEditors: your name
 * @Description: In User Settings Edit
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
