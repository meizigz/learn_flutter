var emptyList = <String>[]; // 尖括号。String类型的空数组

abstract class Cache<T> {
  // T 类型占位符
  T getByKey(String key);
  void setByKey(String key, T value);
}

class Foo<T extends Object> {
  // 通过extends关键字限制必须是指定类的子类。不泛的那么厉害。
}

T first<T>(List<T> ts) {
  // 函数也可以使用泛型
  T tmp = ts[0];
  return tmp;
}

void main() {
  var names = ['Bob', 'Tom'];
  // 最常见的调用构造函数时可以使用泛型
  var nameSet = Set<String>.from(names);
  // 也可以交给编译器推断
  first(names);
}
