import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage2 extends StatefulWidget {
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

    ///获取屏幕尺寸信息
    double width = MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    /// 375
    print("widht is $width  and  height is $height  devicePixelRatio is $devicePixelRatio");


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
        ///   SliverGridDelegateWithFixedCrossAxisCount 固定列数
        ///   SliverGridDelegateWithMaxCrossAxisExtent 不固定列数
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

          /// 最大宽度
          maxCrossAxisExtent: 200,
          ///滑动方向为 竖直方向时 列与列之间的间隔
          crossAxisSpacing: 10,
          ///滑动方向为 竖直方向时 行与行之间的间隔
          mainAxisSpacing: 20,
          ///宽与高的比例
          childAspectRatio: 0.5,
        ),
        ///用来配制GridView 子条目
        /// 720 4  (720 -15 )/4
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: 300,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
