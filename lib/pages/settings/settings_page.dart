import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  runApp(const SettingsPage());
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 01,
            channelKey: 'basic_channel',
            title: 'Daily Practice Reminder',
            body: "It's time for your daily practice"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: triggerNotification,
            child: const Text('Notification Test')),
      ),
    );
  }
}
