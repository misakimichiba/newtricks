import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/basics2.0/keyboard/email_page.dart';

void main() {
  runApp(const NumbersPage());
}

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  TextEditingController? controller;
  final String _answer = '0123456789';
  String _text = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                'Type "0123456789" and enter'),
            TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                height: 1,
              ),
              controller: controller,
              onSubmitted: (String value) {
                setState(() {
                  _text = controller!.text;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            if (_text != _answer && _text != '')
              const Text(
                ('Incorrect, please try again'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
              ),
            if (_text == _answer)
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const EmailPage()));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
