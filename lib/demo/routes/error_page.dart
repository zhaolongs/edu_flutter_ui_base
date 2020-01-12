import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ErrorPageState();
  }
}

class ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Center(
        child: Text(
          "页面找不到了 ~~",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
