import 'package:demoapp/Demo/Get/Bindings/BindController.dart';
import 'package:demoapp/Demo/Get/Bindings/ShopBindings.dart';
import 'package:demoapp/Demo/Get/Get_DataStatus_demo.dart';
import 'package:demoapp/Demo/Get/Get_EasyStatusSecond_demo.dart';
import 'package:demoapp/Demo/Get/Get_EasyStatus_demo.dart';
import 'package:demoapp/Demo/Get/Get_ShopPage_demo.dart';
import 'package:demoapp/main.dart';
import 'package:get/get.dart';

import 'package:demoapp/Demo/Get/Get_Login_demo.dart';
import 'package:demoapp/Demo/Get/Get_Register_demo.dart';
import 'package:demoapp/Demo/Get/Get_ShopMiddleware_demo.dart';
import 'package:demoapp/Demo/Get/Get_shop_demo.dart';


class Approuter {
  static String homeName = "/";
  static String loginName = "/login";
  static String registerName = "/register";
  static String shopName = "/shop";
  static String shopMiddleName = "/shopMiddle";
  static String getDataStatusName = "/getDatastatus";
  static String getEasyStatueName = "/getEasyStatue";
  static String getEasyStatueTwoName = "/getEasyStatueTwo";
  static String getShopPageName = "/getShopPageName";

  static List<GetPage> appRouterPages() {
    return [
      GetPage(name: homeName, page:  () => Home()),
      GetPage(name: loginName, page: () => GetLoginDemo()),
      GetPage(name: registerName, page: () => GetRegisterDemo()),
      GetPage(name: shopName, page: () => GetShopDemo()),
      GetPage(name: shopMiddleName, page: () => GetShopDemo(), middlewares: [GetShopmiddlewareDemo()]),
      GetPage(name: getDataStatusName, page: () => GetDatastatusDemo()),
      GetPage(name: getEasyStatueName, page: () => GetEasystatusDemo(), binding: Bindcontroller()),
      GetPage(name: getEasyStatueTwoName, page: () => GetEasystatusSecondDemo()),
      GetPage(name: getShopPageName, page: ()=> GetShoppageDemo(), binding: ShopBindings()),
    ];
  }
  
}