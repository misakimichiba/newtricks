import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/scroll/scroll_right_page.dart';

void main() {
  runApp(const ScrollUpPage());
}

class ScrollUpPage extends StatefulWidget {
  const ScrollUpPage({super.key});

  @override
  State<ScrollUpPage> createState() => _ScrollUpPageState();
}

class _ScrollUpPageState extends State<ScrollUpPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            if (_counter >= 1)
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScrollRightPage()));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                  )),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Scroll down and tap the button'),
            const SizedBox(
              height: 1000,
            ),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Tap on the button then scroll up'),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                _incrementCounter();
              },
              child: const Text(
                'Tap me',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
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
