import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics2.0/keyboard/typing1_page.dart';

void main() {
  runApp(const KeyboardPage());
}

class KeyboardPage extends StatefulWidget {
  const KeyboardPage({super.key});

  @override
  State<KeyboardPage> createState() => _KeyboardPageState();
}

class _KeyboardPageState extends State<KeyboardPage> {
  TextEditingController? controller;
  String _name = '';

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Click on the textbox below and type your name, then submit it to continue'),
            TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                height: 1,
              ),
              controller: controller,
              onSubmitted: (String value) {
                setState(() {
                  _name = controller!.text;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'My name is $_name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                height: 1,
              ),
            ),
            if (_name != '')
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Typing1Page()));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
