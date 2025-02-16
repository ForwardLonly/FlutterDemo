import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnDemo();
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            alignment: Alignment(1.0, 0.0), // 值：-1~1 直接
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Icon(Icons.ac_unit, color: Colors.white,size: 32.0),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        IconBadge(Icons.beach_access, size: 64.0,),
        IconBadge(Icons.airplanemode_active)
      ]
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 60.0,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}