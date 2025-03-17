import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GetShopDemo extends StatefulWidget {
  const GetShopDemo({super.key});

  @override
  State<GetShopDemo> createState() => _GetShopDemoState();
}

class _GetShopDemoState extends State<GetShopDemo> {

  @override
  void initState() {
    super.initState();

    print("参数是：${Get.arguments}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Router demo"),
      ),
      body: Center(),
    );;
  }
}
