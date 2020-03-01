import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/main/main_find_pages.dart';
import 'package:mdemo1/main/main_forum_pages.dart';
import 'package:mdemo1/main/main_home_pages.dart';
import 'package:mdemo1/main/main_my_pages.dart';

import 'main/main_find2_pages.dart';
import 'main/main_find3_pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  ///底部导航栏标题
  List<String> tabTitleList = ["首页", "论坛", "发现", "我的"];

  ///底部导航栏图标 未选中
  List<String> normalIconUrl = ["tab1.png", "tab2.png", "tab3.png", "tab4.png"];
  ///底部导航栏图标 选中
  List<String> selectIconUrl = [
    "tab1fill.png",
    "tab2fill.png",
    "tab3fill.png",
    "tab4fill.png"
  ];

  ///对应的页面
  List<Widget> pageList=[
    ///首页面
    MainHomePage(),
    ///论坛页面
    MainForumPage(),
    ///发现页面
//    MainFind2Page(),
//    MainFindPage(),
    MainFind3Page(),
    ///我的页面
    MainMyPage(),
  ];
  ///记录当前选中的页面
  num selectIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///当前显示的页面
      body: pageList[selectIndex],
      ///底部导航栏
      bottomNavigationBar: BottomNavigationBar(

        ///构建菜单
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==0?selectIconUrl[0]:normalIconUrl[0]}",width: 26,height: 26,),title:Text(tabTitleList[0],style: TextStyle(color: selectIndex==0?Colors.black:Colors.grey),), ),
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==1?selectIconUrl[1]:normalIconUrl[1]}",width: 26,height: 26,),title:Text(tabTitleList[1],style: TextStyle(color: selectIndex==1?Colors.black:Colors.grey,fontSize: 14),),),
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==2?selectIconUrl[2]:normalIconUrl[2]}",width: 26,height: 26,),title:Text(tabTitleList[2],style: TextStyle(color: selectIndex==2?Colors.black:Colors.grey),),),
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==3?selectIconUrl[3]:normalIconUrl[3]}",width: 26,height: 26,),title:Text(tabTitleList[3],style: TextStyle(color: selectIndex==3?Colors.black:Colors.grey),),),
        ],

        ///菜单的点击回调
        onTap: (value){
          setState(() {
            selectIndex=value;
          });
        },
        ///当前选中的页面
        currentIndex: selectIndex,


      ),
    );
  }
}
