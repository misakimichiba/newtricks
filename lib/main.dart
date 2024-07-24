import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_newtricks_test/pages/first_page.dart';
import 'package:flutter_newtricks_test/pages/home_page.dart';
import 'package:flutter_newtricks_test/pages/settings/settings_page.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic tests',
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      routes: {
        '/firstpage': (context) => const FirstPage(),
        '/homepage': (context) => const HomePage(),
        '/settingspage': (context) => const SettingsPage(),
      },
    );
  }
}
