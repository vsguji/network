/*
 * @Author: your name
 * @Date: 2023-02-15 17:36:37
 * @LastEditTime: 2023-02-23 11:20:12
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /jufubao_shop_app/lib/common/extension/map.dart
 */
extension MapTostructureString on Map {
  String toStructureString() {
    final stringBuffer = StringBuffer();
    forEach((key, value) {
      if (value is List) {
        for (final e in value) {
          stringBuffer.writeln('$key: $e');
        }
      } else if (value is String) {
        stringBuffer.writeln('$key: $value');
      }
    });
    return stringBuffer.toString();
  }
}
