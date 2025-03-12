import 'package:flutter/material.dart';

class ChewieDemo extends StatefulWidget {
  const ChewieDemo({super.key});

  @override
  State<ChewieDemo> createState() => _ChewieDemoState();
}

class _ChewieDemoState extends State<ChewieDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chewie demo"),
      ),
      body: Center(
        child: Text("Chewie"),
      ),
    );
  }
}