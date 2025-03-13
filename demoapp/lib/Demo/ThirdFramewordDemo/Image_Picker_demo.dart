import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// 本地视频播放的逻辑
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {

  final ImagePicker _imagePicker  = ImagePicker();
  XFile? _pickerImage;
  XFile? _pickerVideo;

  // 配置加载本地视频
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  // 拍照
  void _imagePickerCamera() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 800,
      maxWidth: 800
    );
    if (image != null) {
      print(image.path);
      setState(() {
        _pickerVideo = null;
        _pickerImage = image;
      });
    }
  }

  // 相册选择图片
  void _imagePickerGallery() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800,
      maxWidth: 800
    );
    if (image != null) {
      print(image.path);
      setState(() {
        _pickerVideo = null;
        _pickerImage = image;
      });
    } 
  }

  // 相册选择图片-多张
  void _imageMultiPickerGallery() async {
    List<XFile> imageList = await _imagePicker.pickMultiImage();
    if (imageList != null) {
      for (var element in imageList) {
        print(element.path);
      }
    } 
  }

  // 视频-选择相机录制
  void _videoPickerCamera() async {
    final XFile? video = await _imagePicker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      print(video.path);
      await _initVideo(File(video.path));
      setState(() {
        _pickerImage = null;
        _pickerVideo = video;
      });
    }
  }

  // 视频-选择相册
  void _videoPickerGallery() async {
    final XFile? video = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      print(video.path);
      await _initVideo(File(video.path));
      setState(() {
        _pickerImage = null;
        _pickerVideo = video;
      });
    }
  }

  // 显示图片或者显示视频
  Widget _showImageOrVideoWidget() {
    if (_pickerImage != null) {
      return Image.file(File(_pickerImage!.path));
    } else if (_pickerVideo != null) {
      return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(controller: _chewieController)
      );
    } else {
      return Text("请选择图片或者视频");
    }
  }

  // 初始化播放器--用于播放本地视频
  Future _initVideo(File fileDir) async {
    _videoPlayerController = VideoPlayerController.file(fileDir);
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false
    );
  }

  @override
  void dispose() {
    try {
      _videoPlayerController.dispose();
      _chewieController.dispose();
    } catch (e) {
      print(e);
    }
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片选择器"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Center(child: ElevatedButton(
            onPressed: _imagePickerGallery, 
            child: Text("图片-选择相册-单张")
          )),
          Center(child: ElevatedButton(
            onPressed: _imageMultiPickerGallery, 
            child: Text("图片-选择相册-多张")
          )),
          Center(child: ElevatedButton(
            onPressed: _imagePickerCamera, 
            child: Text("图片-选择相机")
          )),
          Center(child: ElevatedButton(
            onPressed: _videoPickerGallery, 
            child: Text("视频-选择相册")
          )),
          Center(child: ElevatedButton(
            onPressed: _videoPickerCamera, 
            child: Text("视频-选择相机")
          )),
          SizedBox(height: 20),
          // 展示图片或者视频
          _showImageOrVideoWidget()
        ],
      ),
    );
  }
}