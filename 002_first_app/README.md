# First APP

官方文档的第一个例子：  
[Your first Flutter app (google.com)](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0)

## 1. 准备工作
### 创建工程

```sh
flutter create --platforms=android,web,windows --project-name=first_app .
```

### 运行

```sh
flutter run -d windows
```
按照终端提示得调试器地址，打开浏览器，输入地址，即可看到运行结果。

### 体验热重载

程序不要退出，直接修改代码，保存，即可看到修改后的结果（体验热重载，提高开发效率）（如果界面没改变，就在浏览器调试窗口右上角点击一下热重载按钮）。

### 增加一个按钮

在主界面column widget的children中增加一个ElevatedButton widget。

## 2. 初步实现 

实现点击按钮后，生成新的字符串；并初步美化界面。

### 入口：main()函数

调用flutter框架的runApp启动App，runApp函数接收一个widget作为参数，这个widget就是App的根widget。

```dart
void main() {
  runApp(MyApp()); 
}
```

### App Widget：MyApp

1. widget都要实现build方法；
2. build方法接收一个context参数，context是widget树中当前widget的上下文，context中包含了widget树中其他widget的信息，例如：当前widget的父widget，当前widget的子widget，当前widget的兄弟widget等。
3. build方法要返回一个widget，这个widget就是当前widget的UI。

```dart
// 继承自无状态Widget，没有私有的会变的状态
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 覆写build方法。创建widget后，flutter框架以context作为参数来调用，以确定此widget的外观。
  @override
  Widget build(BuildContext context) {
    // 要返回一个widget；ChangeNotifierProvider用来作为全局状态管理
    return ChangeNotifierProvider(
      // create属性：一个返回ChangeNotifier的函数，一般都是箭头函数，返回一个自定义的状态对象
      create: (context) => MyAppState(),
      // child属性：一个和此Provider绑定的widget，此处是创建了一个MaterialApp
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(), // 绑定自定义的主界面widget
      ),
    );
  }
}
```

### 自定义的全局状态类：MyAppState

1. 扩展自ChangeNotifier，和ChangeNotifierProvider配套使用
2. 定义了用来保存状态值的字段
3. 定义了操作状态值的方法

```dart
// ChangeNotifier和ChangeNotifierProvider配套使用
class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // 保存状态值的字段

  // 操作状态值的方法
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}
```

### 主界面Widget：MyHomePage

1. 继承自StatelessWidget，没有私有的会变的状态（但通过Provider获取了全局状态）
2. 覆写build方法，当要创建此widget时，flutter框架以context作为参数来调用。
3. build方法中通过context.watch<MyAppState>()获取全局状态，并赋值给变量appState。
4. build方法返回一个widget，此处是Scaffold，其body属性又层层嵌套widget形成了布局。

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过context.watch<MyAppState>()获取全局状态对象。
    // PS：也可以用Provider.of<MyModel>(context, listen: true)来获取。当listen为false的时候，只取值不监听。
    var appState = context.watch<MyAppState>();
    // 获取状态对象中保存的状态值
    var pair = appState.current;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A random AWESOME idea:'),
            BigCard(pair: pair),
            ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next')),
          ],
        ),
      ),
    );
  }
}
```

### 自定义字符串显示Widget：BigCard

1. 私有fianl属性pair用来存储要显示的对象
2. 覆写build方法，flutter框架创建此widget时调用。方法中用存储的值，加上样式，构造了一个Card widget返回。

```dart
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: textStyle,
        ),
      ),
    );
  }
}
```

## 3. 再完善
