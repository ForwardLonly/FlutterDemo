import 'package:demoapp/Demo/Get/Controller/ShopController.dart';
import 'package:get/get.dart';

class ShopBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(() => ShopController());
  }
  
}