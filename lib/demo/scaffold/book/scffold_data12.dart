

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


  ///3.4.4 bottomNavigationBar页面保活解决方案
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
  BottomNavigationBar buildBottomNavigation(){

    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: normalIcon[0], title: Text(normalTitle[0])),
        new BottomNavigationBarItem(
            icon:  normalIcon[1], title: Text(normalTitle[1])),
        new BottomNavigationBarItem(
            icon:  normalIcon[2], title: Text(normalTitle[2])),
      ],
      ///显示效果
      type: BottomNavigationBarType.fixed,
      ///当前选中的页面
      currentIndex: _tabIndex,
      ///导航栏的背景颜色
      backgroundColor: Colors.white,
      ///选中时图标与文字的颜色
//      fixedColor: Colors.deepPurple,
      ///选中时图标与文字的颜色
      selectedItemColor: Colors.blue,
      ///未选中时图标与文字的颜色
      unselectedItemColor: Colors.grey,
      ///图标的大小
      iconSize: 24.0,
      ///点击事件
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }
}


