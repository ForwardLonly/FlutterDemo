import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://i-blog.csdnimg.cn/blog_migrate/41635df939e6dd13c6d5e2af785d358b.jpeg"),
          // 对齐方法
          alignment: Alignment.topCenter,
          // 重复的样式
          // repeat: ImageRepeat.repeatY
          fit: BoxFit.cover,
          // 颜色混合
          colorFilter: ColorFilter.mode(
            // 颜色值
            Colors.indigoAccent.withAlpha(122),
            // 混合模式
             BlendMode.hardLight
          )
        )
      ),
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 53, 255, 1.0),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(16.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 53, 255, 1.0),
              // 边框
              // border: Border(
              //   top: BorderSide(
              //     color: Colors.orange,
              //     width: 3.0,
              //     style: BorderStyle.solid
              //   ),
              //   bottom: BorderSide(
              //     color: Colors.yellow,
              //     width: 3.0,
              //     style: BorderStyle.solid
              //   ),
              border: Border.all(
                color: Colors.orange,
                width: 3.0,
                style: BorderStyle.solid
              ),
              // 圆角
              // borderRadius: BorderRadius.circular(8.0)
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              // 阴影效果
              boxShadow: [
                BoxShadow(
                  offset: Offset(6.0, 7.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 25.0,
                  spreadRadius: 5.0
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "你好",
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold
        ),
        children: [
          TextSpan(
            text: ",zhuzhu",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.lightGreen,
            )
          )
        ]
      ));
    
  }
}