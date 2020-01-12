import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppBarHomePageState();
  }
}

class AppBarHomePageState extends State with SingleTickerProviderStateMixin {
  TabController tabController;

  ///初化函数
  /// 在Widget创建的时候
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///配置标题显示到中间
        centerTitle: true,

        ///中间的Widget
        title: Text("标题"),

        ///左边的图标
        leading: Builder(
          builder: (BuildContext ctx) {
            return IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                print("点击了左的按钮");

                ///打开左面的侧拉菜单页面
                Scaffold.of(ctx).openDrawer();
              },
            );
          },
        ),

        ///右侧的按钮区域
        actions: <Widget>[
          Icon(Icons.message),
          Icon(Icons.share),
          Icon(Icons.close),
        ],

        ///标题下面显示一个 Tab 导航栏
//        bottom: new PreferredSize(
//          ///用来配置 bottom 区域的高度
//          preferredSize: const Size.fromHeight(28.0),
//          child: TabPageSelector(
//            controller: tabController,
//
//            ///默认小圆点的背景颜色
//            color: Colors.yellow,
//
//            ///选中时的颜色
//            selectedColor: Colors.red,
//
//            ///小圆点的大小
//            indicatorSize: 14.0,
//          ),
//        ),

      ///用来配置标签
        bottom: TabBar(tabs: <Widget>[
          Tab(text: "标签一",),
          Tab(text: "标签二",),
          Tab(text: "标签三",),
          Tab(text: "标签四",),
        ], controller: tabController, isScrollable: false,
          ///配置标签指示线的颜色
          indicatorColor: Colors.red,
          ///配置标签指示线的高度
          indicatorWeight: 5.0,
          ///配置标签指示线与边线的距离
          ///上下左右 各添加了 1.0 个距离
          indicatorPadding: EdgeInsets.all(1.0),
         ///用来配置标签指示线的宽度
          ///TabBarIndicatorSize.label 指示线与文字等宽
          ///TabBarIndicatorSize.tab 默认 平均分配宽度
         indicatorSize:TabBarIndicatorSize.tab,
          ///选中时label 文字的颜色
          labelColor: Colors.yellow,
          ///选中时 label 的样式
          labelStyle: TextStyle(color: Colors.green, fontSize: 14),
          ///未选中labe 的颜色
          unselectedLabelColor: Colors.white,
          ///未选中时的样式
          unselectedLabelStyle: TextStyle(color: Colors.deepPurple, fontSize: 12),),
      ),

      ///实现滑动的Page
      body: TabBarView(
        children: <Widget>[
          Center(
            child: Text("用来配置 demo.appbar 1"),
          ),
          Center(
            child: Text("用来配置 demo.appbar 2"),
          ),
          Center(
            child: Text("用来配置 demo.appbar 3 "),
          ),
          Center(
            child: Text("用来配置 demo.appbar 4 "),
          )
        ],
        controller: tabController,
      ),
      drawer: Container(
        color: Colors.yellow,
        width: 250,
      ),
    );
  }
}
