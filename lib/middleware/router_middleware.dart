/*
 * @Author: your name
 * @Date: 2023-03-30 15:42:44
 * @LastEditTime: 2023-07-26 16:29:58
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouterMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return super.redirect(route);
  }

  // @override
  // GetPage? onPageCalled(GetPage? page) {
  //   return super.onPageCalled(page);
  // }
}