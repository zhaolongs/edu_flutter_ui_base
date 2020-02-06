import 'package:custom_refresh_plugin/custom_refresh_page.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/base/base_page.dart';
import 'package:mdemo1/base/common_founction.dart';
import 'item/home_item_page2.dart';

class MainHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainHomePageState();
  }
}

class MainHomePageState extends BasePage with SingleTickerProviderStateMixin {
  TabController tabController;

  List<String> topTabList = [
    "推荐",
    "动态",
    "Java",
    "程序人生",
    "移动开发",
    "数据算法",
    "程序感言",
  ];

  List<Widget> bodyPageList = [];
  ScrollController scrollController = new ScrollController();
  CustomRefreshController customRefreshController =
      new CustomRefreshController();

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: topTabList.length, vsync: this);
    for (int i = 0; i < topTabList.length; i++) {
      bodyPageList.add(new HomeItemPage2(i, topTabList[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildRootLayout();
  }

  Widget buildRootLayout() {
    return Scaffold(
      ///可滑动的布局
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool flag) {
          return [
            SliverAppBar(
              ///用来设置 SliverAppBar 是否固定
              pinned: true,

              ///是否随着滑动来隐藏标题
              floating: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    print("点击了添加");
                  },
                )
              ],
              title: Material(
                color: Colors.grey[400],
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Ink(
//                decoration: BoxDecoration(
//                  color: Colors.grey[400],
//                  borderRadius: BorderRadius.all(Radius.circular(6))
//                ),
                  child: InkWell(
                    onTap: () {
                      print("点击了搜索框");
                    },
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    splashColor: Colors.grey,
                    child: Container(
                      height: 33,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.search,
                            size: 18,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "搜索",
                            style:
                            TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// TabBar 标签栏
              bottom: TabBar(

                /// 设置TabBar中的标签栏是否可以滑动
                ///   false 不可滑动
                  isScrollable: true,

                  ///控制器
                  controller: tabController,

                  ///标签
                  tabs: topTabList
                      .map(
                        (String tabTite) => Tab(
                      text: tabTite,
                    ),
                  )
                      .toList()),
            )
          ];
        },
        body: TabBarView(
          children: bodyPageList,
          controller: tabController,
        ),
      ),
    );
  }

  Future onRefresh() async {}
}
