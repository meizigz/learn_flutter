import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextField Example'),
        ),
        body: Center(
          child: TextFieldExample(),
        ),
      ),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  TextEditingController _controller = TextEditingController();
  String _displayText = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateDisplayText(String newText) {
    setState(() {
      _displayText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          onChanged: _updateDisplayText,
          decoration: const InputDecoration(
            labelText: 'Enter some text',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'You entered: $_displayText',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
