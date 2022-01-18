import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:numeric_keyboard_example/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Numeric Keyboard'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                ),
              ),
              Spacer(),
              NumericKeyboard(
                onKeyboardTap: (text) {
                  _controller.text = _controller.text + text;
                },
                leftActionKeyChild: const Icon(Icons.backspace),
                onLeftActionKeyPressed: () {
                  final int textLength = _controller.text.length;
                  if (textLength > 0) {
                    _controller.text =
                        _controller.text.substring(0, textLength - 1);
                  }
                },
              ),
            ],
          )),
    );
  }
}
