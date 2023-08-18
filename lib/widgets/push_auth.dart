/*
 * @Author: your name
 * @Date: 2023-04-07 14:35:21
 * @LastEditTime: 2023-04-07 14:41:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network/styles/styles.dart';

class JPushAuth {
  static Future showAlert(String text,
      {Function? allowCallBack, Function? denyCallBack}) {
    return Get.defaultDialog(
        radius: 5,
        title: '通知设置',
        titleStyle: MyTextStyle.s12w400(color: AppColor.mainText),
        middleText: text,
        middleTextStyle: MyTextStyle.s12w400(color: AppColor.mainText),
        barrierDismissible: false,
        titlePadding: EdgeInsets.only(top: 20.w),
        contentPadding: EdgeInsets.symmetric(vertical: 20.w),
        confirm: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: FButton(
            width: 79.w,
            height: 30.w,
            text: '允许',
            alignment: Alignment.center,
            color: AppColor.orangeBtnGray,
            highlightColor: AppColor.orangeBtnGray,
            disabledColor: AppColor.orangeBtnGray,
            style: MyTextStyle.s12w400(color: AppColor.whiteColor),
            onPressed: () {
              allowCallBack?.call();
            },
          ),
        ),
        cancel: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: FButton(
            width: 79.w,
            height: 30.w,
            text: '拒绝',
            alignment: Alignment.center,
            color: AppColor.grayTableGray,
            highlightColor: AppColor.grayTableGray,
            disabledColor: AppColor.grayTableGray,
            style: MyTextStyle.s12w400(color: AppColor.mainText),
            onPressed: () {
              denyCallBack?.call();
            },
          ),
        ));
  }
}
