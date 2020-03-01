
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/bean/bean_video.dart';

import 'item/find_video_page.dart';

class MainFind3Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}

class MainFindPage3State extends State with SingleTickerProviderStateMixin {

  List<String> tabTextList = ["关注", "推荐"];
  List<Tab> tabWidgetList = [];
  TabController tabController;

  ///推荐模拟数据
  List <VideoModel> videoList =[];
  ///关注模拟数据
  List <VideoModel> videoList2 =[];

  @override
  void initState() {
    super.initState();

    for (var value in tabTextList) {
      tabWidgetList.add(Tab(
        text: "$value",
      ));
    }
    tabController = new TabController(length: tabTextList.length, vsync: this);


    ///创建模拟数据

    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "推荐测试数据$i";
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
      "http://pic.studyyoun.com/1583058399368141.mp4";

      videoList.add(videoModel);
    }

    for (int i = 0; i < 3; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "关注测试数据$i";
      videoModel.pariseCount = i * 22;
      videoModel.isAttention = true;
      if (i % 3 == 0) {
        videoModel.isLike = true;
      } else {
        videoModel.isLike = false;
      }
      videoModel.videoImag =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582996017736&di=101751f6d5b16e03d501001ca62633d4&imgtype=0&src=http%3A%2F%2Fupload.idcquan.com%2F2018%2F0125%2F1516851762394.jpg";
      videoModel.videoUrl =
      "http://pic.studyyoun.com/MaterialApp%E7%BB%84%E4%BB%B6%E7%9A%84%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8.mp4";

      videoList2.add(videoModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildRootBody();
  }

  Widget buildRootBody() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: buildTableViewWidget(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 54,
            child: buildTabBarWidget(),
          ),
        ],
      ),
    );
  }
  ///构建 TabBarView
  buildTableViewWidget() {
    return TabBarView(
      controller: tabController,
      children: tabTextList
          .map((value) => buildTableViewItemWidget(value))
          .toList(),
    );
  }
  ///构建顶部标签部分
  buildTabBarWidget() {
    return Container(
      ///对齐在顶部中间
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: tabController,
        tabs: tabWidgetList,
        ///指示器的颜色
        indicatorColor: Colors.white,
        ///指示器的高度
        indicatorWeight: 2.0,
        isScrollable: true,

        ///指示器的宽度与文字对齐
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  /// 用来创建上下滑动的页面
  Widget buildTableViewItemWidget(String value) {

    List<VideoModel> list =[];
    if(value == "推荐"){
      list= videoList;
    }else{
      list = videoList2;
    }
    return PageView.builder(
      /// pageview中 子条目的个数
      itemCount:list.length ,
      /// 上下滑动
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context,int index){
          VideoModel videoModel = list[index];
      return buildPageViewItemWidget(value,videoModel);
    });
  }

  buildPageViewItemWidget(String value, VideoModel videoModel) {
    return FindVideoItemPage(value,videoModel);
  }
}
