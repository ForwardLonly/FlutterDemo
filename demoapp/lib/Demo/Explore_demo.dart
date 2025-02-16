import 'package:flutter/material.dart';
import 'ListView_demo.dart';
import 'Drawer_demo.dart';
import 'Text_demo.dart';
import 'Layout_demo.dart';
import 'PageView_demo.dart';
import 'Material_components.dart';


class  ExploreDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => debugPrint("navigation button is pressed."), 
            icon: Icon(Icons.menu),
            tooltip: "Navigation",
          ),
          actions: [
            IconButton(
              onPressed: () => debugPrint("navigation button is pressed."), 
              icon: Icon(Icons.search),
              tooltip: "search",
            )
          ],
          title: Text("App Demo"),
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: [
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.earbuds)),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            ListViewDemo(),
            TextDemo(),
            // LayoutDemo(),
            MaterialComponents(),
            PageviewDemo()
          ]
        ),
        // 添加侧边栏， 用扫动的手势来显示这个侧边栏
        drawer: DrawerDemo()
     )
    );
  }
}