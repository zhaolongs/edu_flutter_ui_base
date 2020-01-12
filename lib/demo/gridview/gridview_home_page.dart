import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewPageState();
  }
}

class GridViewPageState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: GridView(
        ///设置GridView 的滑动方向
        /// Axis.horizontal 水平方向滑动 （左右 水平方向为主方向）
        /// Axis.vertical 竖直方向滑动 （上下 竖直方向为主方向）
        scrollDirection: Axis.vertical,
        ///设置内边距
        padding: EdgeInsets.all(10),
        ///当内容不足的时候 用来配置是否可以滑动
        /// false  内容不足的时候是不可滑动的
        /// true   任何时间都可以滑动
        primary: true,
        /// BouncingScrollPhysics 有回弹效果
        /// ClampingScrollPhysics 没回弹道果
        /// NeverScrollableScrollPhysics 设置不可滑动
        /// AlwaysScrollableScrollPhysics 设置为永远可以滑动
        physics:BouncingScrollPhysics(),
        ///设置内容包裹
        shrinkWrap: false,
        /// 配制GridView的展示样式
        ///   SliverGridDelegateWithFixedCrossAxisCount 固定列数 GridView.count
        ///   SliverGridDelegateWithMaxCrossAxisExtent 不固定列数GridView.extent
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///列数控制
          crossAxisCount: 3,
          ///滑动方向为 竖直方向时 列与列之间的间隔
          crossAxisSpacing: 15,
          ///滑动方向为 竖直方向时 行与行之间的间隔
          mainAxisSpacing: 20,
          ///宽与高的比例
          childAspectRatio: 0.5,
        ),
        ///用来配制GridView 子条目
        /// 720 4  (720 -15 )/4
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: 300,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
