/*
 * @Author: your name
 * @Date: 2023-02-24 08:53:41
 * @LastEditTime: 2023-02-24 18:42:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/extension/widget.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tapped/tapped.dart';

enum PlaceHolederScene { none, network }

extension PlaceHolder on Widget {
  // 占位图
  Widget getPlaceHolder(
      [bool visible = true,
      bool isFirst = true,
      PlaceHolederScene scene = PlaceHolederScene.none,
      EdgeInsets inset = EdgeInsets.zero,
      EdgeInsets vInset = EdgeInsets.zero,
      String placeHolder = '暂无数据',
      TextStyle? placeHolderType,
      String placeHolderIcon = 'no_data',
      Function? callBack]) {
    return visible && !isFirst
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/$placeHolderIcon.svg'),
                if (placeHolder.isNotEmpty)
                  Tapped(
                    onTap: callBack,
                    child: Text(
                      placeHolder,
                      style: placeHolderType,
                    ).marginOnly(top: vInset.top),
                  )
              ],
            ).paddingOnly(bottom: inset.bottom),
          )
        : this;
  }
}
