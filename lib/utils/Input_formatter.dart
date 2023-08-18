/*
 * @Author: your name
 * @Date: 2021-12-08 09:43:24
 * @LastEditTime: 2023-02-16 18:48:14
 * @LastEditors: your name
 * @Description: In User Settings Edit
 */
import 'package:flutter/services.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;

  ///允许的小数位数，-1代表不限制位数
  int digit;
  CustomTextInputFormatter({this.digit = -1});
  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  ///获取目前的小数位数
  static int getValueDigit(String value) {
    if (value.contains(".")) {
      return value.split(".")[1].length;
    } else {
      return -1;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    } else if (value == "-") {
      value = "-";
      selectionIndex++;
    } else if (value != "" &&
            value != defaultDouble.toString() &&
            strToFloat(value, defaultDouble) == defaultDouble ||
        getValueDigit(value) > digit) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    return new TextEditingValue(
      text: value,
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
