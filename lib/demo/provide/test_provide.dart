

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/provide/test_model.dart';


///2.8.2 浅谈Provider进行状态管理 配置数据模型 
import 'package:provider/provider.dart';

void main() {
  ///程序入口函数
  runApp(
      ///将Provider配制在程序的最顶层
      ChangeNotifierProvider<TestModel>.value(
        ///value就是监听的数据模型对象
        value: TestModel(),
        ///这里最好是根widget
        child: MyProvideApp(),
      )
  );
}

///2.8.2 浅谈Provider进行状态管理 引用数据并实现数据的修改
class MyProvideApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyProvideApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: Column(
      mainAxisSize: MainAxisSize.min, children: <Widget>[

        ///这里通过调用 Provider.of<TestModel>(context).getTestTitle 来获取数据
      ///这里通过<>中配置的泛型类别来区分所识别的数据模型
      Text("这里是测试使用的数据：${Provider.of<TestModel>(context).getTestTitle}"),

      ///SizedBox用来占一个高度为30的空位
      SizedBox(height: 30,),
      ///FlatButton 这是一个按钮
      FlatButton(child: Text("点击修改文本"), onPressed: () {
        ///Provider.of<TestModel>(context, listen: false)来调用updateText方法更新数据;
        ///这里通过<>中配置的泛型类别来区分所识别的数据类型
        Provider.of<TestModel>(context, listen: false).updateText("哈哈 我来了");
      },)

    ],),),));
  }
}