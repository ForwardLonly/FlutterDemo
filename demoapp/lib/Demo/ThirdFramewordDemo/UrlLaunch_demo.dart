
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class UrllaunchDemo extends StatefulWidget {
  const UrllaunchDemo({super.key});

  @override
  State<UrllaunchDemo> createState() => _UrllaunchDemoState();
}

class _UrllaunchDemoState extends State<UrllaunchDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("外部应用的跳转"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://www.itying.com');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }, 
                child: Text("打开外部浏览器")
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse('tel:10086');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }, 
                child: Text("拨打电话")
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse('sms:10086');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }, 
                child: Text("发送短信")
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse('weixin://');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }, 
                child: Text("打开微信")
              ),
            ],
          ),
        )
      ),
    );
  }
}
