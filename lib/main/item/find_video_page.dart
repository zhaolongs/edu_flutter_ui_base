import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/bean/bean_video.dart';
import 'package:video_player/video_player.dart';

///播放视频的页面
class FindVideoItemPage extends StatefulWidget {
  String tabValue;
  VideoModel videoModel;
  FindVideoItemPage(this.tabValue, this.videoModel);

  @override
  State<StatefulWidget> createState() {
    return FindVideoItemPageState();
  }
}

class FindVideoItemPageState extends State<FindVideoItemPage> {
  ///创建视频播放控制 器
  VideoPlayerController videoPlayerController;
  ///控制更新视频加载初始化完成状态更新
  Future videoPlayFuture;

  @override
  void initState() {
    super.initState();

    ///网络链接
    videoPlayerController = VideoPlayerController.network(widget.videoModel.videoUrl);
    ///本地链接
//    VideoPlayerController videoPlayerController2 = VideoPlayerController.asset(widget.videoModel.videoUrl);
    ///File形式的视频
//    VideoPlayerController videoPlayerController3 = VideoPlayerController.file(File(widget.videoModel.videoUrl));

    videoPlayFuture = videoPlayerController.initialize().then((_) {
      ///视频初始完成后
      ///调用播放
      videoPlayerController.play();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///播放视频
        buildVideoWidget(),

        ///控制播放视频按钮
        buildControllWidget(),

        ///底部区域的视频介绍
        buildBottmFlagWidget(),

        ///右侧的用户信息按钮区域
        buildRightUserWidget(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  ///播放视频
  buildVideoWidget() {
    ///FutureBuilder会依赖一个Future，
    return FutureBuilder(
      /***
       * future ,FutureBuilder 中依赖的 Future ,
       * 通常是一个异步耗时任务,如这里的 videoPlayFuture   是指向 videoPlayerController 的初始化函数initialize()，这是一个异步的耗时操作
       */
      future: videoPlayFuture,
      ///该构建器会在Future执行的不同阶段被多次调用，构建器签名如下
      builder: (BuildContext contex, AsyncSnapshot snapshot) {
        /**
         * snapshot会包含当前异步任务的状态信息及结果信息 ，
         * 比如我们可以通过snapshot.connectionState获取异步任务的状态信息、
         * 通过snapshot.hasError判断异步任务是否有错误等等
         */
        if (snapshot.connectionState == ConnectionState.done) {
          ///点击事件
          return InkWell(
            onTap: () {

              VideoPlayerValue videoPlayerValue = videoPlayerController.value;

              ///是否初始化完成
              bool initialized = videoPlayerValue.initialized;
              ///是否正在播放
              bool isPlaying = videoPlayerValue.isPlaying;
              ///当前播放的视频的宽高比例
              double aspectRatio = videoPlayerValue.aspectRatio;
              ///当前视频是否缓存
              bool  isBuffer = videoPlayerValue.isBuffering;
              ///当前视频是否循环
              bool isLoop = videoPlayerValue.isLooping;
              ///当前播放视频的总时长
              Duration totalDuration = videoPlayerValue.duration;
              ///当前播放视频的位置
              Duration currentDuration = videoPlayerValue.position;



              if (initialized) {
                /// 视频已初始化
                if (isPlaying) {
                  /// 正播放 --- 暂停
                  videoPlayerController.pause();
                } else {
                  ///暂停 ----播放
                  videoPlayerController.play();
                }

                setState(() {});
              } else {
                ///未初始化
                videoPlayerController.initialize().then((_) {
                  videoPlayerController.play();
                  setState(() {});
                });
              }
            },

            ///居中
            child: Center(
              /// AspectRatio 组件用来设定子组件宽高比
              child: AspectRatio(
                ///设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
                aspectRatio: videoPlayerController.value.aspectRatio,
                ///播放视频的组件
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            ///圆形加载进度
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ///控制播放视频按钮
  buildControllWidget() {
    Widget itemWidget = Container();

    ///当视频暂停时显示按钮
    if (videoPlayerController.value.initialized &&
        !videoPlayerController.value.isPlaying) {
      itemWidget = InkWell(
        onTap: () {
          if (videoPlayerController.value.initialized &&
              !videoPlayerController.value.isPlaying) {
            videoPlayerController.play();
            setState(() {});
          }
        },
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.all(Radius.circular(22))),
          child: Icon(Icons.play_arrow),
        ),
      );
    }

    return Align(
      alignment: Alignment(0, 0),
      child: itemWidget,
    );
  }

  ///底部区域的视频介绍
  buildBottmFlagWidget() {
    return Positioned(
      left: 0,
      right: 64,
      bottom: 0,
      child: Container(
        height: 180,
        padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
        color: Color(0x20ffffff),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "@早起的年轻人",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "三十年河东，三十年河西，看我看我看 的 哈哈？？？？？",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  ///右侧的用户信息按钮区域
  buildRightUserWidget() {
    return Align(
      alignment: Alignment(1, 0.2),
      child: Container(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///用户的信息
            buildUserItem(),

            ///喜欢
            buildLikeWidget(
                assetImage: widget.videoModel.isLike
                    ? "images/2.0/like_icon_2.png"
                    : "images/2.0/like_icon.png",
                msgCount: 232,
                callBack: () {}),

            ///评论
            buildLikeWidget(
                assetImage: "images/2.0/comment_icon.png",
                msgCount: 22,
                callBack: () {
                  showBottomFoncton(1);
                }),

            ///转发
            buildLikeWidget(
                assetImage: "images/2.0/transpond_icon.png",
                msgCount: 32,
                callBack: () {
                  showBottomFoncton(2);
                }),
          ],
        ),
      ),
    );
  }

  buildUserItem() {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0),
            child: ClipOval(
              child: Container(
                width: 44,
                height: 44,
                color: Colors.grey,
                child: CachedNetworkImage(
                  imageUrl: widget.videoModel.videoImag,
                  placeholder: (context, url) => CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          widget.videoModel.isAttention
              ? Container()
              : Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                  ),
                )
        ],
      ),
    );
  }

  buildLikeWidget({String assetImage, int msgCount, callBack}) {
    return InkWell(
      onTap: callBack,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              assetImage,
              width: 33,
              height: 33,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "$msgCount",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  ///用来底部弹框
  void showBottomFoncton(int i) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          if (i == 1) {
            return commentItemFunction();
          } else {
            return shareItemFunction();
          }
        });
  }

  ///评论
  Widget commentItemFunction() {
    return Container(
      height: 390,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0, 0),
                child: Text(
                  "评论区",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment(1, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.clear,
                      size: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCommentItemWidget();
                  }),
            ),
          ),
        ],
      ),
    );
  }

  List<String> nameItems = <String>['微信', '朋友圈', 'QQ', 'QQ空间', '微博', '链接'];

  // 这个urlItems这里没有用到
  List<String> urlItems = <String>[
    'images/2.0/wexin_icon.png',
    'images/2.0/friend_icon.png',
    'images/2.0/qq_icon.png',
    'images/2.0/qq_zon_icon.png',
    'images/2.0/weibo_icon.png',
    'images/2.0/link_icon.png',
  ];

  Widget shareItemFunction() {
    return Container(
      height: 260,
      padding: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Container(
              height: 190.0,
              child: GridView.builder(
                  itemCount: nameItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 6, right: 6),
                          child: Image.asset(
                            urlItems[index],
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Text(nameItems[index])
                      ],
                    );
                  }),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44,
              alignment: Alignment.center,
              child: Text("取消"),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCommentItemWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Image.asset(
              "images/2.0/wexin_icon.png",
              width: 33,
              height: 33,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "小三的情人",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "以身相许就是报答了这个恩人，期待下一次更新啊啊！！！",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.only(left: 6, right: 6),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Text(
                    "6小时前",
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
