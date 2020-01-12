

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'container_home_page.dart';

///flutter应用程序中的入口函数
void main()=>runApp(TextFieldMainApp());
///应用的根布局
class TextFieldMainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ///构建Materia Desin 风格的应用程序
    return MaterialApp(
      ///Android应用程序中任务栏中显示应用的名称
      title: "Container  配制",
      ///默认的首页面
      home: ContainerHomePage(),
    );

  }
}


