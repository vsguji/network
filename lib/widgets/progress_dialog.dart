/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2024-10-19 20:18:43
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2024-10-21 23:53:12
 * @FilePath: /network/lib/widgets/progress_dialog.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

/// 下载进度UI
class BaseProgressDialog {
  static ProgressDialog? pr;
  static init(BuildContext ctx) {
    pr = ProgressDialog(ctx, type: ProgressDialogType.download);
  }

  static update(double? progress, {String? msg = "请稍等..."}) {
    pr?.update(
      progress:
          ((double.tryParse(progress?.toStringAsFixed(2) ?? '0.00')) ?? 0.00) *
              100,
      message: msg,
      progressWidget: Container(
          padding: const EdgeInsets.all(8.0),
          child: const CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: const TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: const TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
  }

  static show() async {
    await pr?.show();
  }

  static hide() async {
    await pr?.hide();
  }

  static bool isShowing() {
    return pr?.isShowing() ?? false;
  }
}
