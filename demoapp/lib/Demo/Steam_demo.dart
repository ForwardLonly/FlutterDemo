import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class SteamDemo extends StatefulWidget {
  const SteamDemo({super.key});

  @override
  State<SteamDemo> createState() => _SteamDemoState();
}

class _SteamDemoState extends State<SteamDemo> {

  late StreamController _inputController;
  late StreamController _scoreController;
  int score = 0;
  
  @override
  void initState() {

    super.initState();

    _inputController = StreamController.broadcast();
    _scoreController = StreamController.broadcast();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: _scoreController.stream, 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
               return Text("无数据");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
               return Text("等待中");
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                score = score + (snapshot.data as int);
                return Text("得分 = $score");
              } else {
                return Text("无数据");
              }
            } else {
              return Text("完成");
            }

          },
        ),
      ),
      body: Stack(
        children: [
          JiSuanQuestionWidget(
            inputController: _inputController, 
            delayTime: 0, 
            scoreController: _scoreController,
          ),
          JiSuanQuestionWidget(
            inputController: _inputController, 
            delayTime: 1000,
            scoreController: _scoreController,
          ),
          JiSuanQuestionWidget(
            inputController: _inputController, 
            delayTime: 2000,
            scoreController: _scoreController,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: KeyPadWidget(inputController: _inputController),
          )
        ],
      ),
    );
  }
}

//--------问题的视图------
class JiSuanQuestionWidget extends StatefulWidget {
  final int delayTime;
  final StreamController inputController;
  final StreamController scoreController;


  const JiSuanQuestionWidget({
    super.key, 
    required this.inputController, 
    required this.delayTime, 
    required this.scoreController});

  @override
  State<JiSuanQuestionWidget> createState() => _JiSuanQuestionWidgetState();
}

class _JiSuanQuestionWidgetState extends State<JiSuanQuestionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Color _colors;
  late double _marginX;
  late int _a, _b;

  void _resetInitData() {
    int randomIndex = Random().nextInt(Colors.primaries.length);
    _colors = Colors.primaries[randomIndex];
    _marginX = Random().nextDouble()*300;
    int total = Random().nextInt(9) + 1;
    _a = Random().nextInt(total);
    _b = total - _a;
    
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _resetInitData();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.addListener((){
      if (_animationController.status == AnimationStatus.completed) {
        print("动画完成");
        // 表示动画完成
        _resetInitData();
        // 没答对，减一分
        widget.scoreController.add(-1);
        // 要重新开始动画，需要指定 from的值，否者会没有效果
        _animationController.forward(from: 0.0);
      }
    });
    // 延迟2秒后更新状态
    Future.delayed(Duration(milliseconds: widget.delayTime), () {
      _animationController.forward();
    });
    

    widget.inputController.stream.listen((event){
      int sum = _a + _b;
      if (sum == event) {
        _resetInitData();
        // 答对，加3分
        widget.scoreController.add(3);
        // 要重新开始动画，需要指定 from的值，否者会没有效果
        _animationController.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          left: _marginX,
          top: Tween(begin: -50.0, end: 500.0).animate(_animationController).value,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: _colors,
            ),
            child: Text("$_a+$_b=?", style: TextStyle(fontSize: 18),),
          )
        );
      },
    );
  }
}

//--------键盘的视图-------
class KeyPadWidget extends StatelessWidget {
  final StreamController inputController;
  const KeyPadWidget({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    final List<int> keyList = [1, 2,3,4,5,6,7,8,9];
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 5/3,
      children: keyList.map((value){
        return TextButton(
          onPressed: (){
            inputController.add(keyList[value - 1]);
          }, 
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.primaries[value][400]),
            foregroundColor: WidgetStatePropertyAll(Colors.black),
            shape:  WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0), // 设置圆角半径
            ),
          )
          ),
          child: Text("$value", style: TextStyle(fontSize: 24))
        );
      }).toList(),
    );
  }
}