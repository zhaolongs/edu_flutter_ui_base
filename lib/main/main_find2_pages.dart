import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/bean/bean_video.dart';
import 'package:video_player/video_player.dart';

import 'item/findI_item_page.dart';
import 'item/home_item_page4.dart';

class MainFind2Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPageState();
  }
}

class MainFindPageState extends State with SingleTickerProviderStateMixin {
  List<VideoModel> videoList = [];

  PageController pageController;

  TabController tabController;

  List<String> topTabList = ["关注", "推荐"];
  List<Widget> topTabListWidget = [];
  List<Widget> bodyPageList = [];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: topTabList.length, vsync: this);
    for (var value in topTabList) {
      topTabListWidget.add(Tab(
        text: value,
      ));
    }
    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "测试数据$i";
      videoModel.pariseCount = i * 22;
      if (i % 3 == 0) {
        videoModel.isAttention = true;
        videoModel.isLike = true;
      } else {
        videoModel.isAttention = false;
        videoModel.isLike = false;
      }
      videoModel.videoImag =
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582996017736&di=101751f6d5b16e03d501001ca62633d4&imgtype=0&src=http%3A%2F%2Fupload.idcquan.com%2F2018%2F0125%2F1516851762394.jpg";
      videoModel.videoUrl =
          "http://pic.studyyoun.com/MaterialApp%E7%BB%84%E4%BB%B6%E7%9A%84%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8.mp4";

      videoList.add(videoModel);
    }

    ///initialPage 初始化第一次默认在第几个。
    ///viewportFraction 占屏幕多少，1为占满整个屏幕
    ///keepPage是否保存当前 Page 的状态，如果保存，下次回复对应保存的 page，initialPage被忽略，如果为 false 。下次总是从 initialPage 开始。

    pageController = new PageController();
    pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return buildRootLayout();
  }

  Widget buildRootLayout() {
    return Scaffold(
      ///可滑动的布局
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: TabBarView(
              controller: tabController,
              children: topTabListWidget
                  .map(
                    (b) => PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {},
                        scrollDirection: Axis.vertical,
                        itemCount: videoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildItemFunction(context, index);
                        }),
                  )
                  .toList(),
            ),
          ),
          Positioned(
            left: 0,
            top: 54,
            right: 0,
            child: Container(
              alignment: Alignment.topCenter,
              child: TabBar(
                controller: tabController,
                tabs: topTabListWidget,
                indicatorWeight :2.0,//指示器高度
                indicatorColor: Colors.white,//指示器颜色
                isScrollable: true,//是否可滚动
                indicatorSize: TabBarIndicatorSize.label,//指示器大小计算方式，
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemFunction(BuildContext context, int index) {
    print("当前滑动 $index");
    VideoModel videoModel = videoList[index];
    return FindItemPage(videoModel);
  }
}
