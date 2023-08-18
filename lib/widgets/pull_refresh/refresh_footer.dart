/*
 * @Author: your name
 * @Date: 2023-02-14 18:02:04
 * @LastEditTime: 2023-02-15 14:01:11
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/widgets/pull_refresh/refresh_footer.dart
 */
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 上拉加载ClassicFooter多语言适配
class RefresherFooter extends StatelessWidget {
  const RefresherFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClassicFooter(
      loadingText: "加载中...",
      noDataText: "没有更多数据了",
      idleText: "上拉加载",
      failedText: "加载失败",
      canLoadingText: "松手开始加载数据",
    );
  }
}
