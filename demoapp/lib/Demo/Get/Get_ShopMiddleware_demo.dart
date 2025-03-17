
import 'dart:math';

import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class  GetShopmiddlewareDemo extends GetMiddleware {
  //  重写跳转页面，例如点击购物，但是如果没有登录，就直接跳转登录页面；登录了就跳转商品页面

  @override
  RouteSettings? redirect(String? route) {
    print("redirect");

    int randomIndex = Random().nextInt(3);

    if (randomIndex == 1) {
      return super.redirect(route); 
    } else {
      return RouteSettings(name: "/login");
    }
  }
}