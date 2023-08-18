/*
 * @Author: your name
 * @Date: 2023-02-20 16:14:06
 * @LastEditTime: 2023-02-20 16:17:31
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/extension/text_editing_field.dart
 */
import 'package:flutter/material.dart';

extension TextEditingPosition on TextEditingController {
  // 保持光标在最后
   TextEditingController editingController() {
    return TextEditingController.fromValue(TextEditingValue(
        text:text,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: text.length))));
  }
}
