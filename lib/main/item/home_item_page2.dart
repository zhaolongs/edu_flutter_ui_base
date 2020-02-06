import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mdemo1/base/base_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeItemPage2 extends StatefulWidget {
  num pageIndex;
  String pageTitle;

  HomeItemPage2(this.pageIndex,
      this.pageTitle,);

  @override
  State<StatefulWidget> createState() {
    return HomeItemPageState();
  }
}

class HomeItemPageState extends BasePage<HomeItemPage2> {
  List<String> imageList = [
    "http://img.51miz.com/Element/00/59/61/25/87dbe10e_E596125_03347b73.jpg%21/quality/90/unsharp/true/compress/true/format/jpg",
    "http://www.im2m.com.cn/uploads/5/image/public/201903/20190326094949_ua17d9s68p.jpg",
    "http://www.xa-industrycloud.com/u/cms/www/201712/281752047fkq.jpg",
  ];

  int bannerIndex = 0;

  ScrollController scrollController = new ScrollController();
  ScrollController scrollController2 = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ///下拉刷新头
  Widget refreshHeader =MaterialClassicHeader(
    color: Colors.blue,
    backgroundColor: Colors.white,
  );

  ///下拉刷新头 水滴效果
  Widget refreshWaterDropHeader = WaterDropHeader(
    waterDropColor: Colors.blue,
  );

  Widget refreshClassicHeader = new ClassicHeader();

  ///上拉加载尾
   LoadIndicator refreshFooter = ClassicFooter(
   );

  @override
  Widget build(BuildContext context) {
    ///创建列表
    return Container(
      color: Colors.grey[100],
      child: SmartRefresher(

        header:refreshClassicHeader,
        footer: refreshFooter,

        ///控制器
        controller: refreshController,

        ///上拉加载更多数据
        enablePullUp: true,

        ///下拉刷新数据
        enablePullDown: true,

        ///下拉刷新回调
        onRefresh: onRefresh,

        ///上拉加载更多回调
        onLoading: onLoading,
        child: buildListView(),),);
  }

  Widget buildListView() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 8),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0 && widget.pageIndex == 0) {
            return buildBannerFunction();
          }
          return Container(
            height: 130,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 2),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "这里是标题",
                  style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "山高水长,执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "早起的年轻人",
                      style:
                      TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.thumb_up,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "20",
                      style:
                      TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                    SizedBox(
                      width: 26,
                    ),
                    Icon(
                      Icons.share,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "120",
                      style:
                      TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget buildBannerFunction() {
    return Container(
        height: 200,

        ///轮播图
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Swiper(
                onIndexChanged: (value) {
                  setState(() {
                    bannerIndex = value;
                  });
                },

                ///轮播图个数
                itemCount: 3,

                ///构建子条目
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 200,
                    child: Image.network(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              left: 0,
              top: 0,
              bottom: 0,
              right: 0,
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  "${bannerIndex + 1}/3",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              bottom: 10,
              right: 20,
            )
          ],
        ));
  }

//
}
