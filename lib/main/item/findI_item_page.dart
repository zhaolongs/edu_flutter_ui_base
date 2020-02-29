import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/main/main_find2_pages.dart';
import 'package:video_player/video_player.dart';

class FindItemPage extends StatefulWidget {
  VideoModel videoModel;

  FindItemPage(this.videoModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FindItemPageState();
  }
}

class FindItemPageState extends State<FindItemPage> {
  VideoPlayerController controller;
  Future initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network(widget.videoModel.videoUrl);
    initializeVideoPlayerFuture = controller.initialize().then((_) {
      controller.play();
      // 在初始化完成后必须更新界面
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///黑色背景
        buildBackground(),

        ///底部文字区域
        buildBottomArea(),

        ///视频播放组件
        buildVideoWidget(),

        ///暂停按钮
        buildPauseButton(),

        ///右侧点赞按钮
        buildRightButton(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  ///黑色背景
  buildBackground() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Container(
        color: Colors.black,
        child: Center(
          child: Text("${widget.videoModel.videoName}"),
        ),
      ),
    );
  }

  ///视频播放组件
  buildVideoWidget() {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        // print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.done) {
          return InkWell(
            onTap: () {
              if (controller.value.initialized) {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
                setState(() {});
              } else {
                controller.initialize().then((_) {
                  controller.play();
                  // 在初始化完成后必须更新界面
                  setState(() {});
                });
              }
            },
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ///暂停按钮
  buildPauseButton() {
    return Align(
      alignment: Alignment(0, 0),
      child: (controller.value.initialized && !controller.value.isPlaying)
          ? InkWell(
              onTap: () {
                if (controller.value.initialized &&
                    !controller.value.isPlaying) {
                  controller.play();
                  // 在初始化完成后必须更新界面
                  setState(() {});
                } else {
                  controller.initialize().then((_) {
                    controller.play();
                    // 在初始化完成后必须更新界面
                    setState(() {});
                  });
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
            )
          : Container(),
    );
  }

  ///右侧点赞按钮
  buildRightButton() {
    return Align(
      alignment: Alignment(1, 0.4),
      child: Container(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ///用户头像
            buildUser(),

            ///喜欢
            buildLikeButtion(
                assetImage: widget.videoModel.isLike
                    ? "images/2.0/like_icon_2.png"
                    : "images/2.0/like_icon.png",
                msgCount: 909,
                callback: () {}),

            ///评论
            buildLikeButtion(
                assetImage: "images/2.0/comment_icon.png",
                msgCount: 233,
                callback: () {}),

            ///转发
            buildLikeButtion(
                assetImage: "images/2.0/transpond_icon.png",
                msgCount: 223,
                callback: () {}),
          ],
        ),
      ),
    );
  }

  ///用户头像
  buildUser() {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0),
            child: ClipOval(
              child: Container(
                color: Colors.grey,
                width: 44,
                height: 44,
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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

  buildLikeButtion({String assetImage, int msgCount, callback}) {
    return InkWell(
        onTap: callback,
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
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ));
  }

  ///底部文字区域
  buildBottomArea() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 180,
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: new Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 14,
              bottom: 14,
              right: 64,
              left: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("@早起的年轻人",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
                  SizedBox(height: 10,),
                  Text("三十年河东，三十年河西，莫斯少年穷，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.white),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
