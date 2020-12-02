

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/scaffold/book/scffold_home_item1.dart';

///应用入口 
main() =>
    runApp(MaterialApp(
      home: FirstPage(),),);

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}
class FirstThemState extends State<FirstPage> {

  ///选中的标签
  int _tabIndex =0;
  ///图标区
  List<Icon> normalIcon = [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];

  List<String> normalTitle =[
    "首页",
    "消息",
    "我的"
  ];


  ///3.5 BottomAppBar配制底部导航栏菜单
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///页面的头部
      appBar: AppBar(title: Text("标题"),),
      ///页面的主内容区
      body:buildBodyFunction(),
      ///底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBodyFunction(){
    ///帧布局结合透明布局
   return Stack(children: <Widget>[
     Opacity(opacity: _tabIndex==0?1:0,child: ScffoldHomeItemPage(0),),
     Opacity(opacity: _tabIndex==1?1:0,child: ScffoldHomeItemPage(1),),
     Opacity(opacity: _tabIndex==2?1:0,child: ScffoldHomeItemPage(2),),
   ],);
  }

  ///构建底部导航栏
  BottomAppBar buildBottomNavigation(){
    return BottomAppBar(
      //悬浮按钮 与其他菜单栏的结合方式
      shape: CircularNotchedRectangle(),
      // FloatingActionButton和BottomAppBar 之间的差距
      notchMargin: 6.0,
      ///底部导航栏的背景
      color: Colors.white,
      ///Row中的子Widget在水平方向不线性排列
      child: Row(
        ///使用每一个子Widget平均分配Row的宽度
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildBotomItem( 0, Icons.home, "首页"),
          buildBotomItem( 1, Icons.message, "消息"),
          buildBotomItem( 2, Icons.people, "我的"),
        ],
      ),
    );
  }

  ///3.5 BottomAppBar配制底部导航栏菜单  图标与代码的组合
  ///[index] 每个条目对应的角标
  ///[iconData] 每个条目对就的图标
  ///[title] 每个条目对应的标题
  buildBotomItem( int index, IconData iconData, String title) {
    ///未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize=20;
    EdgeInsetsGeometry padding =  EdgeInsets.only(top: 8.0);

    if(_tabIndex==index){
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0,color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      ///tqkh状态图标的大小
      iconSize=25;
      padding =  EdgeInsets.only(top: 6.0);
    }
    ///上下竖直方向排列的图标与标题文字
    Widget padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    ///Row中通过Expanded进权重布局排列
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _tabIndex) {
            setState(() {
              _tabIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}



