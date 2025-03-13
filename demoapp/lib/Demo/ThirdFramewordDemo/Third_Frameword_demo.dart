import 'package:demoapp/Demo/ThirdFramewordDemo/Chewie_demo.dart';
import 'package:demoapp/Demo/ThirdFramewordDemo/Connectivity_demo.dart';
import 'package:demoapp/Demo/ThirdFramewordDemo/DeviceInfo_demo.dart';
import 'package:demoapp/Demo/ThirdFramewordDemo/Image_Picker_demo.dart';
import 'package:demoapp/Demo/ThirdFramewordDemo/UrlLaunch_demo.dart';
import 'package:demoapp/Demo/ThirdFramewordDemo/Video_Player_demo.dart';
import 'package:flutter/material.dart';

class ThirdFramewordDemo extends StatelessWidget {
  const ThirdFramewordDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备信息、网络检测、外部应用跳转"),
      ),
      body: Column(
        spacing: 20.0,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DeviceInfoDemo();
              },));
            }, 
            child: Text("获取设备信息")
          )),
          Center(child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ConnectivityDemo();
              }));
            }, 
            child: Text("网络监听")
          )),
          Center(child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UrllaunchDemo();
              }));
            }, 
            child: Text("外部app应用跳转")
          )),
          Center(child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VideoPlayerDemo();
              }));
            }, 
            child: Text("官方的播放器：vidio_play")
          )),
          Center(child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChewieDemo();
              }));
            }, 
            child: Text("其他的播放器:chewie")
          )),
          Center(child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ImagePickerDemo();
              }));
            }, 
            child: Text("图片选择器")
          )),
          
        ],
      ),
    );
  }
}