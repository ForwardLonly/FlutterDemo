import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.greenAccent
          //   ),
          //   child: Text("Header".toUpperCase()),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text("zhuzhu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)), 
            accountEmail: Text("zhuzhu@com.net", style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://img1.baidu.com/it/u=1368815763,3761060632&fm=253&fmt=auto&app=138&f=JPEG?w=760&h=434"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://i-blog.csdnimg.cn/blog_migrate/41635df939e6dd13c6d5e2af785d358b.jpeg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.yellow.withAlpha(150), BlendMode.srcOver)
              )
            ),
          ),
          ListTile(
            title: Text("Message", textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context), // 关闭抽屉
          ),
          ListTile(
            title: Text("Favorite", textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context), // 关闭抽屉
          ),
          ListTile(
            title: Text("Settings", textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context), // 关闭抽屉
          ),
        ],
      ),
    );
  }
}