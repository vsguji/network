/*
 * @Author: your name
 * @Date: 2023-04-21 16:06:55
 * @LastEditTime: 2023-04-21 17:01:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_net_work/styles/styles.dart';
import 'package:tapped/tapped.dart';

class JFBLocalNotification {
  static showTopNotifcation(
      {String title = '您有新订单,请及时处理',
      String subTitle = '您有新订单,请及时处理',
      Function? callBack}) {
    stackDialog(
        tag: 'order',
        height: 120.w,
        title: title,
        subTitle: subTitle,
        alignment: Alignment.topCenter,
        callBack: callBack);
  }

  static stackDialog(
      {required AlignmentGeometry alignment,
      required String tag,
      String title = '您有新订单,请及时处理',
      String subTitle = '您有新订单,请及时处理',
      double width = double.infinity,
      double height = double.infinity,
      Function? callBack}) async {
    SmartDialog.show(
      tag: tag,
      alignment: alignment,
      builder: (_) {
        return Tapped(
          onTap: callBack,
          child: Container(
            padding: EdgeInsets.only(top: 15.w),
            width: width,
            height: height,
            color: Colors.white,
            alignment: Alignment.center,
            child: ListTile(
              leading: SvgPicture.asset('assets/images/icon_logo.svg'),
              title: Text(
                '您有新订单,请及时处理',
                style: MyTextStyle.s18w400(),
              ),
              subtitle: Text(
                '您有新订单,请及时处理',
                style: MyTextStyle.s16w400(),
              ),
            ),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 3));
    SmartDialog.dismiss();
  }
}
