# First APP

官方文档的第一个例子：  

[Your first Flutter app (google.com)](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0)

## 1. 准备工作
### 创建工程

```sh
flutter create --platforms=android,web,windows --project-name=first_app .
```

1. 支持的平台
2. 工程的名称
3. 保存到当前目录

### 运行

```sh
flutter run -d windows
```

1. `flutter devices`可以看当前可用设备
2. `-d`是`device`，指定设备。
3. 默认是调试模式，打开浏览器，输入终端提示地址，可以看到调试界面

### 体验热重载提高开发效率

1. 程序不要退出，直接修改代码，保存。
2. 如果界面没改变，就在浏览器调试窗口右上角点击一下热重载按钮。

## 2. 初步实现 

实现点击按钮后，生成新的字符串；并初步美化界面。

### 引用库

找到项目根目录的pubspec.yaml，增加依赖english_words和provider的依赖：
```yaml
dependencies:
  flutter:
    sdk: flutter

  english_words: ^4.0.0
  provider: ^6.0.0
```
保存后，会自动执行`flutter pub get`。

### 修改入口文件代码 lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 要返回一个widget；ChangeNotifierProvider用来作为全局状态管理
    return ChangeNotifierProvider(
      // create参数：一个返回ChangeNotifier的函数，一般都是箭头函数，返回一个自定义的状态对象
      create: (context) => MyAppState(),
      // child参数：一个和此Provider绑定的widget，此处是创建了一个MaterialApp
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        // home参数：绑定自定义的主界面widget
        home: MyHomePage(),
      ),
    );
  }
}

// ChangeNotifier和ChangeNotifierProvider配套使用
class MyAppState extends ChangeNotifier {
  // 保存状态值的字段
  var current = WordPair.random();

  // 操作状态值的方法
  void getNext() {
    current = WordPair.random();
    // 广播状态值改变
    notifyListeners();
  }
}

// 此例中的homepage widget没有私有状态了，所以改成从无状态继承
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过context.watch<MyAppState>()获取全局状态对象。
    // PS：也可以用Provider.of<MyModel>(context, listen: true)来获取。当listen为false的时候，只取值不监听。
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          // 显示当前状态值
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}
```

