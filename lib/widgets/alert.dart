/*
 * @Author: your name
 * @Date: 2023-02-16 09:25:35
 * @LastEditTime: 2023-02-22 12:00:41
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/widgets/alert.dart
 */
import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jufubao_shop_app/common/styles/styles.dart';
// ignore: depend_on_referenced_packages
import 'package:fcontrol_nullsafety/fdefine.dart';
import 'package:jufubao_shop_app/common/utils/focus.dart';

class Alert {
  /// 文本提示框
  static void showAlert(String text,
      {bool barrierDismissible = false, Function? callBack}) {
    Get.defaultDialog(
        barrierDismissible: barrierDismissible,
        radius: 0,
        title: '',
        titlePadding: const EdgeInsets.only(top: 0),
        content: Text(
          text,
          style: MyTextStyle.s12w400(color: AppColor.mainText),
        ),
        confirm: FButton(
          width: 150.w,
          height: 32.w,
          text: '确定',
          corner: FCorner.all(4),
          color: AppColor.orangeBtnGray,
          disabledColor: AppColor.orangeBtnGray,
          highlightColor: AppColor.orangeBtnGray,
          style: MyTextStyle.s14w400(color: AppColor.whiteColor),
          alignment: Alignment.center,
          onPressed: () {
            assert(Get.context != null, 'Get 检查框架使用状态');
            AppFocus.unfocus(Get.context!);
            callBack?.call();
            Get.back();
          },
        ));
  }

  /// 支付成功提示
  static void showAlertPay(
      {String text = '',
      bool barrierDismissible = false,
      bool isOk = true,
      Function? callBack}) {
    Get.defaultDialog(
        barrierDismissible: barrierDismissible,
        contentPadding: EdgeInsets.only(bottom: 22.w, top: 0),
        title: '',
        titlePadding: const EdgeInsets.all(0),
        content: FButton(
          image: SvgPicture.asset(
            isOk
                ? 'assets/images/icon_success.svg'
                : 'assets/images/icon_fail.svg',
            width: 50.w,
            height: 50.w,
          ),
          text: text,
          style: MyTextStyle.s20w500(color: AppColor.mainText),
          disabledColor: Get.theme.dialogBackgroundColor,
          imageAlignment: ImageAlignment.top,
        ),
        confirm: FButton(
          text: '知道了',
          width: 120.w,
          height: 24.w,
          style: MyTextStyle.s16w400(color: AppColor.greenBtn),
          alignment: Alignment.center,
          color: AppColor.whiteColor,
          highlightColor: AppColor.whiteColor,
          onPressed: () {
            callBack?.call();
            Get.back();
          },
        ),
        confirmTextColor: AppColor.greenBtn,
        buttonColor: AppColor.whiteColor);
  }
}
