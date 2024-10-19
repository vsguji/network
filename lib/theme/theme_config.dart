/*
 * @Author: your name
 * @Date: 2022-10-06 18:07:28
 * @LastEditTime: 2024-10-16 11:44:32
 * @LastEditors: lipeng 1162423147@qq.com
 * @Description: In User Settings Edit
 */
import 'package:flutter/material.dart';
import 'package:get_net_work/styles/styles.dart';

class ThemeConfig {
  static ThemeData get lightThemeData => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        dialogBackgroundColor: AppColor.whiteColor,
        primaryColor: AppColor.mainColor,
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: const TextTheme(
          bodyLarge: StandardTextStyle.normal,
        ),
      );
}
