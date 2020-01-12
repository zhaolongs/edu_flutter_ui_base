

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/textfeild/textfield_hom_page7.dart';

///flutter应用程序中的入口函数
void main()=>runApp(TextFieldMainApp());
///应用的根布局
class TextFieldMainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ///构建Materia Desin 风格的应用程序
    return MaterialApp(
      ///Android应用程序中任务栏中显示应用的名称
      title: "Text 配制",
      ///默认的首页面
//    home: TextFeildHomePage(),
//    home: TextFeildHomePage2(),
      ///TextField 焦点获取控制篇
//    home: TextFeildHomePage3(),
//      home: TextFeildHomePage4(),
    ///TextField 输入文本 decoration 配置边框样式以及提示文本分析篇
//    home: TextFeildHomePage5(),
      ///TextField TextEditingController 分析篇
//     home: TextFeildHomePage6(),
      home: TextFeildHomePage7(),
    );

  }
}


