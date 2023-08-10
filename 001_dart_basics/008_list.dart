void main() {
  var list1 = [1, 2, 3]; // 中括号初始化。类型推断为List<int>
  print(list1.length); // 3 长度
  print(list1[0]); // 1 访问元素0
  list1[1] = -2; // 索引1的元素赋值为-2 [1,-2,3]
  // list1[3] = 4 // RangeError 索引超过数组长度
  list1.add(4); // 尾部追加元素 [1,-2,3,4]
  list1.insert(1, 11); // 索引1的位置插入元素[1,11,-2,3,4]
  var list2 = [0, ...list1]; // ...展开数组 ...?不为空时展开[0,1,11,-2,3,4]
  print(list2.reversed.toList()); // [4,3,-2,11,1,0] 反转后转为数组

  var emptyList = <String>[]; // 指定类型的空数组
  print(emptyList.isEmpty); // true 是否为空

  var nav = ['Home', if (true) 'About']; // 初始化时可以嵌入单行if语句
  print(nav); // [Home, About]
  var list1s = ['d-0', for (var i in list1) 'd-$i']; // 初始化时可以嵌入单行for语句
  print(list1s); // [d-0, d-1, d-11, d--2, d-3, d-4]
}
