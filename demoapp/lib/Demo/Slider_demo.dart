import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;

  void _handleSliderValueChanged(double? value) {
    setState(() {
      if (value != null) {
        _sliderItemA = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliderDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _sliderItemA, 
              onChanged: _handleSliderValueChanged,
              activeColor: Colors.green,
              inactiveColor: Colors.grey[100],
              min: 0.0, // 设置最小值
              max: 10.0, // 设置最大值
              divisions: 10, // 分割为几份
              label: "${_sliderItemA.toInt()}", // 标签
            ),
            SizedBox(height: 18.0),
            Text("SliderValue: $_sliderItemA")
          ],
        ),
      ),
    );
  }
}