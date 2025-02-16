import 'package:flutter/material.dart';

class Switchdemo extends StatefulWidget {
  const Switchdemo({super.key});

  @override
  State<Switchdemo> createState() => _SwitchdemoState();
}

class _SwitchdemoState extends State<Switchdemo> {
  bool _switchItemA = false;

  void _handleSwitchValueChanged(bool? value) {
    setState(() {
      if (value != null) {
        _switchItemA = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_switchItemA ? "已打开" : "未打开", style: TextStyle(fontSize: 24.0)),
                Switch(
                  value: _switchItemA, 
                  onChanged: _handleSwitchValueChanged,
                  activeColor: Colors.lightGreen,
                )
              ],
            ),

            SwitchListTile(
              value: _switchItemA, 
              onChanged: _handleSwitchValueChanged,
              title: Text("Switch Item A"),
              subtitle: Text("Description"),
              secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _switchItemA,
            )
          ],
        ),
      ),
    );
  }
}