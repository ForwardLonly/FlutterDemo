import 'package:flutter/material.dart';

class SimpledialogDemo extends StatefulWidget {
  const SimpledialogDemo({super.key});

  @override
  State<SimpledialogDemo> createState() => _SimpledialogDemoState();
}

class _SimpledialogDemoState extends State<SimpledialogDemo> {

  String _choiceString = "Nothing";

  void _openSimpleDialog()  {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("SimpleDialog"),
          clipBehavior: Clip.none,
          children: [
            SimpleDialogOption(
              onPressed: (){
                setState(() {
                  _choiceString = "A";
                });
                Navigator.pop(context);
              },
              child: Text("Option A"),
            ),
            SimpleDialogOption(
              onPressed: (){
                setState(() {
                  _choiceString = "B";
                });
                Navigator.pop(context);
              },
              child: Text("Option B"),
            ),
            SimpleDialogOption(
              onPressed: (){
                setState(() {
                  _choiceString = "C";
                });
                Navigator.pop(context);
              },
              child: Text("Option C"),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleDialogDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your option is : $_choiceString")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSimpleDialog,
        child: Icon(Icons.format_list_numbered)
      ),
    );
  }
}