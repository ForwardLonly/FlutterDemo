import 'package:demoapp/Demo/Get/CountController.dart';
import 'package:demoapp/Router/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetEasystatusDemo extends StatelessWidget {

  final Countcontroller _countCtr = Get.find();

  GetEasystatusDemo({super.key});

  // getX 简单式数据管理
  void _getXEasyDataStatus() {
    Get.toNamed(Approuter.getEasyStatueTwoName);
  }

  @override
  Widget build(BuildContext context) {
    print("22222");
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Center(child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.0,
              children: [
                ElevatedButton(onPressed: _getXEasyDataStatus, child: Text("简单状态管理")),
                Obx((){ return Text("count = ${_countCtr.count}"); })
              ],
            ),
          )),
    );
  }
}