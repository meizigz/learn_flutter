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

## 3. 添加按钮

修改`MyHomePage`类代码如下：

```dart
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

          // children中增加一个按钮
          ElevatedButton(
              // 传递一个匿名参数，当按钮被按下时调用
              onPressed: () {
                appState.getNext(); // 操作状态对象
              },
              // 传递一个widget作为按钮的显示内容
              child: const Text('Next')),
        ],
      ),
    );
  }
}
```

## 4. 改进外观

1. 把用来显示单词的widget单独提取出来
2. flutter里面层层嵌套，熟悉怎么快速完成widget嵌套

### 准备提取

修改要被提取的控件仅访问所需的内容，避免把过多内容带进去。

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // 把要访问的内容单独保存
    var current = appState.current;

    return Scaffold(
      body: Column(
        children: [
          // 要被提取的Text组件修改为仅访问所需的内容
          Text(current.asLowerCase),

          ElevatedButton(
              onPressed: () {
                appState.getNext(); 
              },
              child: const Text('Next')),
        ],
      ),
    );
  }
}
```

### 提取要修改的组件

1. 选中Text组件，右键，Refactor->Extract Widget
2. 输入提取后新的组件名称，此处输入BigCard。于是得到修改后的代码。

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var current = appState.current;

    return Scaffold(
      body: Column(
        children: [
          // 提取后的组件，显示当前状态值，通过命名参数传递值
          BigCard(current: current),

          ElevatedButton(
              onPressed: () {
                appState.getNext(); 
              },
              child: const Text('Next')),
        ],
      ),
    );
  }
}

// 新生成的组件类
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.current,  // 命名参数直接绑定到字段
  });

  final WordPair current; // 保存要显示的值

  @override
  Widget build(BuildContext context) {
    return Text(current.asLowerCase);
  }
}

```

### 用Card来包裹Text

1. 选中BigCard中的Text组件，右键，Refactor->Wrap with Widget
2. 输入Card，按下Enter键。热重载后可以看到Text像个卡片了。
3. 边距太紧凑，继续选中Text组件，右键，Refactor->Wrap with Padding。修改默认边距为20后，可以效果。

```dart
// 新生成的组件类
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.current, // 命名参数直接绑定到字段
  });

  final WordPair current; // 保存要显示的值

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(current.asLowerCase),
    ));
  }
}
```

### 修改卡片颜色

1. 获取当前的主题
2. 把卡片颜色设置为当前主题配色方案的primary color

```dart
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.current, 
  });

  final WordPair current; 

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 获取主题

    return Card(
        color: theme.colorScheme.primary, // 使用配色方案中的primary色
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(current.asLowerCase),
        ));
  }
}
```

### 改变文字样式

1. 从当前主题复制一份文本样式（复制时通过参数指定修改的属性）
2. 设置Text组件的样式

```dart
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.current, 
  });

  final WordPair current; 

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 获取主题

    // 复制当前主题之字体主题displayMedium样式，把颜色修改为配色方案中的primary色
    final textStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
        color: theme.colorScheme.primary, 
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            current.asLowerCase,
            style: textStyle, // Text组件增加样式
          ),
        ));
  }
}
```

