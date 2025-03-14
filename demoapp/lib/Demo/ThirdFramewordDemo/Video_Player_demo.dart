import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({super.key});

  @override
  State<VideoPlayerDemo> createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {

  
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = false;
  double _progress = 0.0;

  // 添加播放状态的订阅，避免每次调用setState 重刷页面
  late StreamController _isPlayingController;
  // 添加播放进度的订阅，避免每次调用setState 重刷页面
  late StreamController _progressController;

  @override
  void initState() {
    super.initState();

    _isPlayingController = StreamController.broadcast();
    _progressController = StreamController.broadcast();

    Uri url = Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _videoPlayerController = VideoPlayerController.networkUrl(url);
    _videoPlayerController.initialize().then((_){
      print("播放器初始化完成");
      // 添加播放器的监听
      _videoPlayerController.addListener(_onVideoChange);
      // 设置自动播放
      _videoPlayerController.play();
      _isPlaying = true;
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _isPlayingController.close();
    _progressController.close();

    super.dispose();
  }

  // 自定义播放器的监听回调的方法
  void _onVideoChange() {
    print("播放器的监听回调");
      if (_videoPlayerController.value.isInitialized) {
        final isPlaying = _videoPlayerController.value.isPlaying;
        if (isPlaying != _isPlaying) {
          _isPlaying = isPlaying;
          _isPlayingController.sink.add(_isPlaying);
        }

        // 更新播放进度
        final position = _videoPlayerController.value.position;
        final duration = _videoPlayerController.value.duration;
        if (duration != null) {
            _progress = position.inMilliseconds / duration.inMilliseconds;
            print("进度 = $_progress");
            _progressController.sink.add(_progress);
        }

        // 检查视频是否播放完毕
        if (position >= duration) {
          print('Video has completed playing.');
          _videoPlayerController.seekTo(Duration.zero); // 重置到开始位置
          _videoPlayerController.pause(); // 暂停播放
          _isPlaying = false;
          _isPlayingController.add(_isPlaying);
        }
      }
  }

  // 播放器的视图
  Widget _palyerViewWidget() {
    if (_videoPlayerController.value.isInitialized) {
      // 初始化成功
      return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Stack(
          children: [
            // 播放器
            VideoPlayer(_videoPlayerController),
            // 添加进度条
            Align(
              alignment: Alignment.bottomCenter,
              child: _progressWidget(),
            )
          ],
        )
      );
    } else {
      // loading视图
      return CircularProgressIndicator();
    }
  }

  // 进度条
  Widget _progressWidget() {
    // 进度条变化比较频繁：用 StreamBuilder 减少内存的消耗
    return  StreamBuilder(
      stream: _progressController.stream, 
      builder: (context, snapshot) {
        print("更新进度条");
        return SizedBox(
          height: 35,
          child: Slider(
            value: _progress,
            onChanged: (value) {
              print("onChanged");
              setState(() {
                _videoPlayerController.seekTo(
                  Duration(
                    milliseconds: (value * _videoPlayerController.value.duration.inMilliseconds).round()
                  )
                );
              });
            },
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video_Player_demo"),
      ),
      body: Center(
        child: _palyerViewWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (_isPlaying) {
            // 正在播放
            _videoPlayerController.pause();
            _isPlaying = false;
          } else {
             _videoPlayerController.play();
             _isPlaying = true;
          }
          _isPlayingController.add(_isPlaying);
        },
        // 这个按钮变化比较频繁：用 StreamBuilder 减少内存的消耗
        child: StreamBuilder(
          stream: _isPlayingController.stream, 
          builder: (context, snapshot) {
            return Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow
            );
          }),
      ),
    );
  }
}