/*
 * @Author: your name
 * @Date: 2023-02-16 17:29:26
 * @LastEditTime: 2023-02-16 17:29:26
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}
