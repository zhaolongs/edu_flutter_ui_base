///2.3 Scaffold 悬浮按钮
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///应用入口 
main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  ///3.2.2 FloatingActionButton的常用属性使用分析 MaterialApp中主题配制
  return MaterialApp(
    home: FirstPage(),
    ///主题配置
    theme: ThemeData(
      ///FAB悬浮按钮主题样式配置
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        ///背景色为红色
        backgroundColor: Colors.red,
        ///点击水波纹颜色为黄色
        splashColor: Colors.yellow,
        ///前景色为紫色
        foregroundColor: Colors.deepPurple,
        ///默认显示下的阴影高度
        elevation: 6.0,
        ///点按下去时阴影的高度
        highlightElevation: 10.0,
        ///不可被点击时的阴影的高度
        disabledElevation: 1.0,
        ///用来指定FAB的形状
        shape:RoundedRectangleBorder(
         /// borderRadius: BorderRadius.all(Radius.circular(4))
        ),
      ),
    ),);
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}
class FirstThemState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///页面的头部
      appBar: AppBar(title: Text("标题"),),
      ///页面的主内容区
      ///可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("显示日期"),),
      ///悬浮按钮
      floatingActionButton: buildFAB1(),);
  }

  ///3.2.1 FloatingActionButton的类型 regular类型
  ///通过new Object方式来创建悬浮按钮 为regular类型
  FloatingActionButton buildFAB1(){
    return FloatingActionButton(
      child: Icon(Icons.add), onPressed: () {},);
  }
}


