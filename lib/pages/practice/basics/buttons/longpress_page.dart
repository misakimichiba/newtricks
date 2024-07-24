import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/basics_page.dart';

void main() {
  runApp(const LongPressPage());
}

class LongPressPage extends StatefulWidget {
  const LongPressPage({super.key});

  @override
  State<LongPressPage> createState() => _LongPressPageState();
}

class _LongPressPageState extends State<LongPressPage> {
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
        child: Column(
          children: [
            const Text(
              'This is a button, press it for a long time',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onLongPress: () {
                _incrementCounter();
              },
              onPressed: () {},
              child: const Text(
                'Long Press me',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'You have long pressed the button this many times:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Long press on the button at least 5 times to go to the next level',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            if (_counter >= 5)
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BasicsPage()));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                  )), // Always visible // Only visible if condition is true
          ],
        ),
      ),
    );
  }
}
