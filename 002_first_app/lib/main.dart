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
    var current = appState.current;

    return Scaffold(
      body: Column(
        children: [
          // 提取后的组件，显示当前状态值，通过命名参数传递值
          BigCard(current: current),

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

// 新生成的组件类
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.current, // 命名参数直接绑定到字段
  });

  final WordPair current; // 保存要显示的值

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 获取主题

    // 复制当前字体主题displayMedium样式，把颜色修改为配色方案中的primary色
    final textStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
        color: theme.colorScheme.primary, // 使用配色方案中的primary色
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            current.asLowerCase,
            style: textStyle, // Text组件增加样式
          ),
        ));
  }
}
