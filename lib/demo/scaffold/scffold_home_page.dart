import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/scaffold/people_item_page.dart';

import 'emal_itme_page.dart';
import 'home_item_page.dart';

class ScffoldHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomePageState();
  }
}

class ScffoldHomePageState extends State<ScffoldHomePage> {

  ///当前选中的页面
  num index =0;

  ///定义三个页面
  List <Widget> pageWidgetList =[
    HomeItemPage(),
    EmalItemPage(),
    PeopleItemPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ///使用 Scaffold 组件来构建应用的基本页面
    /// 页面的架构
    return Scaffold(
      ///定义页面的标题
      appBar: AppBar(
        title: Text("这里是首页"),
      ),
      ///定义的页面的主体内容
      body:pageWidgetList[index],
      ///定义的悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Text("++"),
        ///点击响应事
        onPressed: () {
          print("点击了 FloatingActionButton");
        },
        ///长按提示
        tooltip: "点击了 tooltip s ",
        ///设置悬浮按钮的背景
        backgroundColor: Colors.red,
        ///获取焦点时显示的颜色
        focusColor: Colors.green,
        ///鼠标悬浮在按钮上时显示的颜色
        hoverColor: Colors.yellow,
        ///水波纹颜色
        splashColor: Colors.deepPurple,
        ///定义前景色 主要影响文字的颜色
        foregroundColor: Colors.black,
        ///配制阴影高度 未点击时
        elevation: 0.0,
        ///配制阴影高度 点击时
        highlightElevation: 20.0,
      ),
      ///用来控制  FloatingActionButton 的位置
      ///FloatingActionButtonLocation.endFloat 默认使用 浮动右下角
      ///FloatingActionButtonLocation.endDocked 右下角
      ///FloatingActionButtonLocation.endTop  右上角
      ///FloatingActionButtonLocation.startTop 左上角
      ///FloatingActionButtonLocation.centerFloat 底部中间浮动
      ///FloatingActionButtonLocation.centerDocked 底部中间不浮动
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ///浮动按钮下面的标签 Widget
      persistentFooterButtons: <Widget>[
        Text(
          "sxd",
          style: TextStyle(color: Colors.blue),
        ),
        Text("sxd"),
        Text("sxd"),
        Text("sxd"),
        Text("sxd"),
      ],
      ///左侧拉菜单页面
      drawer: Container(
        color: Colors.grey,
        width: 120,
        child: FlatButton(
          child: Text("关闭左滑菜单"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      ///右侧拉菜单页面
      endDrawer: Container(
        color: Colors.yellow,
        width: 200,
        height: 800,
        child: FlatButton(
          child: Text("关闭右滑菜单"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      ///底部导航菜单栏
      bottomNavigationBar:new BottomNavigationBar(items: <BottomNavigationBarItem>[
        ///参数一 icon 图标
        BottomNavigationBarItem(icon:Icon(Icons.home,color: index==0?Colors.blue:Colors.grey,),title: Text("首页",style: TextStyle(color: index==0?Colors.blue:Colors.grey),) ),
        BottomNavigationBarItem(icon:Icon(Icons.email,color: index==1?Colors.blue:Colors.grey,),title: Text("邮件",style: TextStyle(color: index==1?Colors.blue:Colors.grey),)  ),
        BottomNavigationBarItem(icon:Icon(Icons.people,color: index==2?Colors.blue:Colors.grey,),title: Text("我的",style: TextStyle(color: index==2?Colors.blue:Colors.grey),)  ),
      ],
        ///BottomNavigationBar 的点击事件
        onTap: (flag) {
          print("flag $flag");
          index = flag;
          setState(() {});
        },
        ///当前显示的页面
        currentIndex: index,

      ) ,
    );
  }
}
