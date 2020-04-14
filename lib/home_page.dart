import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/main/main_find_pages.dart';
import 'package:mdemo1/main/main_forum_pages.dart';
import 'package:mdemo1/main/main_home_pages.dart';
import 'package:mdemo1/main/main_my_pages.dart';

import 'main/main_find2_pages.dart';
import 'main/main_find3_pages.dart';

import 'package:flutter_guidance_plugin/flutter_guidance_plugin.dart';


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

  GlobalKeyPoint globalKeyPointKey1 = GlobalKeyPoint(GlobalKey(),tipsMessage: "这里是首页哈哈！！！",isShowReact: true,nextString:"我知道了！！");
  GlobalKeyPoint globalKeyPointKey2 = GlobalKeyPoint(GlobalKey(),tipsMessage: "这里是论坛哈哈！！！",isShowReact: true);
  GlobalKeyPoint globalKeyPointKey3 = GlobalKeyPoint(GlobalKey(),tipsMessage: "这里是抖音效果！！！",isShowReact: true);
  GlobalKeyPoint globalKeyPointKey4 = GlobalKeyPoint(GlobalKey(),tipsMessage: "这里是我的页面！！！",isShowReact: true);


  @override
  void initState() {
    super.initState();

    ///方式一

    List<CurvePoint> curvePointList = [];
    for (int i = 0; i < 10; i++) {
      ///创建指引
      CurvePoint curvePoint = CurvePoint(0, 0);
      if(i==0){
        ///x,y 指定指引位置 从0-1 ，手机屏幕左上角开始为（0，0）位置，右下角为(1,1)
        curvePoint.x = double.parse("0.5");
        curvePoint.y = double.parse("0.5");
        ///为引导框内显示的文字
        curvePoint.tipsMessage = "点击这里可 显示可滑动的引导蒙版";
      }else if(i==1){
        curvePoint.x = double.parse("0.5");
        curvePoint.y = double.parse("0.1");
        curvePoint.tipsMessage = "点击这里可 再次显示 引导蒙版";
      }else{
        curvePoint.x = double.parse("0.${_randomBit(3)}");
        curvePoint.y = double.parse("0.${_randomBit(3)}");
        curvePoint.tipsMessage = "这是随机的引导消息内容$i";
      }
      curvePointList.add(curvePoint);
    }


    ///方式二
    List<GlobalKeyPoint> globalKeyPointList = [];

    globalKeyPointList.add(globalKeyPointKey1);
    globalKeyPointList.add(globalKeyPointKey2);
    globalKeyPointList.add(globalKeyPointKey3);
    globalKeyPointList.add(globalKeyPointKey4);
    ///页面绘制完成后触发
    WidgetsBinding.instance.addPostFrameCallback((duration) {

      ///页面初始化完成后再构建数据

//      showBeginnerGuidance(context,
//          globalKeyPointList: globalKeyPointList, logs: true, isSlide: true);

//      showBeginnerGuidance(context,
//          curvePointList: curvePointList, logs: true, isSlide: true);
    });

  }

  _randomBit(int len) {
    String scopeF = "123456789"; //首位
    String scopeC = "0123456789"; //中间
    String result = "";
    for (int i = 0; i < len; i++) {
      if (i == 1) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///当前显示的页面
      body: pageList[selectIndex],
      ///底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        ///构建菜单
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==0?selectIconUrl[0]:normalIconUrl[0]}",key:globalKeyPointKey1.key,width: 26,height: 26,),title:Text(tabTitleList[0],style: TextStyle(color: selectIndex==0?Colors.black:Colors.grey),), ),
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==1?selectIconUrl[1]:normalIconUrl[1]}",key:globalKeyPointKey2.key,width: 26,height: 26,),title:Text(tabTitleList[1],style: TextStyle(color: selectIndex==1?Colors.black:Colors.grey,fontSize: 14),),),
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==2?selectIconUrl[2]:normalIconUrl[2]}",key:globalKeyPointKey3.key,width: 26,height: 26,),title:Text(tabTitleList[2],style: TextStyle(color: selectIndex==2?Colors.black:Colors.grey),),),
          BottomNavigationBarItem(icon:Image.asset("images/2.0/${selectIndex==3?selectIconUrl[3]:normalIconUrl[3]}",key:globalKeyPointKey4.key ,width: 26,height: 26,),title:Text(tabTitleList[3],style: TextStyle(color: selectIndex==3?Colors.black:Colors.grey),),),
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
