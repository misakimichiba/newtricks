import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/practice_page.dart';

void main() {
  runApp(const ScrollLeftPage());
}

class ScrollLeftPage extends StatefulWidget {
  const ScrollLeftPage({super.key});

  @override
  State<ScrollLeftPage> createState() => _ScrollLeftPageState();
}

class _ScrollLeftPageState extends State<ScrollLeftPage> {
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
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(
                width: 450,
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                    'Scroll to the right')),
            if (_counter >= 1)
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PracticePage()));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                  )),
            SizedBox(
              width: 450,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  _incrementCounter();
                },
                child: const Text(
                  'Tap me then scroll to the left',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
