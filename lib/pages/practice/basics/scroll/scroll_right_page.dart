import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/scroll/scroll_left_page.dart';

void main() {
  runApp(const ScrollRightPage());
}

class ScrollRightPage extends StatefulWidget {
  const ScrollRightPage({super.key});

  @override
  State<ScrollRightPage> createState() => _ScrollRightPageState();
}

class _ScrollRightPageState extends State<ScrollRightPage> {
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
                    'Scroll to the right',)),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScrollLeftPage()));
                },
                child: const Text(
                  'Continue',
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
