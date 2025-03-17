import 'package:demoapp/Demo/Get/Get_Register_demo.dart';
import 'package:demoapp/Router/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetLoginDemo extends StatelessWidget {
  const GetLoginDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get router demo"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.back();
            }, child: Text("返回上一个页面")),
            ElevatedButton(onPressed: (){
              Get.off(GetRegisterDemo());
            }, child: Text("跳转注册页面")),
            ElevatedButton(onPressed: (){
              Get.toNamed(Approuter.shopName, arguments: {
                "id": 111111
              });
            }, child: Text("带参数跳转页面")),
            ElevatedButton(onPressed: (){
              Get.toNamed(Approuter.shopMiddleName, arguments: {
                "id": 111111
              });
            }, child: Text("跳转中间件")),
          ],
        ),
      ),
    );
  }
}