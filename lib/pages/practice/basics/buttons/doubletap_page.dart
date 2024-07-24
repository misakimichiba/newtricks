import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/buttons/longpress_page.dart';

void main() {
  runApp(const DoubleTapPage());
}

class DoubleTapPage extends StatefulWidget {
  const DoubleTapPage({super.key});

  @override
  State<DoubleTapPage> createState() => _DoubleTapPageState();
}

class _DoubleTapPageState extends State<DoubleTapPage> {
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
              'This is a button, doubletap it (Tap on it twice quickly)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onDoubleTap: () {
                _incrementCounter();
              },
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {},
                child: const Text(
                  'Double Tap me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    height: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'You have double tapped the button this many times:',
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
              'Double tap the button at least 5 times to go to the next level',
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
                            builder: (context) => const LongPressPage()));
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
