void main() {
  String s1 = "It's a good idea."; // 双引号，里面可以嵌入单引号
  String s2 = 'It\'s a good idea.'; // 单引号，嵌入的单引号要用转义符

  print(s1 == s2); // true。 相同的字符串会被编译为同一个地址，可以直接比较

  print(s1 + s2); // 字符串可以直接通过+拼接

  print('This is $s2'); // 可以用$进行变量插值
  print('This is type ${s2.runtimeType}'); //表达式插值要用{}包括

  // s1[0] = 'A'; // Dart中字符串没有[]操作符。

  s2 = s1.replaceRange(0, 1, 'A'); // 字符串是常量，无法修改。只能通过替换方法生成新字符串
  print('s1:$s1 replaced:$s2'); // s1不变；s2接收新生成的字符串

  String ms = '''this is 
  a multi line \n
  string.'''; // 三个引号，多行字符串
  print(ms);

  String rs = r'换行符是\n'; // r前缀，不转义字符串
  print(rs);

  String? zs = '';
  print(zs.length); // 0  长度为0
  print(zs.isEmpty); // true 长度0的字符串认为是empty
  zs = null;
  print(zs?.isEmpty); // null。字符串对象是null，和字符串是empty不一样
  print(zs?.length); // null。只要对象是null，空安全操作符就会返回null

  // zs为null或者empty的时候执行某些操作。
  // 写法1：用空合并运算符??写，zs不为null的时候isEmpty被调用；
  // zs为null的时候，空安全符返回null，空合并运算符在对象为null时返回后面的true
  if (zs?.isEmpty ?? true) {
    print('zs is empty');
  }
  // 传统写法，分为两步判断。还是这种写法直观
  if (zs == null || zs.isEmpty) {
    print('zs is empty');
  }

  // 如果zs不为null并且不为empty时, 执行某个操作
  // 传统写法，比较繁琐
  int slen;
  if (zs != null && zs.isNotEmpty) {
    slen = zs.length;
  } else {
    slen = 100;
  }
  // 空合并操作符比较简洁。（用在赋值操作比较方便）
  slen = zs?.length ?? 100;
  print(slen);
}
