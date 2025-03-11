import 'dart:convert';
import 'package:demoapp/Demo/NewsDemo/NewsDetail_demo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class NewsDemo extends StatefulWidget {
  const NewsDemo({super.key});

  @override
  State<NewsDemo> createState() => _NewsDemoState();
}

class _NewsDemoState extends State<NewsDemo> {
  final ScrollController _scrollController = ScrollController();
  List _newsDataList = [];
  int _page = 1;
  bool _isLoadingData = false;
  bool _hasMoreData = true;

  // 获取网络请求的数据
  void  _getNewDataRequest() async {
    if (_isLoadingData == true ) {
      print("数据加载中，请勿重新加载");
      return;
    }
    if (_hasMoreData == false) {
      print("没有更多的数据了");
      return;
    }
    _isLoadingData = true;
    var apiUri = "https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page";
    print("apiUri = $apiUri");

    final response = await Dio().get(apiUri);
    List resultList = json.decode(response.data)["result"];
    setState(() {
      print("数据请求成功");
      if (_page == 1) {
        _newsDataList = resultList;
      } else {
        _newsDataList.addAll(resultList);
      }
      
      _isLoadingData = false;
      if (resultList.isNotEmpty) {
        _page += 1;
      }

      if (resultList.length < 20) {
        _hasMoreData = false;
      }
    });
  }

  // cell 底部视图的设置
  Widget _newsListCellBottomWidget(int index) {
    if (index == _newsDataList.length - 1) {
      if (_hasMoreData) {
        return CircularProgressIndicator();
      } else {
        return Text("---我也是有底线的---");
      }
    } else {
      return Divider();
    }
  }

  // 显示内容列表
  Widget _showNewsListWidget() {
    if (_newsDataList.isNotEmpty) {
      //  RefreshIndicator 来实现下拉加载的功能
      return RefreshIndicator(
        onRefresh: () async {
          print("下拉加载");
          _page = 1;
          _hasMoreData = true;
          _getNewDataRequest();
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _newsDataList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(_newsDataList[index]["title"]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NewsdetailDemo(cid: _newsDataList[index]["aid"]))
                    );
                  },
                ),
                _newsListCellBottomWidget(index)
              ],
            );
          }, 
        )
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener((){
      double scrollOffsetY =  _scrollController.position.pixels;
      double scrollContentHeight =  _scrollController.position.maxScrollExtent;
      if (scrollOffsetY > scrollContentHeight + 20) { 
        print("上拉加载更多");
        _getNewDataRequest();
      }
    });

    _getNewDataRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("模拟新闻列表上下拉加载 + 加载html的数据"),
      ),
      body: _showNewsListWidget(),
    );
  }
}