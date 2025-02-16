import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  void _handleRadioValueChanged (int? value) {
    setState(() {
      if (value != null) {
        _radioGroupA = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("男"),
                Radio(
                  value: 0, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.green,
                ),
                SizedBox(width: 32.0),
                Text("女"),
                Radio(
                  value: 1, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 32.0),
            RadioListTile(
                  value: 0, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.green,
                  title: Text("Option A"),
                  subtitle: Text("Description"),
                  secondary: Icon(Icons.filter_1_outlined),
                  selected: _radioGroupA == 0,
                ),
                RadioListTile(
                  value: 1, 
                  groupValue: _radioGroupA, 
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.green,
                  title: Text("Option B"),
                  subtitle: Text("Description"),
                  secondary: Icon(Icons.filter_2_outlined),
                  selected: _radioGroupA == 1,
                ),
          ],
        ),
      ),
    );
  }
}