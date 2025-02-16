import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with TickerProviderStateMixin {

  late AnimationController animationDemoController;
  late Animation animation;
  late Animation animationColor;
  // 设置动画曲线
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      vsync: this,
      // 设置动画的时间
      duration: Duration(milliseconds: 3000)
    );

    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceOut);
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor = ColorTween(begin: Colors.green, end: Colors.red).animate(curve);

    // 添加status的监听
    animationDemoController.addStatusListener((AnimationStatus status){
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 销毁 animationDemoController
    animationDemoController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationDemo"),
      ),
      body: Center(
        child: AnimationHeart(
          animations: [animation, animationColor], 
          controller: animationDemoController
        ),
      ),
    );
  }
}

// 基于 AnimatedWidget 创建 AnimationHeart的控件
class AnimationHeart extends AnimatedWidget {

  final List animations;
  final AnimationController controller;

  const AnimationHeart({
    super.key, 
    required this.animations, 
    required this.controller
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: (){
        switch (controller.status) {
          case AnimationStatus.completed:
            // 反转动画
            controller.reverse();
            break;
          default:
            // 开始动画
            controller.forward();
        }
      },
    );
  }
}