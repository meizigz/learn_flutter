import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 文本输入',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 文本输入'),
        ),
        body: Center(
          child: TextField(
            decoration: InputDecoration(
              labelText: '请输入文本',
            ),
          ),
        ),
      ),
    );
  }
}
