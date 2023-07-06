void main() {
  int i = 1; // 整型
  int hex = 0x1a2b; // 16进制
  double d = 6.2; // 浮点
  num n = d; // num 是int和double的超类
  print(n.isNaN); // n不是有效数字则为true
  print(n.isFinite); // 是否是有限制
  print(n.isInfinite); // 是否是正负无穷
  print(n.isNegative); // 是否是负数。-0.0也算。

  var one = int.parse("1"); // 字符串解析为数字
  String oneStr = one.toString(); // 数字转为字符串

  bool b = true; // bool类型
  // ==0; == null // 0和null不代表false，要通过关系运算符比较
}
