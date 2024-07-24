import 'dart:io';

import 'package:camera/camera.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/practice_page.dart';
import 'package:media_scanner/media_scanner.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  List<File> imagesList = [];
  bool isRearCameraOn = true;

  Future<File> saveImage(XFile image) async {
    final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File('$downloadPath/$fileName');

    try {
      await file.writeAsBytes(await image.readAsBytes());
    } catch (_) {}

    return file;
  }

  void takePicture() async {
    XFile? image;

    if (cameraController.value.isTakingPicture ||
        !cameraController.value.isInitialized) {
      return;
    }

    image = await cameraController.takePicture();

    final file = await saveImage(image);

    setState(() {
      imagesList.add(file);
    });

    MediaScanner.loadMedia(path: file.path);
  }

  void startCamera(int camera) {
    cameraController = CameraController(
      widget.cameras[camera],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    //makes the front app camera start instead of back camera which would be 1
    startCamera(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: takePicture,
          child: const Icon(
            Icons.camera_alt,
            size: 75,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 100,
                      child: CameraPreview(cameraController),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PracticePage()));
                        // main();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          //if statement for rear camera and front camera switching
                          isRearCameraOn = !isRearCameraOn;
                        });
                        isRearCameraOn ? startCamera(0) : startCamera(1);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: isRearCameraOn
                              ? const Icon(
                                  Icons.camera_rear,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.camera_front,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //displays captured images
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, bottom: 75),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: imagesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  height: 100,
                                  width: 100,
                                  opacity: const AlwaysStoppedAnimation(07),
                                  image: FileImage(
                                    File(imagesList[index].path),
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
