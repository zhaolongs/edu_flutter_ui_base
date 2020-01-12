import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewSWPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State {
  List list = [];

  RefreshController refreshController = new RefreshController();

  Widget defaultHeader = defaultTargetPlatform == TargetPlatform.iOS
      ? ClassicHeader(
          idleText: "下拉刷新",
          releaseText: "释放刷新",
          refreshingText: "刷新中",
          failedText: "刷新失败",
          completeText: "刷新成功",
        )
      : MaterialClassicHeader();

  final LoadIndicator defaultFooter = ClassicFooter(
    failedText: "加载失败",
    idleText: "上拉加载更多",
    canLoadingText: "松手加载",
    loadingText: "加载中",
    noDataText: "暂无更多数据",
  );

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 30; i++) {
      list.add("iteme $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView sw"),
      ),
      body: SmartRefresher(
        header: defaultHeader,
        footer: defaultFooter,

        ///是否可以上拉加载
        enablePullUp: true,

        ///是否可以下拉刷新
        enablePullDown: true,

        ///控制器
        controller: refreshController,
        child: buildListView(),
        onRefresh: () {
          print("下拉刷新回调");
          Future.delayed(new Duration(milliseconds: 3000), () {
            refreshController.refreshCompleted();
          });
        },
        onLoading: () {
          print("上拉加载回调");
          Future.delayed(new Duration(milliseconds: 3000), () {
            refreshController.loadComplete();
          });
        },
      ),
    );
  }

  ///用来加载 列表式布局 自带分隔线
  Widget buildListView() {
    return ListView.builder(
      ///用来构建 子条目
      /// index 是条目的角标
      itemBuilder: (BuildContext context, num index) {
        return Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          color: Colors.grey[300],
          height: 88,
          child: Text(list[index]),
        );
      },

      ///数据的个数
      itemCount: list.length,
    );
  }
}
