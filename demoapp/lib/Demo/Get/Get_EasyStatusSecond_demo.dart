import 'package:demoapp/Demo/Get/CountController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetEasystatusSecondDemo extends StatelessWidget {

  final Countcontroller _countCtr = Get.find();

  GetEasystatusSecondDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: Obx((){
          return Text("count = ${_countCtr.count}");
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _countCtr.increase();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}