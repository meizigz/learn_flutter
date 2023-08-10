// const必须有初始值
// 编译时就用值替换了，类似于C语言中的“宏”
const v = 100;

class ConstAbc {
  // final 成员要么有初始值，要么用构造函数的初始化写法
  final int a;
  // 类中的const成员必须用static const形式
  static const b = 6;
  // 但是static成员可以不是const的
  static var c = 12;

  // const构造函数访问的成员必须是final或者const的
  const ConstAbc(this.a);
  // 还可以同时拥有非const的构造函数
  ConstAbc.notConst(this.a);
}

class Abc {
  int a;
  Abc(this.a);
}

void main() {
  print(ConstAbc.b); // 6 static成员用类名来访问
  print(ConstAbc.c); // 12

  // const 对象，必须用const构造函数构造（匿名或者命名的都可以）
  const vc = ConstAbc(10);
  print(vc.a); // 10

  // 非const对象，可以用const构造函数
  var nc1 = ConstAbc(8);
  print(nc1.a); // 8
  // 非const对象，也可以用非const构造函数都行
  var nc2 = ConstAbc.notConst(9);
  print(nc2.a); // 9

  // final 对象，对构造函数是否const无要求
  final fc = Abc(4);
  //  fc = Abc(13); // error。因为final变量只能赋值1次
  fc.a = 5; // 但是final对象的成员可以修改值
  print(fc.a); // 5

  // const对象的成员能否修改值？不能。从设计上就是避免产生这种现象，以保证代码的一致性。
  // const构造函数要求类中所有的成员变量都是final的，即使此构造函数未用到此成员
  // 如果const对象的成员是个final对象呢？这个final对象的成员的值是否可以修改？
  // const构造函数要求final对象初始值必须是const的，就要把这个成员改成调用const构造函数
  // 然后这个成员又要求自己的成员是final的，如果是对象成员就要求const，就一直嵌套下去了
  // 所以const对象，其成员也无法修改值，设计上如此，并且在编译阶段就限制住了。
}
