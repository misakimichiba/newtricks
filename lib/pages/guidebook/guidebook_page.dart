import 'package:flutter/material.dart';

void main() {
  runApp(const GuidebookPage());
}

class GuidebookPage extends StatefulWidget {
  const GuidebookPage({super.key});

  @override
  State<GuidebookPage> createState() => _GuidebookPageState();
}

class _GuidebookPageState extends State<GuidebookPage> {
  // int _videoIndex = 0;

  // final List _videoURL = [
  //   //URL for wifi connection guide
  //   "https://youtu.be/vjnHrsupqx4?si=ot81tZPcy3hDw0cP",

  //   //URL for increase font size
  //   "https://youtu.be/je6-jcz68ok?si=BM3LMVs-MbPP4Qie",

  //   //URL for silent mode
  //   "https://youtu.be/-Pi1kGDFas0?si=OY4BZW1jVNZZ33eZ",
  // ];

  // late VideoPlayerController _controller;
  // Future<void>? _initializeVideoPlayer;

  // @override
  // void initState() {
  //   _controller = VideoPlayerController.networkUrl(
  //       Uri.parse("https://youtu.be/vjnHrsupqx4?si=ot81tZPcy3hDw0cP"));
  //   _initializeVideoPlayer = _controller.initialize();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [
            // FutureBuilder(
            //     future: _initializeVideoPlayer,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         return AspectRatio(
            //           aspectRatio: _controller.value.aspectRatio,
            //           child: Center(
            //             child: VideoPlayer(_controller),
            //           ),
            //         );
            //       } else {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     })
            ExpansionTile(
              title: Text(
                'How to connect to WiFi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Open your device's Settings app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'How to increase font size',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
              children: <Widget>[
                ListTile(
                    title: Text(
                  'Go to Settings...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    height: 1,
                  ),
                )),
              ],
            ),
            ExpansionTile(
              title: Text(
                'How to turn off Silent Mode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
              children: <Widget>[
                ListTile(
                    title:
                        Text('Go to Settings...', textAlign: TextAlign.center)),
              ],
            ),
            ExpansionTile(
              title: Text(
                'ExpansionTile 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
              children: <Widget>[
                ListTile(
                    title: Text(
                  'This is tile number 1',
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            ExpansionTile(
              title: Text(
                'ExpansionTile 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                ),
              ),
              children: <Widget>[
                ListTile(
                    title: Text('This is tile number 1',
                        textAlign: TextAlign.center)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
