import 'package:demoapp/Demo/Get/Bindings/BindController.dart';
import 'package:demoapp/Router/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Demo/Explore_demo.dart';
import 'Demo/History_demo.dart';
import 'Demo/MyView_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: true,
      // home: Home(),
      theme: ThemeData(
       appBarTheme: AppBarTheme(
         backgroundColor: Colors.yellow, // 设置导航栏颜色为蓝色
        )
      ),
       // 绑定控制器
      initialBinding: Bindcontroller(),
      // 设置初始化页面
      initialRoute: "/",
      // 设置路由信息
      getPages: Approuter.appRouterPages() ,
      // 设置跳转动画
      defaultTransition: Transition.rightToLeft,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentPageIndex = 0;

  // 提前创建3个视图，当点击tabbar的时候，调用setState的index来去对应的页面
  final List<Widget> pageLists = [
    ExploreDemo(),
    HistoryDemo(),
    MyviewDemo()
  ];

  void _onTapHandler (int index) {
    // 更新状态
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 根据_currentPageIndex展示视图
        body: pageLists[_currentPageIndex],
        // 设置底部tabbar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: _onTapHandler,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "explore"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "history"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "My"
            ),
          ]
        )
      );
    }
}



