void main() {
  dynamic d; // 动态类型。和没有初始值的var一个效果（类型和值都会变化）
  print(d); // 默认值null
  d = 123; // 赋值整型
  print(d); // 123
  print(d.runtimeType); // 变为了int
  d = 'ds'; // 赋值字符串
  print(d); // ds
  print(d.runtimeType); // 变为了String

  Object o; // 除Null之外的所有的超类。必须初始化后才可以使用
  // o = null; // error 不可空
  o = 123;
  print(o); // 123
  print(o.runtimeType); // 变为了int
  o = 'oh';
  print(o); // oh
  print(o.runtimeType); // 变为了String
}
