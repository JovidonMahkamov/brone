import 'package:brone/core/routes/route_names.dart';
import 'package:brone/features/Video/presentation/pages/video_page.dart';
import 'package:flutter/material.dart';

class ShortsMainPage extends StatefulWidget {
  const ShortsMainPage({super.key});

  @override
  State<ShortsMainPage> createState() => _ShortsMainPageState();
}

class _ShortsMainPageState extends State<ShortsMainPage> {
  final List<String> videoList = [
    "assets/video/example.mp4",
    "assets/video/example2.mp4",
    "assets/video/example3.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteNames.videoEdit);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text("Reels Up"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical, // 🔥 SHORTS scroll
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          return VideoPage(videoPath: videoList[index]);
        },
      ),
    );
  }
}
