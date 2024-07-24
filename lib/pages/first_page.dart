import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/home_page.dart';
import 'package:flutter_newtricks_test/pages/settings/settings_page.dart';
import 'package:flutter_newtricks_test/pages/progress/progress_page.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  final List _pages = [
    //home page
    const HomePage(),

    //profile page
    const ProgressPage(),

    //settings page
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NewTricks',
          style: TextStyle(
            fontFamily: 'Permanent Marker',
            fontSize: 60,
            height: 1,
          ),
        ),
      ),
      body: _pages[_selectedIndex],
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
