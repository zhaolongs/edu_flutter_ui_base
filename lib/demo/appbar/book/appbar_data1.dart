///4.1 AppBar的基本使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///应用入口 
main() => runApp( MaterialApp(home: FirstPage(),theme: ThemeData(primaryTextTheme: ),));



class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}
class FirstPagetate extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(title: Text("首页标题"),textTheme:TextTheme() ,),
      ///页面的主内容区
      body: Center(child: Text("首页面"),),);
  }
}