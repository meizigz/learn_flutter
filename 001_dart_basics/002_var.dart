// var变量和指定类型的变量有些差异。
void main() {
  // 初始化未赋值，被推断为可变变量
  var varType;
  // 类型都是默认值。
  printvar('varType', varType); // TYPE:Null	VALUE:null

  //赋值字符串
  varType = 'abc';
  //类型和值都发生改变。
  printvar('varType', varType); // TYPE:String	VALUE:abc

  //再赋值数字
  varType = 123;
  //类型和值再次改变。
  printvar('varType', varType); // TYPE:int	VALUE:123

  // 初始化时赋值，被推断为int，固定了。
  var fakeVar = 789;
  printvar('fakeVar', fakeVar); // TYPE:int	VALUE:789

  // fakeVar = "def"; // 编译错。无法将字符串赋值给已经被推断为int的变量
}

void printvar(String varName, var v) {
  // 输出变量名、变量运行时类型、变量值
  // 字符串中嵌入变量 $varname；嵌入表达式要加花括号 ${expression}
  print("NAME:$varName\tTYPE:${v.runtimeType}\tVALUE:$v");
}
