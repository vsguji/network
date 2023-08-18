/*
 * @Author: your name
 * @Date: 2023-02-15 14:22:59
 * @LastEditTime: 2023-02-16 09:54:30
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:bot_toast/bot_toast.dart';

class Toast {
  /// 文本提示
  static void showText(String text) {
    BotToast.showText(text: text);
  }
}
