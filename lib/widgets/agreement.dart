import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jufubao_shop_app/common/services/storage.dart';
import 'package:jufubao_shop_app/common/styles/app_colors.dart';
import 'package:jufubao_shop_app/common/values/storage_value.dart';
import 'package:jufubao_shop_app/common/widgets/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 用户协议
class AgreementDialog {
  static const String agreementUrl = 'https://agreement.jufubao.cn/sandbox/consume-service-agreement.html';
  static const String privacyUrl = 'https://agreement.jufubao.cn/sandbox/consume-privacy-agreement.html';

  showAgreement() {
    bool isShow =  StorageService.instance.getBool(StorageValue.userAgreement) ?? false;
    if (isShow) {
      return;
    }
    showDialog<bool>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.w))),
          content: Text.rich(
            TextSpan(style: TextStyle(fontSize: 14.w, color: AppColor.mainText, height: 2.0), children: [
              const TextSpan(
                text: '欢迎使用小蜜蜂核销系统，这是一款仅针对小蜜蜂核销系统使用的app，请您点击',
              ),
              webViewLink("《服务协议》", agreementUrl),
              const TextSpan(
                text: "和",
              ),
              webViewLink("《隐私协议》", privacyUrl),
              const TextSpan(text: '如您同意以上内容，请点击“同意并继续”，开始使用我们的产品与服务！'),
            ]),
            overflow: TextOverflow.clip,
          ),
          actions: [
            CupertinoDialogAction(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10.w),
                  decoration: BoxDecoration(
                    color: AppColor.orangeBtnGray,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Text('同意并继续', style: TextStyle(color: AppColor.whiteColor, fontSize: 16.w))),
              onPressed: () {
                StorageService.instance.setBool(StorageValue.userAgreement, true);
                Get.back();
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                exit(0);
              },
              child: Text('不同意退出', style: TextStyle(color: Colors.grey, fontSize: 16.w)),
            ),
          ],
        );
      },
    );
  }

  TextSpan webViewLink(String title, String url) {
    return TextSpan(
      text: title,
      style: TextStyle(
        color: AppColor.orangeBtnGray,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          Get.to(WebViewPage(
            title: title,
            url: url,
          ));
        },
    );
  }
}