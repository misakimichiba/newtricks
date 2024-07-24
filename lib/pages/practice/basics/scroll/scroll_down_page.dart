import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/scroll/scroll_up_page.dart';

void main() {
  runApp(const ScrollDownPage());
}

class ScrollDownPage extends StatefulWidget {
  const ScrollDownPage({super.key});

  @override
  State<ScrollDownPage> createState() => _ScrollDownPageState();
}

class _ScrollDownPageState extends State<ScrollDownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Scroll down'),
            const SizedBox(
              height: 1000,
            ),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Scroll down again'),
            const SizedBox(
              height: 1000,
            ),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Scroll down one more time'),
            const SizedBox(
              height: 1000,
            ),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'You found me!'),
            const SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ScrollUpPage()));
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
