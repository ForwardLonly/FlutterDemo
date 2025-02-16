import 'package:flutter/material.dart';
import 'sliver_demo.dart';

class  HistoryDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("历史记录")),
      body: SliverDemo()
    );
  }
}