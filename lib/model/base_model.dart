/*
 * @Author: your name
 * @Date: 2023-02-15 11:39:30
 * @LastEditTime: 2023-02-15 16:38:31
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
import 'package:flutter/widgets.dart';

class BaseModel {
  BaseModel({this.code, this.message});
  int? code;
  String? message;

  @mustCallSuper
  void setBaseData(Map<String, dynamic> json) {
    code = json['code']?.toInt();
    message = json['message']?.toString();
  }

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    int? code = json['code']?.toInt();
    String? message = json['message']?.toString();
    return BaseModel(code: code, message: message);
  }
}
