

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/scaffold/scffold_home_page.dart';

///flutter应用程序中的入口函数
void main()=>runApp(ScffoldApp());
///应用的根布局
class ScffoldApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ///构建Materia Desin 风格的应用程序
    return MaterialApp(
      ///Android应用程序中任务栏中显示应用的名称
      title: "demo.scaffold 配制",
      ///默认的首页面
      home: ScffoldHomePage(),
    );
  }
}


