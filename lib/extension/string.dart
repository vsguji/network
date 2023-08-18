/*
 * @Author: your name
 * @Date: 2023-02-21 18:58:53
 * @LastEditTime: 2023-02-22 11:21:02
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:common_utils/common_utils.dart';

extension Zero on String {
  bool get isZero {
    return NumUtil.isZero(NumUtil.getDoubleByValueStr(this));
  }
}
