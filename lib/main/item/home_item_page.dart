import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum RefreshEnum {
  normal,
  pullTo,

  ///下拉刷新中
  refreshIng,

  ///刷刷中
  pullUp,

  ///释放刷新
}

class HomeItemPage extends StatefulWidget {
  num pageIndex;
  String pageTitle;
  ScrollController parentScrollController;

  HomeItemPage(this.pageIndex, this.pageTitle, this.parentScrollController);

  @override
  State<StatefulWidget> createState() {
    return HomeItemPageState();
  }
}

class HomeItemPageState extends State<HomeItemPage> {
  List<String> imageList = [
    "http://img.51miz.com/Element/00/59/61/25/87dbe10e_E596125_03347b73.jpg%21/quality/90/unsharp/true/compress/true/format/jpg",
    "http://www.im2m.com.cn/uploads/5/image/public/201903/20190326094949_ua17d9s68p.jpg",
    "http://www.xa-industrycloud.com/u/cms/www/201712/281752047fkq.jpg",
  ];

  int bannerIndex = 0;

  RefreshController refreshController = new RefreshController();

  ScrollController scrollController = new ScrollController();
  num mOffset = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.parentScrollController.addListener(() {
      if(widget.parentScrollController.offset<=0){
        print("接收到发监听");
        setState(() {
          mOffset = 0;
        });
      }
    });

    scrollController.addListener(() {
      num offset = scrollController.offset;
      print("list view 滑动到顶部了 $offset");
      if (offset <= 100) {
        setState(() {
          mOffset = offset;
          currentRefreshHeight = offset;
        });
      }
    });
  }

  double defaultRefreshTop = 40.0;
  double currentRefreshTop = 0.0;
  double defalutRefreshHeight = 50;
  double currentRefreshHeight = 0;
  double refreshOpacity = 0;
  RefreshEnum currentRefreshEnum = RefreshEnum.normal;

  @override
  Widget build(BuildContext context) {
    ///创建列表
    return Container(
      color: Colors.grey[100],
      child: Stack(
        children: <Widget>[
          ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: mOffset >0 ? null : scrollController,
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
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
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
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
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
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
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
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
          buildRefresh(),
        ],
      ),
    );
  }

  Widget buildSmartRefresh(Widget childWidth) {
    return SmartRefresher(
      ///上拉加载更多数据
      enablePullUp: false,

      ///下拉刷新数据
      enablePullDown: false,

      ///下拉刷新回调
      onRefresh: onRefresh,

      ///上拉加载更多回调
      onLoading: onLoading,

      child: childWidth,
      controller: refreshController,
    );
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
  onRefresh() async {
    Future.delayed(Duration(milliseconds: 3000), () {
      refreshController.refreshCompleted();
    });
  }

  onLoading() async {
    Future.delayed(Duration(milliseconds: 3000), () {
      refreshController.loadComplete();
    });
  }

  buildRefresh() {
    String refreshText = "";
    double progress = 0;
    if (currentRefreshHeight < 0 &&
        currentRefreshEnum != RefreshEnum.pullUp &&
        currentRefreshEnum != RefreshEnum.refreshIng) {
      if (currentRefreshHeight.abs() < 50) {
        refreshText = "下拉刷新";
        progress = currentRefreshHeight.abs() / defalutRefreshHeight;
        currentRefreshEnum = RefreshEnum.pullTo;
      } else if (currentRefreshHeight.abs() == 50) {
        refreshText = "正在加载中";
        progress = null;
        currentRefreshEnum = RefreshEnum.pullUp;
      } else {
        refreshText = "释放刷新";
        progress = 1;
        currentRefreshEnum = RefreshEnum.pullUp;
      }
      refreshOpacity = progress * 4;
      if (refreshOpacity > 1) {
        refreshOpacity = 1;
      }

      currentRefreshTop = defaultRefreshTop * progress / 2;
    } else {
      if (currentRefreshEnum == RefreshEnum.normal) {
        currentRefreshTop = 0;
        progress = 0.0;
        refreshOpacity = 0;
      } else {
        if (currentRefreshHeight.abs() > defalutRefreshHeight) {
          refreshText = "释放刷新";
        } else {
          refreshText = "刷新中...";
        }

        if (currentRefreshEnum == RefreshEnum.pullUp &&
            currentRefreshEnum != RefreshEnum.refreshIng) {
          currentRefreshEnum = RefreshEnum.refreshIng;
          print("刷新回调");
          Future.delayed(new Duration(milliseconds: 3000), () {
            setState(() {
              currentRefreshEnum = RefreshEnum.normal;
            });
          });
        }

        if (currentRefreshEnum == RefreshEnum.normal) {
          ///释放刷新 回弹中
          ///刷新相关高度固定
          currentRefreshTop = 0;

          ///圆圈循环轮圈
          progress = 0;

          ///刷新控件完全显示出来
          refreshOpacity = 0;
        } else {
          ///释放刷新 回弹中
          ///刷新相关高度固定
          currentRefreshTop = defaultRefreshTop;

          ///圆圈循环轮圈
          progress = null;

          ///刷新控件完全显示出来
          refreshOpacity = 1;
        }
      }
    }

    return Positioned(
      top: currentRefreshTop,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: refreshOpacity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              decoration: BoxDecoration(
                  color: Color.fromARGB(190, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(
                      value: progress,
                    ),
                    width: 22,
                    height: 22,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(refreshText)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
