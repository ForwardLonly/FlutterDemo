import 'package:demoapp/Demo/Get/Controller/CountController.dart';
import 'package:get/get.dart';

class Bindcontroller implements Bindings {
  @override
  void dependencies() {
    print("111111");
    Get.lazyPut<Countcontroller>(() => Countcontroller());
  }
  
}