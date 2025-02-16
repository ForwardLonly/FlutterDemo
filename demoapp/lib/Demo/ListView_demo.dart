import 'package:flutter/material.dart';
import '/Model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: _itemBuiderListItemView,
    );
  }

  Widget _itemBuiderListItemView(BuildContext context, int index) {
    return Container(
      color: Colors.white70,
      margin: EdgeInsets.all(8.0),

      child:Stack(
        children: [
          Column(
            children: [
              AspectRatio(aspectRatio: 16/9, child: Image.network(posts[index].imageUrl, fit: BoxFit.cover)),
              SizedBox(height: 16.0),
              Text(posts[index].title, style: Theme.of(context).textTheme.bodyMedium),
              Text(posts[index].author, style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 16.0),
            ],
          ),
          //  Positioned.fill 表示所有边距都为0
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                // 设置点击的水波纹的颜色
                splashColor: Colors.white10.withAlpha(100),
                // 设置高亮的颜色
                highlightColor: Colors.white30.withAlpha(200),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListDetailView(post: posts[index])));
                }
              ),
            )
          )
        ],
      ),
    );
  }
}

class ListDetailView extends StatelessWidget {

  final Post post;

  const ListDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Image.network(post.imageUrl, fit: BoxFit.cover),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: TextTheme.of(context).titleLarge),
              Text(post.author, style: TextTheme.of(context).titleMedium),
              SizedBox(height: 16.0),
              Text(post.description, style: TextTheme.of(context).titleSmall)
            ]
          ),
        )
      ]),
    );
  }
}