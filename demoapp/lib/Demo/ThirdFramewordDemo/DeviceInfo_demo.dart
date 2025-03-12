import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';


class DeviceInfoDemo extends StatefulWidget {
  const DeviceInfoDemo({super.key});

  @override
  State<DeviceInfoDemo> createState() => _DeviceInfoDemoState();
}

class _DeviceInfoDemoState extends State<DeviceInfoDemo> {

  List<Widget> _contentLit = [];

  void _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    BaseDeviceInfo deviceInfo = await deviceInfoPlugin.deviceInfo;

    var templist = deviceInfo.data.entries.map((e) {
      return ListTile( 
        title: Text(e.key),
        subtitle: Text("${e.value}"),
      ); 
    }).toList();

    setState(() {
      _contentLit = templist;
    });
  }

  @override
  void initState() {
    super.initState();

    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取设备信息"),
      ),
      body: ListView(
        children: _contentLit,
      ),
    );
  }
}