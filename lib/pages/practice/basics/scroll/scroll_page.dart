import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/scroll/scroll_down_page.dart';

void main() {
  runApp(const ScrollPage());
}

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
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
                'You found me!'),
            const SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScrollDownPage()));
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
