# counter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 创建项目

在终端执行：
```sh
flutter create --platforms=android,web,windows --project-name=counter 001m_counter
```
1. --platforms 指定平台
2. --project-name 指定项目名称
3. 001m_counter 指定项目目录

## 运行项目

在终端执行：`flutter run -d windows`

1. -d 指定运行设备。可以是windows、chrome、edge、安卓设备等。如果不知道设备名称，可以执行`flutter devices`命令查看。设备名可以是部分字母，只要能唯一区分即可。
2. 默认是debug模式，如果需要指定release模式，可以执行`flutter run -d windows --release`命令。

## 源码

入口文件位于`lib/main.dart`。可以找到入口`main()`函数。

```dart
import 'package:flutter/material.dart';

void main() {
  // flutter框架提供的runApp启动app，需要一个widget作为参数
  runApp(MyApp());
}

// 继承自StatelessWidget
class MyApp extends StatelessWidget {
  // 构造函数，有一个命名参数。如果有key传入，则直接赋值给super.key
  // 完整的写法：const MyApp({Key? key}) : super(key: key);
  const MyApp({super.key});

  // widget都有build方法，必须实现，供flutter框架调用
  // build方法又返回一个widget。为什么不直接把这个widget传给runApp
  // 是因为测试代码便于使用。await tester.pumpWidget(const MyApp());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 创建一个widget作为App的home
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Home 组件类，基本上就是构造函数+创建状态对象
class MyHomePage extends StatefulWidget {
  // 构造函数。命名参数至少要把title传入进来，如果有key就赋值给super.key
  MyHomePage({super.key, required this.title});

  String title;

  // 有状态组件必须要实现createState()，也基本固定就是返回自定义状态对象
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Widget的状态类，私有。状态值以及逻辑都在这个类里面。
class _MyHomePageState extends State<MyHomePage> {
  // 保存状态的字段
  int _counter = 0;

  void _incrementCounter() {
    // 修改状态的函数，要作为参数传递给setState()。这样状态修改后，UI才会改变
    // 此处用了匿名函数
    setState(() {
      _counter++;
    });
  }

  // 本widget的ui长啥样。每次setState被调用，这个函数就会被调用。
  @override
  Widget build(BuildContext context) {
    // 套娃似的，又返回个widget
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // 层层套娃。子widget是父widget的child或者children中的一个。
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 关联处理函数的动作
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // 尾部加个逗号，格式化更友好
    );
  }
}

```
