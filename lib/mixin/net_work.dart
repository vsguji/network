/*
 * @Author: your name
 * @Date: 2023-02-16 10:46:27
 * @LastEditTime: 2023-08-03 10:25:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:get/get.dart';
import 'package:get_net_work/api/net_work.dart';
import 'package:get_net_work/routes/app_pages.dart';
import 'package:get_net_work/widgets/alert.dart';

mixin NetWork {
  ///
  Future<bool> checkNetWork([Function? callBack]) {
    Future<bool> isOk = isConnected();
    isOk.then((value) {
      if (!value) {
        Alert.showAlert('网络错误,请检查当前网络', callBack: () {
          if (Get.currentRoute != Routes.login) {
            // Get.offNamedUntil(Routes.login, (route) => false);
          }
          callBack?.call();
        });
        return;
      }
    });
    return isOk;
  }
}
