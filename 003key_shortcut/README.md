# keyshortcut

键盘快捷键。


## 1. 定义Intent

```dart
class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}
```

## 2. Shortcuts widget作为根组件
### 2.1 其shortcuts参数：一个map对象
把按键绑定的SingleActivator和intent关联到一起。【key->intent】
```dart
shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.arrowUp): IncrementIntent(),
        SingleActivator(LogicalKeyboardKey.arrowDown): DecrementIntent(),
      },
```
### 2.2 其child参数：一个Actions widget
2.2.1 其自身的actions参数又是一个map对象，把intent和CallbackAction关联起来
【intent->action】
2.2.2 其child参数是一个Focus Widget，用来获取焦点。真正的布局就放在焦点里面。
```dart
child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) => setState(() {
              count = count + 1;
            }),
          ),
          DecrementIntent: CallbackAction<DecrementIntent>(
            onInvoke: (DecrementIntent intent) => setState(() {
              count = count - 1;
            }),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: <Widget>[
              const Text('Add to the counter by pressing the up arrow key'),
              const Text(
                  'Subtract from the counter by pressing the down arrow key'),
              Text('count: $count'),
            ],
          ),
        ),
      ),
    );
```

## CallbackShortcuts版：只需要回调

1. CallbackShortcuts的bindings参数可以直接把ShortcutActivator和VoidCallback绑定起来。
2. 其child参数仍然是Focus Widget，用来获取焦点。真正的布局就放在焦点里面。


