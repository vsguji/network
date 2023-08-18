/*
 * @Author: your name
 * @Date: 2023-02-23 15:40:51
 * @LastEditTime: 2023-02-23 16:06:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:flutter/material.dart';

class MyNavObserver extends NavigatorObserver {
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
  }
}
