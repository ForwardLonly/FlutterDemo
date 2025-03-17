import 'package:get/get.dart';

class Countcontroller extends GetxController {
  var count = 0.obs;

  void increase() {
    count++;
    // 需要调用update来通知更新
    update();
  }

  void decrease() {
    if (count > 1) {
      count--;
    }
    // 需要调用update来通知更新
    update();
  }
}