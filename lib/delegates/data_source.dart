/*
 * @Author: your name
 * @Date: 2023-02-15 17:58:46
 * @LastEditTime: 2023-02-16 18:09:14
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 */
abstract class ListDataSouceDelegate {
  ListDataSouceDelegate._();

  List? cacheItems;

  int get count => cacheItems?.length ?? 0;

  List? get items => cacheItems;

  set dataSource(List items) {
    cacheItems = items;
  }

  dynamic cellItem(int index) =>
      ((cacheItems?.length ?? 0) > index) ? cacheItems![index] : null;
}
