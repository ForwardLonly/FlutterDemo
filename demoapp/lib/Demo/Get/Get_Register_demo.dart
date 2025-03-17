import 'package:demoapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetRegisterDemo extends StatelessWidget {
  const GetRegisterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Router Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.back();
            }, child: Text("返回上一个页面")),
            ElevatedButton(onPressed: (){
              Get.offAll(Home());
            }, child: Text("返回根目录")),
          ],
        ),
      ),
    );
  }
}