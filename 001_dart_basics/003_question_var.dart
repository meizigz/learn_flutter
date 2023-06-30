// 可空变量。在类型名称后加上?符号
void main() {
  var name = "Bob"; // 编译器推断为String
  int age = 10; // 局部变量建议用var关键字，交给编译器去推断
  print("$name is $age years old.");

  String cantNullvar; // 不可空变量
  // print(cantNullvar);  // error。不可空变量未赋值前不可使用
  // cantNullvar = null; // error。不可空变量不可赋空值
  cantNullvar = "cantNullvar is not null now"; // 非空值赋值后可以
  print(cantNullvar);

  String? questionVar; // 可空变量
  // 默认值是null，此时类型为Null
  print("questionVar type:${questionVar.runtimeType} value:$questionVar");
  // questionVar = 123;  // error.整型不符合要求
  questionVar = "not null";
  // 类型变为String，赋值也生效了。如果赋值为null，那么类型还会变回Null
  print("questionVar type:${questionVar.runtimeType} value:$questionVar");

  // late关键字延迟初始化。主要用于懒加载（比如真正使用时才从网络加载资源）
  late String? lateName;
  lateName = 'late init'; // 变量使用前必须赋值。因为late关键字把默认值都取消了
  print(lateName); // 使用前不赋值，运行时会抛出LateInitializationError
}
