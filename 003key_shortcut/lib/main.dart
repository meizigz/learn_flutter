import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flutter code sample for [Shortcuts].

void main() => runApp(const ShortcutsExampleApp());

class ShortcutsExampleApp extends StatelessWidget {
  const ShortcutsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shortcuts Sample')),
        body: const Center(
          child: ShortcutsExample(),
        ),
      ),
    );
  }
}

class ShortcutsExample extends StatefulWidget {
  const ShortcutsExample({super.key});

  @override
  State<ShortcutsExample> createState() => _ShortcutsExampleState();
}

class _ShortcutsExampleState extends State<ShortcutsExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // 根widget
    return CallbackShortcuts(
      // 直接将快捷键和动作绑定起来
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          setState(() => count = count + 1);
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          setState(() => count = count - 1);
        },
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyN): () {
          setState(() => count = count + 1);
        },
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.shift,
            LogicalKeyboardKey.keyN): () {
          setState(() => count = count - 1);
        },
      },
      // 能获取焦点的widget，包裹主UI
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
    );
  }
}
