import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import 'search_bar.dart';

/// 自定义AppBar
///
/// * [canPop] 是否显示返回按钮
/// * [backgroundColor]背景色
/// * [title]appBar标题
/// * [leading]widget类型，如果为空默认返回ios风格返回按钮
/// * [actions]右侧图标,List<Widget>类型，即可任意设计样式，表示右侧actions区域，可放置多个widget
PreferredSizeWidget myAppBar(
    {bool canPop = true,
    Color? backgroundColor,
    required String title,
    List<Widget>? actions,
    Widget? leading,
    bool? centerTitle,
    double? leadingWidth,
    required bool defaultFlexibleSpace,
    double? toolbarHeight,
    PreferredSizeWidget? bottom,
    Function? back}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    toolbarHeight: toolbarHeight ?? 44.w,
    elevation: 0,
    centerTitle: centerTitle ?? true,
    title: SizedBox(
      height: 44.w,
      child: Column(
        children: [
          const Spacer(),
          Container(
            // color: Colors.blue,
            margin: EdgeInsets.only(bottom: 10.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                color: defaultFlexibleSpace ? Colors.white : AppColor.mainText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
    leadingWidth: 50.h,
    leading: canPop
        ? IconButton(
          iconSize: 18.w,
          // splashRadius: 25.w,
          // padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () {
            if (back != null) {
              back.call();
            } else {
              Get.back();
            }
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: defaultFlexibleSpace ? Colors.white : AppColor.mainText,
            size: 18.w,
          ),
        )
        : null,
    actions: actions,
    // flexibleSpace: defaultFlexibleSpace
    //     ? Container(
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             colors: [
    //               AppColor.radientStart,
    //               AppColor.radientEnd,
    //             ],
    //             begin: Alignment.topCenter,
    //             end: Alignment.bottomCenter,
    //           ),
    //         ),
    //       )
    //     : null,
    automaticallyImplyLeading: false,
    bottom: bottom,
  );
}

/// 搜索appbar
PreferredSizeWidget searchAppBar({
  bool canPop = true,
  Color? backgroundColor,
  String? hint,
  Function(String)? onSubmit,
  FocusNode? focusNode,
  Widget? leading,
  bool? centerTitle,
  double? titleWidth,
  double? titleHeight,
  List<Widget>? actions,
  double? leadingWidth,
  double? toolbarHeight,
  bool? autoFocus,
  TextEditingController? textEditingController,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: toolbarHeight ?? 44.w,
    elevation: 0,
    centerTitle: centerTitle ?? false,
    leadingWidth: 40.w,
    leading: canPop
        ? IconButton(
            iconSize: 12.w,
            splashRadius: 25.w,
            padding: EdgeInsets.only(right: 8.w),
            alignment: Alignment.centerRight,
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.mainText,
              size: 12.w,
            ),
          )
        : null,
    titleSpacing: 0,
    title: SearchTextFieldBar(
      hint: hint ?? '搜索',
      width: titleWidth ?? 286.w,
      height: titleHeight ?? 30.w,
      margin: EdgeInsets.only(top: 7.w, bottom: 7.w),
      borderRadius: 30.w,
      focusNode: focusNode,
      autofocus: autoFocus,
      onSubmitted: onSubmit,
      controller: textEditingController,
    ),
    actions: actions,
    automaticallyImplyLeading: false,
  );
}
