import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_newtricks_test/pages/first_page.dart';
import 'package:flutter_newtricks_test/pages/settings/settings_page.dart';
import 'package:flutter_newtricks_test/pages/progress/progress_page.dart';
import 'package:flutter_newtricks_test/pages/practice/basics/basics_page.dart';
import 'package:flutter_newtricks_test/pages/practice/basics2.0/basics2_page.dart';
import 'package:flutter_newtricks_test/pages/practice/camera/camera_main_page.dart';
import 'package:flutter_newtricks_test/pages/practice/camera/qr_scanner_page.dart';

void main() {
  runApp(const PracticePage());
}

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  Future<void> camera() async {
    WidgetsFlutterBinding.ensureInitialized();

    //create camera property and assign list of available camera devices
    final cameras = await availableCameras();

    runApp(CameraMainPage(
      cameras: cameras,
    ));
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => _pages[_selectedIndex]));
    });
  }

  int _selectedIndex = 0;

  final List _pages = [
    //home page
    const FirstPage(),

    //profile page
    const ProgressPage(),

    //settings page
    const SettingsPage(),
  ];

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
                    MaterialPageRoute(builder: (context) => const BasicsPage()));
              },
              child: const Text(
                'Basics',
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
                    MaterialPageRoute(builder: (context) => const Basics2Page()));
              },
              child: const Text(
                'Basics 2.0',
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
                camera();
              },
              child: const Text(
                'Camera',
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
                    MaterialPageRoute(builder: (context) => const QrScannerPage()));
              },
              child: const Text(
                'QR Scanner',
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: const [
            //home
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            //profile
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Progress',
            ),
            //settings
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    );
  }
}
