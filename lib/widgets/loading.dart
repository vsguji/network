/*
 * @Author: your name
 * @Date: 2023-02-15 16:31:09
 * @LastEditTime: 2023-07-26 15:39:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/widgets/loading.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jufubao_shop_app/common/styles/styles.dart';
import 'package:tapped/tapped.dart';

class Loading {
  ///
  static void showLoading([String? text]) {
    EasyLoading.show(
        status: text, dismissOnTap: false, maskType: EasyLoadingMaskType.black);
  }

  ///
  static void dismiss() {
    EasyLoading.dismiss();
  }

  ///
  static void showInfo(String error) {
    EasyLoading.showError(error);
  }

  ///
  static void showPayLoading([Function? callBack]) {
    EasyLoading.show(
        indicator: SizedBox(
            width: 40.w,
            height: 70.w,
            child: Column(
              children: [
                SpinKitFadingCircle(
                  size: 40.w,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10.w,
                ),
                Tapped(
                    onTap: () {
                      callBack?.call();
                    },
                    child: SizedBox(
                      width: 25.w,
                      height: 15.w,
                      child: Text(
                        '取消',
                        style: MyTextStyle.s12w400(color: Colors.white),
                      ),
                    ))
              ],
            )));
  }
}
