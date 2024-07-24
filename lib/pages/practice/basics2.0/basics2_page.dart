import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics2.0/keyboard/keyboard_page.dart';
import 'package:flutter_newtricks_test/pages/practice/basics2.0/search/search_page.dart';

void main() {
  runApp(const Basics2Page());
}

class Basics2Page extends StatelessWidget {
  const Basics2Page({super.key});

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
                    MaterialPageRoute(builder: (context) => const KeyboardPage()));
              },
              child: const Text(
                'Keyboard (How to type)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
            ),
            // SizedBox(height: 25),
            // TextButton(
            //   style: ButtonStyle(
            //     foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            //   ),
            //   onPressed: () {
            //     // Navigator.push(
            //     //     context, MaterialPageRoute(builder: (context) => ()));
            //   },
            //   child: Text(
            //     'Sending Messages',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 40,
            //       height: 1,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 25),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SearchPage()));
              },
              child: const Text(
                'Search Bar',
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
