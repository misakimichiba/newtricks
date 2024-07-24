import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/buttons/doubletap_page.dart';

void main() {
  runApp(const ButtonsPage());
}

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
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
              'This is a button, press on it',
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
              onPressed: () {
                _incrementCounter();
              },
              child: const Text(
                'Press me',
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
              'You have pushed the button this many times:',
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
              'Press on the button at least 5 times to go to the next level',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoubleTapPage()));
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
