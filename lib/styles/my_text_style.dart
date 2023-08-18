/*
 * @Author: your name
 * @Date: 2023-02-13 13:47:30
 * @LastEditTime: 2023-04-21 16:31:34
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/styles/my_text_style.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class MyTextStyle {
  static TextStyle s26w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s14w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s14w500({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s10w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s8w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s12w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s16w500({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s16w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s18w400({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle s20w500({
    Color? color,
    double? height,
    String? fontFamily = '',
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.blackColor,
      height: height,
      fontFamily: fontFamily,
      overflow: overflow,
      decoration: decoration,
      backgroundColor: backgroundColor,
    );
  }
}

class SysSize {
  static const double avatar = 56;
  // static const double iconBig = 40;
  static const double iconNormal = 24;
  // static const double big = 18;
  // static const double normal = 16;
  // static const double small = 12;
  static const double iconBig = 40;
  static const double big = 16;
  static const double normal = 14;
  static const double small = 12;
}

class StandardTextStyle {
  static const TextStyle big = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: SysSize.big,
    inherit: true,
  );
  static const TextStyle bigWithOpacity = TextStyle(
    color: Color.fromRGBO(0xff, 0xff, 0xff, .66),
    fontWeight: FontWeight.w600,
    fontSize: SysSize.big,
    inherit: true,
  );
  static const TextStyle normalW = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: SysSize.normal,
    inherit: true,
  );
  static const TextStyle normal = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: SysSize.normal,
    inherit: true,
  );
  static const TextStyle normalWithOpacity = TextStyle(
    color: Color.fromRGBO(0xff, 0xff, 0xff, .66),
    fontWeight: FontWeight.normal,
    fontSize: SysSize.normal,
    inherit: true,
  );
  static const TextStyle small = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: SysSize.small,
    inherit: true,
  );
  static const TextStyle smallWithOpacity = TextStyle(
    color: Color.fromRGBO(0xff, 0xff, 0xff, .66),
    fontWeight: FontWeight.normal,
    fontSize: SysSize.small,
    inherit: true,
  );
}
