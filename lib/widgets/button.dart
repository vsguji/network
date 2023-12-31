// ignore_for_file: depend_on_referenced_packages

/*
 * @Author: your name
 * @Date: 2023-02-16 10:10:53
 * @LastEditTime: 2023-08-18 14:55:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:fcontrol_nullsafety/fdefine.dart';
import 'package:get/get.dart';

class JFButton {
  ///
  static int count = 0;

  ///
  static FButton customBtn(
      {Key? key,
      VoidCallback? onPressed,
      double? width,
      double? height,
      String? text,
      Alignment? alignment = Alignment.center,
      Color color = Colors.white,
      Color highlightColor = Colors.white,
      double corner = 4,
      TextStyle? style,
      Color shadowColor = Colors.white,
      double shadowBlur = 0,
      Offset shadowOffset = Offset.zero}) {
    return FButton(
      key: key,
      onPressed: () {
        if (count == 0) {
          count = 1;
          onPressed?.call();
          2.delay(() {
            count = 0;
          });
        }
      },
      width: width,
      height: height,
      text: text,
      alignment: alignment,
      color: color,
      highlightColor: highlightColor,
      corner: FCorner.all(corner),
      style: style,
      shadowColor: shadowColor,
      shadowBlur: shadowBlur,
      shadowOffset: shadowOffset,
      // color: AppColor.orangeBtnGray,
      // highlightColor: AppColor.orangeBtnGray,
      // corner: FCorner.all(12),
      // style: MyTextStyle.s16w500(color: AppColor.mainColor),
      // shadowColor: AppColor.orangeBtnGray.withOpacity(0.3),
      // shadowBlur: 8,
      // shadowOffset: const Offset(0, 4),
    );
  }
}
