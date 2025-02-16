import 'package:flutter/material.dart';
import '../Model/post.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("Sliver Demo"),
            // 是否固定
            // pinned: true,
            // 是否跟随屏幕滚动
            floating: true,
            // 伸展空间的高度
            expandedHeight: 168.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "WELCOME, HISTORY Page",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400
                ),
              ),
              background: Image.network(
                "https://img1.baidu.com/it/u=2393008469,1536744558&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500",
                fit: BoxFit.cover
              ),
            ),
          ),
          // 在安全的边距内，设置内容视图
          SliverSafeArea(sliver: SliverPadding(
            padding: EdgeInsets.all(8.0),
            // sliver 没有padding的属性，如果要设置边距，只能用SliverPadding
            sliver: SliverGridDemo(),
          ))
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              clipBehavior: Clip.hardEdge,
              // 阴影
              elevation: 14.0,
              // 阴影 的颜色
              shadowColor: Colors.grey.withAlpha(125),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3/2,
                    child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts[index].title, style: TextStyle(fontSize: 20.0, color: Colors.white)),
                        Text(posts[index].author, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                      ],
                    )
                  )
                ],
              )
            ),
          );
        },
        childCount: posts.length
      ),
    );
  }
}


// 用SliverGrid 创建视图
class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: posts.length,
        (BuildContext context, int index) {
          return Container(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
          );
        }
      ), 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2/3
      )
    );
  }
}