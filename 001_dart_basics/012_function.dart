var _nobleGases = [2, 10, 18, 36, 54, 86, 118];

// 普通函数,Function类型。返回值类型、函数名、参数列表、大括号函数体
bool isNoble(int atomicNumber) {
  return _nobleGases.contains(atomicNumber);
}

// 单表达式箭头函数。箭头后只能是表达式不能是语句，返回值即表达式求值。
bool isNobleA(int atomicNumber) => _nobleGases.contains(atomicNumber);

// 位置参数：按照位置传值的参数，必须和位置一一对应的传值。默认是不可选的，也就是必要参数。
//          位置参数默认不可选，不是不可空，如果想允许可空，正常类型后加'?'即可
// 命名参数：要用大括号包裹起来，调用时通过名字传值，顺序不限。默认是可选的。
void enableFlags(bool bold, // bold是位置参数，必须传值，且限定顺序
    {bool? italic, // 命名参数，大括号包裹
    int? color, // 命名参数因为默认是可选的，所以必须允许可空
    int? bg_color = 10, // 默认值（必须是常量）。只有可选参数才可以设置默认值
    required bool hidden}) // 通过required把命名参数改为必要参数，必须传值
{
  print('$bold $italic $color $hidden');
}

// 位置参数可以用[]变成可选的，但就不能和命名参数一起使用了
// 变成可选的之后就可以有默认值了，如果没有默认值，那么就要可空。
// 有默认值的参数后面不能存在没有默认值的参数
void enableFlags2(bool bold, [int? color, bool italic = false]) {
  print('$bold $italic');
}

int func1() {
  int c = 10; // 局域变量，只能函数内访问
  fi() {
    int b = c + 1; // 可以访问上级函数的变量
    return b; // 闭包。函数结束，b被外部引用了，仍然不会被收回
  }

  return fi();
}

void main() {
  const list = ['apples', 'bananas', 'oranges'];
  list.map((item) {
    // 常规匿名函数。无函数名，有参数列表和函数体。可以作为参数或者赋值给变量
    return item.toUpperCase();
  }).forEach(
      // 箭头匿名函数。一般只有一个表达式。
      // 如果多个表达式，用','分开，用大括号包裹。但这个时候建议就直接用常规匿名函数了。
      (item) => print('$item: ${item.length}'));

  // 命名参数使用名字传值，无需大括号；
  enableFlags(false, italic: false, hidden: true); // false false null true。

  // 闭包保证变量不会释放。不用担心变量的值是随机的或者非法的
  print(func1().toString());
}
