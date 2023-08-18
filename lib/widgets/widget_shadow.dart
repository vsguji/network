/*
 * @Author: your name
 * @Date: 2023-02-13 18:08:54
 * @LastEditTime: 2023-02-13 18:16:33
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/widgets/widget_shadow.dart
 */
import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class WidgetBoxShadow extends StatelessWidget {
  const WidgetBoxShadow(
      {Key? key,
      this.height = 0,
      this.width = 0,
      this.circular = 12,
      this.shadowColor,
      this.spreadRadius = 4,
      this.blurRadius = 8,
      this.offset,
      this.child})
      : super(key: key);
  //
  final double height;
  //
  final double width;
  //
  final double circular;
  //
  final Color? shadowColor;
  //
  final double spreadRadius;
  //
  final double blurRadius;
  //
  final Offset? offset;
  //
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColor.orangeBtnGray,
          borderRadius: BorderRadius.all(
            Radius.circular(circular),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor ??
                  const Color.fromRGBO(255, 141, 26, 1).withOpacity(0.3),
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: offset ?? const Offset(0, 4),
            )
          ]),
      child: child,
    );
  }
}
