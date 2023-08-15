// class 关键字；
class Point {
  int? x; // 实例变量，每个实例互相独立
  int? y; // 每个实例变量都有隐式的Getter方法获取值，一般也还有隐式Setter方法设置值
  static const d = 16; // 静态变量。使用类名访问 Point.d

  // get 关键字定义了一个可以读的属性xy，是运算后得到的，不是直接的变量。
  int get xy => x! + y!; // n = p.xy  !是为了解决空警告
  // set关键字定义了一个可以写的属性。p.xy = 10
  set xy(v) {
    x = v;
    y = v;
  }

  // 有显性构造函数则没有默认无参构造函数了
  Point(int x, int y) {
    this.x = x; // this关键字区分开了同名变量
    this.y = y; // 初始值保存到变量。有简便写法，见下个例子
  }
}

// 不可变对象类，构造函数是const的即可。相同值的const对象指向同一个地址
class ImmutablePoint {
  final int x; // const 构造函数要求所有字段都为final的，初始值后不能再修改
  final int y; // 这样才符合语义上的const对象始终不变
  const ImmutablePoint(int x, int y) // const构造函数不能有函数体
      : this.x = x, // 属性要在初始化列表中赋值
        this.y = y; // 冒号后面加上逗号分隔的语句
  // const ImmutablePoint(this.x, this.y);  // 也可以写为这种简便写法，对属性初始化
}

// abstract抽象类无法实例化（一般用于继承）
abstract class ChildP {
  // 继承此类的之类来实现。 @override 注解说明是覆写的父类
  void doSg(); // 没有方法体，抽象方法
}

void main() {
  Point? p;
  p = Point(2, 3); // 构造新对象。可以不用new关键字
  print(p.runtimeType); // Type 获取对象运行时的实际类型

  int? n;
  n = p.x; // 访问成员变量
  print(n);
  // n = p?.y; // 如果p不为空则返回y成员变量；否则返回null
  const cp = const ImmutablePoint(2, 2); // const 对象只能由const构造函数生成
  print(cp);
}
