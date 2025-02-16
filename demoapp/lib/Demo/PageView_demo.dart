import 'package:flutter/material.dart';
import '../Model/post.dart';

class PageviewDemo  extends StatelessWidget {
  const PageviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PageViewBuilerDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8.0),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 8.0,
      //   mainAxisSpacing: 8.0
      // ), 
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // 设置最大宽度，系统会根据设置最大的宽度，设置每一行设置多少个item
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 3/4
      ),
      itemBuilder: _gridViewBuilderItem);
  }

  Widget _gridViewBuilderItem(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }
}

// 用 GridView.count 的方法创建视图
class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 滚动方向（以垂直方向为例）
      scrollDirection: Axis.vertical,
      // 设置每一行的个数（以垂直方向为例）
      crossAxisCount: 2,
      // 左右间距（以垂直方向为例）
      crossAxisSpacing: 8.0,
      // 上下间距（以垂直方向为例）
      mainAxisSpacing: 8.0,
      // 长和宽的比例（以垂直方向为例）
      childAspectRatio: 2.0/3,
      // 内边距
      padding: EdgeInsets.all(8.0),

      children: _buildGridViewItemDemo(100),
    );
  }

   List<Widget> _buildGridViewItemDemo(int lenght) {
    return List.generate(lenght, (int index) {
      return Container(
          color: Colors.grey[300],
          alignment: Alignment.center,
          child: Text("Item$index~", style: TextStyle(fontSize: 18.0, color: Colors.grey)),
        );
    });
  }
}

// 用PageView.builder的方法创建视图
class PageViewBuilerDemo  extends StatelessWidget {
  const PageViewBuilerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder
    );
  }

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl, 
            fit: BoxFit.cover),
        ),
        Positioned(
          right: 16.0,
          bottom: 16.0,
          child: Column(
            children: [
              Text(posts[index].title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              Text(posts[index].author, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal))
            ],
          )
        )
      ],
    );
  }
}

// 用PageView() 的方法创建视图
class PageViewDemo1 extends StatelessWidget {
  const PageViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      // 设置滚动的方向
      scrollDirection: Axis.horizontal,
      // 设置选中页面的回调
      onPageChanged: (currentPage) {
        print("选中了第$currentPage页");
      },
      controller: PageController(
        // 默认展示第几个页面
        initialPage: 1,
        // 是否记住上次滚动的页面位置
        keepPage: false,
        // 设置页面在屏幕展示的大小，默认为1，全屏展示
        viewportFraction: 0.85

      ),
      children: [
        Container(
          color: Colors.brown,
          alignment: Alignment(0, 0),
          child: Text(
            "ONe",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.purple,
          alignment: Alignment(0, 0),
          child: Text(
            "TWO",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.orange,
          alignment: Alignment(0, 0),
          child: Text(
            "THREE",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}