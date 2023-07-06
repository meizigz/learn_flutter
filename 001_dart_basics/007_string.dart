void main() {
  String s1 = "It's a good idea."; // 双引号，里面可以嵌入单引号
  String s2 = 'It\'s a good idea.'; // 单引号，嵌入的单引号要用转义符

  print(s1 == s2); // true。 相同的字符串会被编译为同一个地址，可以直接比较

  print(s1 + s2); // 字符串可以直接通过+拼接

  print('This is $s2'); // 可以用$进行变量插值
  print('This is type ${s2.runtimeType}'); //表达式插值要用{}包括

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
}
