/*
 * @Author: your name
 * @Date: 2023-02-13 13:52:06
 * @LastEditTime: 2023-03-30 17:05:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/values/storage_value.dart
 */
/// App相关存储
class StorageValue {
  // 存储前缀
  static const String _prefix = 'JFB';
  // 存储登录名
  static const String userName = '$_prefix.UserName';
  // 存储登录密码
  static const String userPwd = '$_prefix.UserPwd';
  // 存储用户令牌
  static const String userToken = '$_prefix.UserToken';
  // 存储用户记住密码
  static const String userSavePwd = '$_prefix.UserSavePwd';
  // 存储用户登录状态
  static const String userOnLine = '$_prefix.UserOnLine';
  // 存储门店Id
  static const String partmentId = '$_prefix.PartmentId';
  // 存储门店名称
  static const String partmentName = '$_prefix.PartmentName';
  // 存储平台名称
  static const String companyName = '$_prefix.CompanyName';
  // 存储平台联系方式
  static const String companyPhone = '$_prefix.CompanyPhone';
  // 存储用户自动登录
  static const String userAutoLogin = '$_prefix.UserAutoLogin';
  // 存储用户手机Device Token
  static const String userDeviceToken = '$_prefix.UserDeviceToken';
  // 存储用户同意协议
  static const String userAgreement = '$_prefix.UserAgreement';
  // 是否pos
  static const String currentIsDevicePos = '$_prefix.CurrentIsDevicePos';
}
