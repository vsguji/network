/*
 * @Author: your name
 * @Date: 2023-02-16 09:41:32
 * @LastEditTime: 2023-08-18 11:00:34
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/widgets/update_version.dart
 */

import 'dart:io';

import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_app_update/azhon_app_update.dart';
import 'package:flutter_app_update/update_model.dart';
import 'package:network/api/api_repository.dart';
import 'package:network/styles/styles.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 应用版本更新
class AppUpdate {
  ///是否已经显示过
  static bool isHaveShown = false;

  ///检测版本
  static getVersion(ApiRepository apiRepository,
      {String position = 'after', bool isNeedHud = true}) async {
    if (isHaveShown) return;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String type = await getDeviceType();
    Map<String, dynamic> param = {
      "app_type": type,
      "version_code": packageInfo.version,
      "package_name": packageInfo.packageName,
      "type": position
    };
  }

  ///
  static showAppUpdate(bool forcedUpgrade,
      {String url = '', String text = '', String apkVersionName = ''}) {
    Get.defaultDialog(
        radius: 5,
        title: '版本更新提示',
        titleStyle: MyTextStyle.s12w400(color: AppColor.mainText),
        content: Scrollbar(
          controller: ScrollController(),
          child: TextField(
              minLines: 1,
              maxLines: 10,
              controller: TextEditingController(text: text),
              readOnly: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              style: MyTextStyle.s12w400(color: AppColor.mainText)),
        ),
        barrierDismissible: false,
        titlePadding: EdgeInsets.only(top: 20.w),
        contentPadding: EdgeInsets.symmetric(vertical: 20.w),
        confirm: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: FButton(
            width: 79.w,
            height: 30.w,
            text: '更新',
            alignment: Alignment.center,
            color: AppColor.orangeBtnGray,
            highlightColor: AppColor.orangeBtnGray,
            disabledColor: AppColor.orangeBtnGray,
            style: MyTextStyle.s12w400(color: AppColor.whiteColor),
            onPressed: () {
              _simpleUse(url: url, text: text, apkVersionName: apkVersionName);
              if (!forcedUpgrade) {
                Get.back();
              }
            },
          ),
        ),
        cancel: forcedUpgrade
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: FButton(
                  width: 79.w,
                  height: 30.w,
                  text: '暂不更新',
                  alignment: Alignment.center,
                  color: AppColor.grayTableGray,
                  highlightColor: AppColor.grayTableGray,
                  disabledColor: AppColor.grayTableGray,
                  style: MyTextStyle.s12w400(color: AppColor.mainText),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ));
  }

  /// 简单使用
  static _simpleUse({
    bool forcedUpgrade = false,
    String url = '',
    String text = '',
    String apkVersionName = '',
  }) {
    // UpdateModel model = UpdateModel(
    //   url,
    //   'mendianhexiao.apk',
    //   "ic_launcher",
    //   text,
    //   iOSUrl: url,
    //   apkVersionCode: 300,
    //   apkVersionName: "V$apkVersionName",
    //   forcedUpgrade: forcedUpgrade,
    //   showNewerToast: true,
    //   showiOSDialog: true,
    // );
    UpdateModel model = UpdateModel('', '', '', '');
    // ignore: avoid_print
    AzhonAppUpdate.update(model).then((value) => print(value));
  }

  static bool haveNewVersion(String newVersion, String old) {
    if (newVersion.isEmpty || old.isEmpty) {
      return false;
    }
    int newVersionInt, oldVersion;
    var newList = newVersion.split('.');
    var oldList = old.split('.');
    if (newList.isEmpty || oldList.isEmpty) {
      return false;
    }
    for (int i = 0; i < newList.length; i++) {
      newVersionInt = int.parse(newList[i]);
      oldVersion = int.parse(oldList[i]);
      if (newVersionInt > oldVersion) {
        return true;
      } else if (newVersionInt < oldVersion) {
        return false;
      }
    }

    return false;
  }

  /// 获取当前设备类型
  static Future<String> getDeviceType() async {
    if (Platform.isIOS) {
      return '2';
    } else {
      MethodChannel channel = const MethodChannel('io.flutter.dev/printer');
      dynamic isOK = await channel.invokeMethod('getConnectedPos');
      if (isOK) {
        return '3';
      } else {
        return '1';
      }
    }
  }
}
