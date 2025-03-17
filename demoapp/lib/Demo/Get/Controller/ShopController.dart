import 'package:get/get.dart';

class ShopController extends GetxController {
  RxList dataList = [].obs;

  @override
  void onInit() {
    print("onInit");
    super.onInit();
    getDataRequest();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }

  void getDataRequest() {
    dataList.add("新增数据");
  }
}