import 'package:demoapp/Demo/Get/Controller/CountController.dart';
import 'package:demoapp/Router/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDemo extends StatefulWidget {
  const GetDemo({super.key});

  @override
  State<GetDemo> createState() => _GetDemoState();
}

class _GetDemoState extends State<GetDemo> {

  // 显示GetX 默认的弹框
  void _getXDefaultDialog() {
    Get.defaultDialog(
      title: "默认弹窗",
      middleText: "弹窗的内容",
      cancel: ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("取消")),
      confirm: ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("确认")),
      radius: 15.0
    );
  }

  // 显示GetX Snackbar
  void _getXSnackbar() {
    Get.snackbar(
      "提示标题", 
      "提示内容", 
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0
    );
  }

  // 显示GetX BottomSheet
  void _getXBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Get.isDarkMode ? Colors.white12 :  Colors.white,
        height: 200,
        child: Column(
          children: [
            ListTile(
              onTap: (){
                // 改变主题模式
                Get.changeTheme(ThemeData.light());
                Get.back();
              },
              leading: Icon(Icons.sunny_snowing),
              title: Text("白天模式", style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),),
            ),
            ListTile(
              onTap: (){
                // 改变主题模式
                Get.changeTheme(ThemeData.dark());
                Get.back();
              },
              leading: Icon(Icons.dark_mode),
              title: Text("黑夜模式", style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
            )
          ],
        ),
      )
    );
  }

  // getX 路由跳转
  void _getXRouter() {
    Get.toNamed(Approuter.loginName);
  }

  // getX 响应式数据管理
  void _getXDataStatus() {
    Get.toNamed(Approuter.getDataStatusName);
  }

  // getX 简单式数据管理
  void _getXEasyDataStatus() {
    Get.toNamed(Approuter.getEasyStatueName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX demo"),
      ),
      body: ListView(
        children: [
          // 显示GetX 默认的弹框
          Center(child: Padding(
            padding: EdgeInsets.all(5), 
            child: ElevatedButton(onPressed: _getXDefaultDialog, child: Text("Get-defaultDialog")),)
          ),
          // 显示GetX Snackbar
          Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(onPressed: _getXSnackbar, child: Text("Get-Snackbar")),
          )),
          // 显示GetX BottomSheet
          Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(onPressed: _getXBottomSheet, child: Text("Get-BottomSheet")),
          )),
          // 跳转登录页面
          Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(onPressed: _getXRouter, child: Text("Get 路由跳转")),
          )),
          // 状态管理之数据改变
          Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(onPressed: _getXDataStatus, child: Text("响应式状态管理")),
          )),
           // 简单状态管理
          Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.0,
              children: [
                ElevatedButton(onPressed: _getXEasyDataStatus, child: Text("简单状态管理")),
              ],
            ),
          )),
          // 状态管理之数据改变
          Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(onPressed: (){
              Get.toNamed(Approuter.getShopPageName, arguments: {
                "id": "222222"
              });
            }, child: Text("GetView的使用")),
          )),
        ],
      ),
    );
  }
}