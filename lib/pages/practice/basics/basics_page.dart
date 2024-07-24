import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/buttons/buttons_page.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/scroll/scroll_page.dart';

void main() {
  runApp(const BasicsPage());
}

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ButtonsPage()));
              },
              child: const Text(
                'Buttons',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ScrollPage()));
              },
              child: const Text(
                'Scroll',
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
