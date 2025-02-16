import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  const BottomNavigationBarDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {

  int _currentIndex = 0;
  void _onTapHandler (int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: "explore"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "history"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "list"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "My"
        ),
      ]
    );
  }
}