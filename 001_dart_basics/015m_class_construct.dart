class Z {
  int? aa;
  Z({this.aa}); // 构造函数的参数可以省略
}

class ZChild extends Z {
  int? cc;
  ZChild({super.aa, this.cc});
}

class A {
  int a = 10;
  // 没有显式声明构造函数，则会有一个编译器生成的默认无参构造函数
}

class B {
  int b = 11;
  int bb = 1111;

  // 和类同名的函数，就是构造函数
  B(int b, int bb) {
    this.b = b;
    this.bb = bb;
  }

  // 类名.函数名。命名构造函数，调用时更清晰。
  B.opposite(int b, int bb) {
    this.b = -b;
    this.bb = -bb;
  }
}

class C {
  int c = 12;
  int cc = 1212;

  // 简便写法。位置参数直接赋值给成员变量
  C(this.c, this.cc);

  // 通过初始化列表进行初始化。会在执行函数体前执行。
  C.opposite(int c, int cc)
      : this.c = -1,
        this.cc = -cc;

  // 简便写法。命名参数要大括号，赋值给成员变量（此处命名参数的类型、名称都根据成员变量获得了）
  C.set2({this.c = 12, required this.cc});

  // 通过this重定向到另外的构造函数
  C.one(int c) : this(c, 12123);
}

class D {
  int d = 13;
  int dd = 1313;

  D(this.d, this.dd);
}

class DChild extends D {
  int dc = 1313;
  int dcd = 131313;

  // 未命名构造函数每个类只能有一个，即便参数列表不一样也只能有一个
  // 此类的超类没有默认构造函数，所以要用super在初始化列表最后调用
  // 执行顺序：初始化列表及列表最后超类符合参数的构造函数、本类的构造函数
  DChild(int dc, int dcd)
      : this.dc = dc,
        this.dcd = dcd,
        super(dc, dcd);

  // 简便写法：位置参数直接赋值给对应的字段
  DChild.initpos(this.dc, this.dcd, super.d, super.dd);

  // 当需要调用超类的默认构造函数时
  // 执行顺序：初始化列表、超类默认构造函数、本类的构造函数
}

class E {
  int e;
  int ee;

  E({this.e = 14, required this.ee});
}

class EChild extends E {
  int ec;
  // 简便写法：命名参数直接赋值给对应的字段。要求超类也是命名参数
  EChild({this.ec = 1415, super.e, required super.ee});
}

void main() {
  var bea = ZChild(aa: 10, cc: 20);
  print(bea.aa);

  var a = A(); // 调用A的默认构造函数
  var b1 = B(10, 1011); // 调用B的有参构造函数
  var b2 = B.opposite(10, 1011); // 调用B的命名构造函数
  var c1 = C(10, 1011); // 调用C的有参构造函数。简便写法对调用者无感
  // 调用C的命名构造函数，命名参数的简便写法对调用者无影响
  // 命名参数的名称就是成员变量的字段名
  var c2 = C.set2(c: 10, cc: 1011);
}
