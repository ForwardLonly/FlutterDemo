import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieDemo extends StatefulWidget {
  const ChewieDemo({super.key});

  @override
  State<ChewieDemo> createState() => _ChewieDemoState();
}

class _ChewieDemoState extends State<ChewieDemo> {

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // 初始化播放器
    _initVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  // 初始化播放器
  void _initVideo() async {
    Uri url = Uri.parse(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
    );
    _videoPlayerController = VideoPlayerController.networkUrl(url);
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false
    );
    
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chewie demo-在线播放视频"),
      ),
      body: Center(
        child: _videoPlayerController.value.isInitialized ? AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Chewie(controller: _chewieController),
        ) : CircularProgressIndicator(),
      ),
    );
  }
}