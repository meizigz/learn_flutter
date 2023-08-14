void main() {
  var a = 10;

  // if 语句,else if, else
  if (a > 5) {
    print('a>5');
  } else if (a > 10) {
    print('a>10');
  } else {
    print('a<=5');
  }

  // 用索引的for
  for (var i = 0; i < 5; i++) {
    if (i == 0) continue; // continue 跳过本次循环，开始下一次
    print(i);
    if (i > 3) break; // break 终止循环；
  }

  var l = [0, 1, 2, 3];
  // for-in 遍历。如果想得到索引，可以把list转为map遍历，key就是索引
  for (var n in l) {
    print(n);
  }

  //用对象的forEach也可以遍历
  l.forEach((element) {
    print(element);
  });

  // while循环，直至条件不成立
  while (a > 5) {
    a = a - 1;
  }

  // do-while 先执行一次，直至条件不成立
  do {
    a = a - 1;
  } while (a > 5);

  l
      .where((element) => element > 1) // where先过滤形成一个新可遍历对象（复用了原来的元素）
      .forEach(print); // 新对象再遍历

  var command = 'CLOSED';
  // switch-case
  switch (command) {
    case 'CLOSED': // 空子句
    case 'NOW_CLOSED':
      break;
    default: // 其它值
      break;
  }

  assert(a != 0); // 断言，成立则过，不成立抛出异常。只有调试环境下生效。
}
