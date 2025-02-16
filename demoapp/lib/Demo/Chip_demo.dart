import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({super.key});

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  List<String> _tags = [
    "Apple", 
    "Banana", 
    "Lenma",
  ];

  String _selectTag = "Nothing";

  List<String> _selectTags = [];

  String _choiceTag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipMode"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Chip(label: Text("Lift")),
                Chip(label: Text("wahaha"), backgroundColor: Colors.orange),
                Chip(label: Text("dongdong"), avatar: CircleAvatar(backgroundColor: Colors.green, child: Text("珠")),),
                Chip(label: Text("wondeful"), avatar: CircleAvatar(backgroundImage: NetworkImage("https://img1.baidu.com/it/u=1368815763,3761060632&fm=253&fmt=auto&app=138&f=JPEG?w=760&h=434"))),
                Chip(label: Text("City"), onDeleted: (){}, deleteIconColor: Colors.red, deleteButtonTooltipMessage: "Will you want to delete this tag?"),
                Divider(color: Colors.grey[200], height: 32.0),
              ],
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _tags.map((tag){
                return Chip(
                  label: Text(tag),
                  onDeleted: (){
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                );
              }).toList()
            ),
            Divider(color: Colors.grey[200], height: 32.0),
            Container(
              height: 32.0,
              child: Text("ActionChipi choice is $_selectTag"),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag){
                return ActionChip(
                  label: Text(tag), 
                  onPressed: (){
                    setState(() {
                      _selectTag = tag;
                    });
                  }
                );
              }).toList()
            ),
            Divider(color: Colors.grey[200], height: 32.0),
            Container(
              height: 32.0,
              child: Text("FliterChip choice is ${_selectTags.toString()}"),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag){
                return FilterChip(
                  label: Text(tag),
                  selected: _selectTags.contains(tag),
                  onSelected: (bool value) {
                    setState(() {
                      if (_selectTags.contains(tag)) {
                        _selectTags.remove(tag);
                      } else {
                        _selectTags.add(tag);
                      }
                    });
                  },
                );
              }).toList()
            ),
            Divider(color: Colors.grey[200], height: 32.0),
            Container(
              height: 32.0,
              child: Text("ChoiceChip choice is $_choiceTag"),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag){
                return ChoiceChip(
                  label: Text(tag),
                  selected: _choiceTag == tag,
                  onSelected: (bool value) {
                    setState(() {
                      _choiceTag = tag;
                    });
                  },
                );
              }).toList()
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags = [
              "Apple", 
              "Banana", 
              "Lenma",
            ];
            _selectTags = [];
            _choiceTag = "";
          });
        }
        ),
    );
  }
}