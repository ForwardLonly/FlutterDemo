import 'package:flutter/material.dart';

class SnackbarDemo extends StatefulWidget {
  const SnackbarDemo({super.key});

  @override
  State<SnackbarDemo> createState() => _SnackbarDemoState();
}

class _SnackbarDemoState extends State<SnackbarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBarDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SnackBarButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  const SnackBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('正在注册中....'),
            action: SnackBarAction(label: "OK", onPressed: (){}),
          ),
        );
      }, 
      child: Text("open SnackBar")
    );
  }
}