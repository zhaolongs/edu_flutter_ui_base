import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScendPageState();
  }
}

class ScendPageState extends State<ScendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
