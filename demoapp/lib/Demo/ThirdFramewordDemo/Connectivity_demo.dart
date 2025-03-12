import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityDemo extends StatefulWidget {
  const ConnectivityDemo({super.key});

  @override
  State<ConnectivityDemo> createState() => _ConnectivityDemoState();
}

class _ConnectivityDemoState extends State<ConnectivityDemo> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  String _stateText = "检测网络中";

  @override void initState() { 
    super.initState(); 

    // 必须要有订阅，如果没有订阅的话，那下次再进来，就检测不到网络的变化了
    _subscription =  Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result){
      print(result);
      if (result.contains(ConnectivityResult.wifi)) {
        setState(() {
          _stateText = "网络连接的Wifi";
        });
      } else if (result.contains(ConnectivityResult.none)) {
        setState(() {
          _stateText = "没有网络连接";
        });
      } else {
        setState(() {
          _stateText = "检测中";
        });
      }
    });
  }

         
  @override void dispose() { 
    _subscription.cancel();
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络监听"),
      ),
      body: Center(child: Text(_stateText)),
    );
  }
}