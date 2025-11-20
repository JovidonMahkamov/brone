import 'package:brone/features/Add/presentation/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String videoPath;
  const VideoPage({super.key, required this.videoPath});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _controller.value.isInitialized
              ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
              : const CircularProgressIndicator(color: Colors.white),
        ),
        Positioned(
          right: 20,
          bottom: 120,
          child: Column(
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/video/heart.svg')),
                  const SizedBox(height: 5),
                  const Text("411.2K",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/video/comment.svg')),
                  const SizedBox(height: 5),
                  const Text("4 656",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/video/share.svg')),
                  const SizedBox(height: 5),
                  const Text("167",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      AssetImage('assets/video/avatar.png')),
                   SizedBox(width: 10.w),
                  Text(
                    "Uchrashuv uchun",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                   SizedBox(width: 10.w),
                  ElevatedWidget(onPressed: (){}, text: "Obuna",size: 136.w,)
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                'Uchrashuv kafesi Uchrashuv kafesi — do‘stlar...',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
