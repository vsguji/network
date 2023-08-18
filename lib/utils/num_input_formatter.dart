/*
 * @Author: your name
 * @Date: 2023-03-01 14:16:28
 * @LastEditTime: 2023-03-01 14:17:46
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/utils/num_input_formatter.dart
 */
import 'package:flutter/services.dart';

class NumLengthInputFormatter extends TextInputFormatter {
  int decimalLength;
  int integerLength;

  NumLengthInputFormatter({
    required this.decimalLength,
    required this.integerLength,
  }) : super();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (newValue.text.contains('.')) {
      int pointIndex = newValue.text.indexOf('.');
      String beforePoint = newValue.text.substring(0, pointIndex);
      print('$beforePoint');
      //小数点前内容大于integerLength
      if (beforePoint.length > integerLength) {
        value = oldValue.text;
        selectionIndex = oldValue.selection.end;
      } else
      //小数点前内容小于等于integerLength
      {
        String afterPoint =
            newValue.text.substring(pointIndex + 1, newValue.text.length);
        if (afterPoint.length > decimalLength) {
          value = oldValue.text;
          selectionIndex = oldValue.selection.end;
        }
      }
    } else {
      if (newValue.text.length > integerLength) {
        value = oldValue.text;
        selectionIndex = oldValue.selection.end;
      }
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
