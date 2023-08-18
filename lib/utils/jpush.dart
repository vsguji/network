/*
 * @Author: your name
 * @Date: 2023-02-21 15:03:25
 * @LastEditTime: 2023-04-21 16:22:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/utils/jpush.dart
 */
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:jufubao_shop_app/common/routes/app_pages.dart';
import 'package:jufubao_shop_app/common/services/storage.dart';
import 'package:jufubao_shop_app/common/utils/log.dart';
import 'package:jufubao_shop_app/common/values/storage_value.dart';
import 'package:jufubao_shop_app/pages/order/details/controller.dart';

/// 激光推送
class JPushService {
  static final JPush jpush = JPush();
  // 推送key
  static const String appPushKey = 'e1a55ba563d7d57b8e0ad2b8';
  // 初始化推送
  static Future<void> initPlatformState() async {
    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        MyLogUtil.d('flutter onReceiveNotification: $message');
      }, onOpenNotification: (Map<String, dynamic> message) async {
        MyLogUtil.d('flutter onOpenNotification: $message');
        // 暂时暴力清空
        setBadge(0);
        Map<String, dynamic> msg = message;
        String orderNumber = '';
        if (Platform.isAndroid) {
          // 兼容本地推送
          msg.entries.forEach((element) {
            if (element.key == 'extras') {
              String str = element.value['cn.jpush.android.EXTRA'];
              Map<String, dynamic> extraMap = json.decode(str);
              orderNumber = extraMap['orderId'];
            }
          });
        } else {
          orderNumber = msg['orderId'] ?? '';
          if (orderNumber.isBlank == true) {
            orderNumber = msg['extras']['orderId'] ?? '';
          }
        }
        if (orderNumber.isBlank == false) {
          if (Get.currentRoute == Routes.oderDetails) {
            Get.find<OrderDetailsController>().orderNumber = orderNumber;
            Get.find<OrderDetailsController>().getDetailsInfo();
          } else {
            Get.toNamed(Routes.oderDetails,
                arguments: {'orderNumber': orderNumber});
          }
        }
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        MyLogUtil.d('flutter onReceiveMessage: $message');
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        MyLogUtil.d('flutter onReceiveNotificationAuthorization: $message');
      }, onNotifyMessageUnShow: (Map<String, dynamic> message) async {
        MyLogUtil.d('flutter onNotifyMessageUnShow: $message');
      });
    } on PlatformException {
      MyLogUtil.e('Failed to get platform version.');
    }

    jpush.setAuth(enable: true);
    jpush.setup(
      appKey: appPushKey,
      channel: '',
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        const NotificationSettingsIOS(sound: true, alert: true, badge: true));

    jpush.getRegistrationID().then((rid) {
      MyLogUtil.d('flutter get registration id : $rid');
      StorageService storageService = StorageService.instance;
      if (rid.isBlank == false) {
        if (storageService.getString(StorageValue.userDeviceToken) == null ||
            storageService.getString(StorageValue.userDeviceToken).isBlank ==
                true) {
          storageService.setString(StorageValue.userDeviceToken, rid);
        }
      }
    });
  }

  // 检查推送授权状态
  static void getLaunchNotificationStatus() {
    jpush.getLaunchAppNotification().then((map) {
      MyLogUtil.d('flutter getLaunchAppNotification:$map');
    }).catchError((error) {
      MyLogUtil.e('getLaunchAppNotification error: $error');
    });
  }

  // 设置标签
  static void setNotificationTags(List<String> tags) {
    jpush.setTags(tags).then((map) {
      var tags = map['tags'];
      if (kDebugMode) {
        print('setNotificationTags : $tags');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('setNotificationTags : $error');
      }
    });
  }

  // 添加标签
  static void addNotificationTags(List<String> tags) {
    jpush.addTags(tags).then((map) {
      var tags = map['tags'];
      if (kDebugMode) {
        print('addNotificationTags : $tags');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('addNotificationTags : $error');
      }
    });
  }

  // 删除标签
  static void deleteNotificationTags(List<String> tags) {
    jpush.deleteTags(tags).then((map) {
      var tags = map['tags'];
      if (kDebugMode) {
        print('deleteNotificationTags : $tags');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('deleteNotificationTags error: $error');
      }
    });
  }

  // 获取全部标签
  static void getNotificationTags() {
    jpush.getAllTags().then((map) {
      if (kDebugMode) {
        print('getNotificationTags : $map');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('getNotificationTags : $error');
      }
    });
  }

  // 清空标签
  static void cleanNotificationTags() {
    jpush.cleanTags().then((map) {
      var tags = map['tags'];
      if (kDebugMode) {
        print('cleanNotificationTags : $tags');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('cleanNotificationTags : $error');
      }
    });
  }

  // 设置别名
  static void setAlias(String alia) {
    jpush.setAlias(alia).then((map) {
      if (kDebugMode) {
        print('setAlias : $map');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('setAlias : $error');
      }
    });
  }

  // 删除别名
  static void deleteAlias() {
    jpush.deleteAlias().then((map) {
      if (kDebugMode) {
        print('deleteAlias : $map');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('deleteAlias : $error');
      }
    });
  }

  // 获取全部别名
  static void getAlias() {
    jpush.getAlias().then((map) {
      if (kDebugMode) {
        print('getAlias : $map');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('getAlias : $error');
      }
    });
  }

  // 停止推送
  static void stopPush() {
    jpush.stopPush();
  }

  // 恢复推送
  static void resumePush() {
    jpush.resumePush();
  }

  // 清空推送
  static void clearAllNotifications() {
    jpush.clearAllNotifications();
  }

  // 设置消息角标
  static void setBadge(int number) {
    jpush.setBadge(number).then((map) {
      if (kDebugMode) {
        print('setBadge success: $map');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('setBadge fail: $error');
      }
    });
  }

  // 通知授权是否打开
  static Future<bool> checkPushIsAuth() async {
    return jpush.isNotificationEnabled();
  }

  // 打开系统设置
  static void openAppSetting() {
    jpush.openSettingsForNotification();
  }

  /// 发送本地消息
  static void sendLocalNotifi({String orderId = '12345678'}) {
    LocalNotification localNotification = LocalNotification(
        buildId: 1,
        id: 100,
        title: '您有新订单,请及时处理',
        content: '您有新订单,请及时处理',
        fireTime: DateTime.now().add(const Duration(milliseconds: 1000)),
        extra: {'orderId': orderId});
    jpush.sendLocalNotification(localNotification);
  }
}
