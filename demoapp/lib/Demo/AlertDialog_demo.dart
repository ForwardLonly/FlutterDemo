import 'package:flutter/material.dart';

class AlertdialogDemo extends StatefulWidget {
  const AlertdialogDemo({super.key});

  @override
  State<AlertdialogDemo> createState() => _AlertdialogDemoState();
}

class _AlertdialogDemoState extends State<AlertdialogDemo> {

  String _alertDialogChoice = "Nothing";

  void _openAlertDialog() {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("AlertDialog"),
          content: Text("Are you sure about this?"),
          actions: [
            TextButton(
              onPressed: (){
                setState(() {
                  _alertDialogChoice = "cancel";
                });
                Navigator.pop(context);
              }, 
              child: Text("cancel")
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  _alertDialogChoice = "ok";
                });
                Navigator.pop(context);
              }, 
              child: Text("ok")
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
            Text("Your choice is: $_alertDialogChoice"),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _openAlertDialog, 
                  child: Text("Open Alert Dialog")
                )
              ],
            )
          ],
        ),
      )
    );
  }
}