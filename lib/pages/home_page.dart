import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/practice_page.dart';
import 'package:flutter_newtricks_test/pages/progress/progress_page.dart';
import 'package:flutter_newtricks_test/pages/guidebook/guidebook_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PracticePage()));
            },
            child: const Text(
              'Practice',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                height: 1,
              ),
            ),
          ),
          const SizedBox(height: 45),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GuidebookPage()));
            },
            child: const Text(
              'Guidebook',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                height: 1,
              ),
            ),
          ),
          const SizedBox(height: 45),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProgressPage()));
            },
            child: const Text(
              'View Progress',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                height: 1,
              ),
            ),
          ),
          const SizedBox(height: 45),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {},
            child: const Text(
              'Help',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                height: 1,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
