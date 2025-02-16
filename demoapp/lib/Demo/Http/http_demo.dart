import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  const HttpDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpDemo"),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  const HttpDemoHome({super.key});

  @override
  State<HttpDemoHome> createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  // 发起网络请求的方法
  Future<List<Post>> fetchPost() async {
    final url = Uri.parse('https://resources.ninghao.net/demo/posts.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // 字典数组转模型数组
      List<Post> posts = responseBody["posts"].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception("Fail to fetch post");
    }
  }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder 构建页面
    return FutureBuilder(
      future: fetchPost(), 
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading"),
          );
        }
        final data =  snapshot.data;
        if (data != null) {
          return ListView(
            children: data.map((post) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.imageUrl),
                ),
              );
            }).toList(),
          );
        } else {
          return Center(child: Text("暂无数据"));
        }
      }
    );
  }
}

// 新建数据模型 Post
class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post({required this.id, 
        required this.title, 
        required this.description, 
        required this.author, 
        required this.imageUrl
      });

  // 字典转模型的方法
  Post.fromJson(Map json) 
    : id = json["id"],
      title = json["title"],
      description = json["description"],
      author = json["author"],
      imageUrl = json["imageUrl"];

  // 模型转字典的方法
  Map toJson() => {
    "title": title,
    "description": description
  };
}