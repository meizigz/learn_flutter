class Person {
  String? firstName;
}

void setFirstName(Object o) {
  print(o is Person); //true. is 类型判断。对象需是指定类型或者其之类
  print(o is! Person); //false. is! 不是指定的类型,和!(o is Person)等效
  (o as Person).firstName = 'Bob'; // as类型转换。被转对象须是指定的类或其子类，否则异常
}

class Paint {
  int? color;
  int? width;
}

void main() {
  var a = 1, b = 10, c; // 赋值：=,+=,*=,-=,/=,~/=,%=。5还有一些&=等等。
  c ??= 8; // ??=。c为空则赋值，否则不变。双??操作符：v1 ?? v2，如果v1不为null返回v1，否则返回v2
  a = a + 1; // 算术：+,-,*,/,++,--,~/【取商】,%【取余】
  assert(b > a); // 关系：>,<,>=,<=,!=,==

  var e = Person();
  setFirstName(e);

  bool ba = false;
  if (!ba && (b < 0) || (c > 0)) // 逻辑运算。!取反；&&与；||或。必须是bool类型
    print("don't know");
  print(a << 1); // 位运算。&与 |或 ^异或 ~取反 <<左移变大 >>右移变小 >>>无符号右移

  bool isPublic = true;
  // 表达式可以用于单行胖箭头函数，语句则不行
  var visibility = isPublic ? 'public' : 'private'; // 条件表达式。条件成立返回前面，否则返回后面
  String playerName(String? name) => name ?? 'Guest'; // 条件表达式。前面不为空则返回前面，否则返回后面

  var foo;
  // foo!.bar = 10;  // 尾部!，判空，如果foo为null则抛出异常

  print(foo?.bar); // 尾部?，条件访问。如果foo不为null则返回bar，否则返回null
  var l;
  print(l?[2]); // null。尾部?，如果l不为空则返回指定元素，否则返回null
  l = [1, 2, 3];
  print(l?[2]); // 3
}
