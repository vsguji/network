/*
 * @Author: your name
 * @Date: 2023-02-23 15:40:51
 * @LastEditTime: 2023-02-23 16:06:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/middleware/nav_observer.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/router_report.dart';
import 'package:jufubao_shop_app/common/routes/app_pages.dart';

class MyNavObserver extends NavigatorObserver {
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    // TODO: implement didStartUserGesture
    // // 修改
    // List<GetPage> pages = Get.routeTree.routes;
    // GetPage? targetPage =
    //     pages.firstWhereOrNull((element) => element.name == Routes.home);
    // Route newPreviousRoute =
    //     GetPageRoute(routeName: Routes.home, page: targetPage?.page);
    // RouterReportManager.reportCurrentRoute(newPreviousRoute);
    // didReplace(newRoute: newPreviousRoute,oldRoute:previousRoute);
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    // List<GetPage> pages = Get.routeTree.routes;
    // GetPage? targetPage =
    //     pages.firstWhereOrNull((element) => element.name == Routes.home);
    // Route newPreviousRoute =
    //     GetPageRoute(routeName: Routes.home, page: targetPage?.page);
    // RouterReportManager.reportCurrentRoute(newPreviousRoute);
    super.didPop(route, previousRoute);
  }
}
