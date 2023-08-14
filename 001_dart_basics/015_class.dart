// class 关键字；因为有抽象方法，所以变成了抽象类
class Point {
  int? x; // 实例变量，每个实例互相独立
  int? y; // 每个实例变量都有个隐式的Getter方法来获取值，一般也都还有个隐式Setter方法设置值
  static const d = 16; // 静态变量。使用类名访问

  int get xy => x! + y!; // get 关键字定义了一个可以读的属性xy。!是为了解决空警告
  set xy(v) => x = v; // set关键字定义了一个可以写的属性

  // 有显性构造函数则没有默认无参构造函数了
  Point(this.x, this.y); // 构造函数初始化成员变量，this不能省略

  // 命名构造函数，更容易理解这个构造函数怎么用
  Point.fromJson(Map<String, int> a) {
    x = a['x']; // 如果和局部变量名不冲突，可以省略this
    this.y = a['y'];
  }
  // 调用已有的构造函数（复用代码）
  Point.oneParam(int v) : this(v, 0);
  // 构造函数不能被子类继承
}

class ImmutablePoint {
  final int x; // 相同值的const对象指向同一个地址
  final int y; // final实例变量不能修改值，所以没有隐式的Setter方法
  const ImmutablePoint(this.x, this.y); // const 构造函数要求所有成员都必须是final的
  const ImmutablePoint.unnamed()
      : x = 0, // 也可以用初始化列表初始值。会在函数体之前执行
        y = 0; // ','分割
  // 如果是 late final，那么就要通过方法明确设置值
}

// extends关键字继承；抽象类无法实例化（一般用于继承）
abstract class ChildP extends Point {
  int? c;
  // 父类没有0参数构造函数，所以要明确调用有参父类构造函数，并且要在初始化列表最后调用
  ChildP()
      : c = 0,
        super(0, 0);

  // @override 可以表示重写了一个成员

  void doSg(); // 没有方法体，抽象方法
}

void main() {
  Point? p;
  p = Point(2, 3); // 构造新对象。可以不用new关键字
  int? n;
  n = p.x; // 访问成员变量
  // n = p?.y; // 如果p不为空则返回y成员变量；否则返回null
  p = Point.fromJson({'x': 4, 'y': 5}); // 用标识符构造函数创建新对象
  const cp = const ImmutablePoint(2, 2); // const 对象只能由const构造函数生成
  print(p.runtimeType); // Type 获取对象运行时的实际类型
}
