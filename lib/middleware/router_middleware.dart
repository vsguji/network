/*
 * @Author: your name
 * @Date: 2023-03-30 15:42:44
 * @LastEditTime: 2023-07-26 16:29:58
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/middleware/router_middleware.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jufubao_shop_app/common/routes/app_pages.dart';
import 'package:jufubao_shop_app/common/services/storage.dart';
import 'package:jufubao_shop_app/common/values/storage_value.dart';

class RouterMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (StorageService.instance.getBool(StorageValue.userOnLine) == true) {
      String partmentId =
          StorageService.instance.getString(StorageValue.partmentId) ?? '';
      if (partmentId.isBlank == true) {
        route = Routes.partment;
        return const RouteSettings(name: Routes.partment);
      } else {
        return const RouteSettings(name: Routes.home);
      }
    }
    return super.redirect(route);
  }

  // @override
  // GetPage? onPageCalled(GetPage? page) {
  //   return super.onPageCalled(page);
  // }
}

class ScanRouterMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // if (StorageService.instance.getBool(StorageValue.userOnLine) == true) {
    //   String partmentId =
    //       StorageService.instance.getString(StorageValue.partmentId) ?? '';
    //   if (partmentId.isBlank == true) {
    //     route = Routes.partment;
    //     return const RouteSettings(name: Routes.partment);
    //   } else {
    //     return const RouteSettings(name: Routes.home);
    //   }
    // }
    return super.redirect(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
    // TODO: implement redirectDelegate
    return super.redirectDelegate(route);
  }

  @override
  void onPageDispose() {
    // TODO: implement onPageDispose
    super.onPageDispose();
  }
}
