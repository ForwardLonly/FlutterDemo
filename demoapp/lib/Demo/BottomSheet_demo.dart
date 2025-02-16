import 'package:flutter/material.dart';

class BottomsheetDemo extends StatefulWidget {
  const BottomsheetDemo({super.key});

  @override
  State<BottomsheetDemo> createState() => _BottomsheetDemoState();
}

class _BottomsheetDemoState extends State<BottomsheetDemo> {

  String _choiceString = "Nothing";

  // 需要在Scaffold 中的关联 key
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  void _openModelBottomSheet() {
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200.0,
        child: Column(
          children: [
            ListTile(title: Text("Option A"), onTap: () {
              setState(() {
                _choiceString = "A";
              });
              Navigator.pop(context);
            }),
            ListTile(title: Text("Option B"), onTap: () {
              setState(() {
                _choiceString = "B";
              });
              Navigator.pop(context);
            }),
            ListTile(title: Text("Option C"), onTap: () {
              setState(() {
                _choiceString = "C";
              });
              Navigator.pop(context);
            })
          ],
        ),
      );
    });
  }

  void _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState?.showBottomSheet(
      (BuildContext context){
        return BottomAppBar(
          child: Container(
            height: 90.0,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.pause_circle_outline),
                SizedBox(width: 16.0),
                Text("Bottom sheet"),
                Expanded(child: Text("Fix you - Coldplay", textAlign: TextAlign.right))
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text("BottoomSheetDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _openBottomSheet, 
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)
                  ),
                  child: Text("Open BottomSheet")
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _openModelBottomSheet, 
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)
                  ),
                  child: Text("Open Model BottomSheet")
                ),
                
              ]
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text("Your choice is $_choiceString", style: TextStyle(fontSize: 18.0))
              ],
            )
          ],
        ),
      ),
    );
  }
}