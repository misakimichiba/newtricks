import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/practice_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanSuccess = false;

  void _scanSuccess() {
    setState(() {
      isScanSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: const Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1,
                      ),
                      'Move your phone until the QR code is in the center'),
                ),
              )),
              Expanded(
                  flex: 4,
                  child: MobileScanner(
                    controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.noDuplicates),
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      final Uint8List? image = capture.image;
                      for (final barcode in barcodes) {
                        _scanSuccess();
                        //Done in order to check if qr code was scanned correctly
                        print('Barcode found! ${barcode.rawValue}');
                      }
                    },
                  )),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isScanSuccess == true)
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PracticePage()));
                          },
                          child: const Text('Continue')),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
