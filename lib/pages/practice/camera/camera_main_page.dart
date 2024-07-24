import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/camera/camera_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //create camera property and assign list of available camera devices
  final cameras = await availableCameras();

  runApp(CameraMainPage(
    cameras: cameras,
  ));
}

class CameraMainPage extends StatelessWidget {
  final List<CameraDescription> cameras;
  const CameraMainPage({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraPage(
        cameras: cameras,
      ),
    );
  }
}
