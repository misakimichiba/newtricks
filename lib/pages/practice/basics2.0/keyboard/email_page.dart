import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/practice_page.dart';

void main() {
  runApp(const EmailPage());
}

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController? controller;
  final String _ans1 = '@';
  final String _ans2 = '.com';
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
                'Type an example of an email (eg: name@gmail.com) and enter'),
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
            if (_text.contains(_ans1) == false ||
                _text.contains(_ans2) == false && _text != '')
              const Text(
                ('Incorrect, please try again'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
              ),
            if (_text.contains(_ans1) == true && _text.contains(_ans2) == true)
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
          ],
        ),
      ),
    );
  }
}
