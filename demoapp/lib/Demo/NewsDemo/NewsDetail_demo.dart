import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NewsdetailDemo extends StatefulWidget {
  final String cid;
  const NewsdetailDemo({super.key, required this.cid});

  @override
  State<NewsdetailDemo> createState() => _NewsdetailDemoState();
}

class _NewsdetailDemoState extends State<NewsdetailDemo> {

  List _resultDetailList = [];

  // 获取详情的数据
  void _getNewsDetailRequest() async {
    String apiUri = "https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${widget.cid}";
    final response = await Dio().get(apiUri);
    final result = json.decode(response.data)["result"];
    setState(() {
      _resultDetailList = result;
    });
  }

  // 内容视图
  Widget _newsDetailWidget() {
    if (_resultDetailList.isNotEmpty) {
      Map resultInfo = _resultDetailList.isNotEmpty ?  _resultDetailList[0] : {};
      return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(resultInfo["title"], textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
            SizedBox(height: 20),
            HtmlWidget(
              resultInfo["content"],
              onTapImage: (imageMetadata) {
                print(imageMetadata);
              },
              onTapUrl: (url) {
                print(url);
                return true;
              },
            )
          ],
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  void initState() {
    super.initState();

    _getNewsDetailRequest();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: _newsDetailWidget(),
    );
  }
}