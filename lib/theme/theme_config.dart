/*
 * @Author: your name
 * @Date: 2022-10-06 18:07:28
 * @LastEditTime: 2023-02-24 17:17:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:flutter/material.dart';
import 'package:network/styles/styles.dart';

class ThemeConfig {
  static ThemeData get lightThemeData => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        dialogBackgroundColor: AppColor.whiteColor,
        primaryColor: AppColor.mainColor,
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: const TextTheme(
          bodyText1: StandardTextStyle.normal,
        ),
      );
}
