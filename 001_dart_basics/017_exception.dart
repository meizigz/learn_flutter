void throw_any() {
  throw 'Out of llamas!'; // 可以抛出任何对象
}

void main() {
  void distanceTo(int other) => throw UnimplementedError(); // 可以用在胖箭头函数
  try {
    distanceTo(0);
  } on UnimplementedError {
    // 捕获指定的Error
  } on Exception catch (e) {
    // 捕获所有未处理的Exception
  } catch (e, s) {
    // 捕获未处理的exception和error，s是栈信息，可以省略
    print(s);
    rethrow; // 重新抛出，外围的继续try
  } finally {
    // 无论是否有异常都会执行。如果异常没有被捕获，那么执行完后异常被抛出。
  }
}
