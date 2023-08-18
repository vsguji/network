/*
 * @Author: your name
 * @Date: 2023-02-14 18:02:04
 * @LastEditTime: 2023-08-18 11:02:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/widgets/pull_refresh/refresh_config.dart
 */
import 'package:flutter/material.dart';
import 'package:get_net_work/styles/styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'refresh_footer.dart';

class RefreshConfig extends StatelessWidget {
  final Widget child;

  const RefreshConfig({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 280,
      dragSpeedRatio: 0.91,
      headerBuilder: () => MaterialClassicHeader(
          color: AppColor.orangeBtnGray, backgroundColor: AppColor.whiteColor),
      // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
      footerBuilder: () => const RefresherFooter(),
      // 配置默认底部指示器
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      // 下拉刷新振动
      enableLoadMoreVibrate: false,
      // 上拉加载振动
      hideFooterWhenNotFull: false,
      // Viewport不满一屏时,禁用上拉加载更多功能
      enableBallisticLoad: true,
      // 可以通过惯性滑动触发加载更多
      shouldFooterFollowWhenNotFull: (state) {
        return false;
      },
      child: child,
    );
  }
}
