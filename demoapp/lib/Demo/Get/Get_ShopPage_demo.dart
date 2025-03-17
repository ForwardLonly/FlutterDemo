
import 'package:demoapp/Demo/Get/Controller/ShopController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class  GetShoppageDemo extends GetView<ShopController> {
  const GetShoppageDemo({super.key});

  @override
  Widget build(BuildContext context) {

    print(Get.arguments);

    return Scaffold(
      appBar: AppBar(
        title: Text("GetView的使用"),
      ),
      body: Obx((){
        return ListView(
          children: controller.dataList.map((value){
            return ListTile(
              title: Text(value),
            );
          }).toList(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.getDataRequest();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}