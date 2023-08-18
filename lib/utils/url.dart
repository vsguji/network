/*
 * @Author: your name
 * @Date: 2023-02-13 13:50:03
 * @LastEditTime: 2023-07-27 09:09:20
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/utils/url.dart
 */
/// App相关业务Url
class UrlUtils {
  // 开发环境
  static const String devHost = 'https://sandbox-store-cake.jufubao.cn';
  // 正式环境
  static const String releaseHost = 'https://store-cake.jufubao.cn';
}

// 平台
class ApiPath {
  // 登录
  static const String loginPath = '/rest/3.0/store/oauth/user/login';
  // 登出
  static const String loginOutPath = '/rest/3.0/store/oauth/user/logout';
  // 版本升级
  static const String versionPath = '/api/pb/host/get-version';
}

// 门店
class PartmentPath {
  // 获取门店基本配置信息
  static const String partmentInfoPath = '/rest/3.0/store/oauth/user/get_info';
  // 获取 可管理 所有门店列表
  static const String partmentListPath =
      '/rest/3.0/store/shop/shop/get_auth_shop_list';
  // 门店-线下卡核销-分类查询
  static const String partmentQueryKindsPath =
      '/rest/3.0/store/card/card/getCategoryInfo';
  // 线下核销查询卡信息
  static const String partmentQueryCardsPath = '/rest/3.0/store/card/card/list';
}

// 消费
class ConsumePath {
  // 提货消费-订单分类
  static const String categoryInfoPath =
      '/rest/3.0/store/card/card/getCategoryInfo';
  // 提货消费-扫码检查卡信息
  static const String cardListPath = '/rest/3.0/store/card/card/list';
  // 提货消费-生成订单
  static const String createOrderPath = '/rest/3.0/store/card/card/createOrder';
  // 提货消费-支付
  static const String cardPayPath = '/rest/3.0/store/card/card/pay';
  // 提货消费-支付中调用查询订单状态的接口
  static const String findCardOrderPath =
      '/rest/3.0/store/card/card/findCardOrder';
  // 提货消费-通知
  static const String pushMessagePath = '/rest/3.0/store/oauth/msg/shop_alias';
}

// 商品
class GoodPath {
  // 选择蛋糕类型接口
  static const String goodTypePath =
      '/rest/3.0/store/product/attribute/all_attr_tpl_cascade';
  //
}

// 订单
class OrderPath {
  //获取订单列表
  static const String orderListPath = '/rest/3.0/store/card/card/order_list';
  //退款
  static const String orderRefundPath =
      '/rest/3.0/store/card/card/order_refund';
  // 订单详情
  static const String orderDetail = '/rest/3.0/store/card/card/order_detail';
  //订单总量
  static const String orderCount = '/rest/3.0/store/card/card/order_count';
}

// 打印
class PrinterPath {
  // 首次打印
  static const String firstPrinterPath = '/rest/2.0/store/card/card/set_print';
}
