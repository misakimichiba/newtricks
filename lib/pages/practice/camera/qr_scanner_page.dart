import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/camera/qr_scan.dart';

class QrScannerPage extends StatelessWidget {
  const QrScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRScanner(),
    );
  }
}
