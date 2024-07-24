import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics2.0/keyboard/numbers_page.dart';

void main() {
  runApp(const Typing1Page());
}

class Typing1Page extends StatefulWidget {
  const Typing1Page({super.key});

  @override
  State<Typing1Page> createState() => _Typing1PageState();
}

class _Typing1PageState extends State<Typing1Page> {
  TextEditingController? controller;
  final String _answer = 'The quick brown fox jumps over the lazy dog';
  String _text = '';

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
                'Type "The quick brown fox jumps over the lazy dog" and enter'),
            TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                height: 1,
              ),
              controller: controller,
              onSubmitted: (String value) {
                setState(() {
                  _text = controller!.text;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            if (_text != _answer && _text != '')
              const Text(
                ('Incorrect, please try again'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
              ),
            if (_text == _answer)
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NumbersPage()));
                },
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    height: 1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
