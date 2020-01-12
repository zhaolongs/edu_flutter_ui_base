import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击跳转第二个页面"),
          onPressed: (){
            ///跳转第二个页面
            Navigator.of(context).pushNamed("/");
          },
        ),
      ),
    );
  }
}
