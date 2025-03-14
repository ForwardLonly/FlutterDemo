import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';


class ScanDemo extends StatelessWidget {
  const ScanDemo({super.key});

  void _doBarcodeScan() async {
    var options = ScanOptions(
      // 是否自动打开闪光灯
      autoEnableFlash: true, 
      // 配置文案
      strings: {
         'cancel': '取消', 
         'flash_on': '打开Flash', 
         'flash_off': '关闭Flash'
      }
    );
    var result = await BarcodeScanner.scan(options: options);
    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result.formatNote); // If a unknown format was scanned this field contains a note
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("扫描二维码"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: _doBarcodeScan, child: Text("点击开始扫描二维码")),
      ),
    );
  }
}