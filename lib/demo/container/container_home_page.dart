import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContainerHomePageState();
  }
}

class ContainerHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Container 配制"),
      ),
      body: Center(
        ///内三组件
        child: Container(
          ///Container 默认包裹子widget (没任何内外大小的限制 )
          ///Container的背景颜色
          width: 200,
          height: 200,
          constraints: BoxConstraints(),

          ///设置内边距
          padding: EdgeInsets.all(20),
//          color: Colors.yellow,
          ///color 与 decoration 只能设置使用一个
          decoration: BoxDecoration(

              ///设置背景颜色的
              color: Colors.yellow,

              ///设置边框
              border: new Border.all(
                ///设置边框的颜色的
                  color: Colors.deepPurple,
                  ///边框线的粗细
                  width: 2.0,
                  ///边框线的样式
                  ///BorderStyle.none 边框将消失
                  style: BorderStyle.solid),

            ///配制边框的四个角 BorderRadius.circular(20.0)
              ///分别设置 上 下 圆角的大小 BorderRadius.vertical(top: Radius.elliptical(15 ,15),bottom: Radius.elliptical(30 ,30))
              ///分别设置 左 右 圆角的大小 BorderRadius.horizontal(left: Radius.elliptical(15 ,15),right: Radius.elliptical(30 ,30))
            /// 分别设置 上 下 左 右 四个圆角的大小 BorderRadius.only(topLeft: Radius.elliptical(20, 20),bottomRight: Radius.elliptical(40, 40))
            borderRadius: BorderRadius.only(topLeft: Radius.elliptical(20, 20),bottomRight: Radius.elliptical(40, 40)),

            ///设置 Container 的形状
              ///当 shape 取值 BoxShape.circle 不能设置 borderRadius
            shape: BoxShape.rectangle,
            /// Container 颜色的填充模式的
//            gradient: LinearGradient(
//              ///配置颜色组
//                colors: [Colors.blue, Colors.yellow, Colors.deepPurple],
//                ///配置渐变的方向
//                begin: Alignment.topLeft,
//                end: Alignment.bottomRight),
//          ///用来配置环形
//              gradient:RadialGradient(
//                ///配置颜色组
//                colors: [Colors.blue, Colors.yellow, Colors.deepPurple],
//                ///中心点的位置
//                center: Alignment.centerLeft,
//                ///半径
//                radius: 0.2,
//                ///配置填充方式
//                  ///TileMode.clamp 取最近的颜色填充
//                  ///TileMode.mirror 镜像颜色填充
//                  ///TileMode.repeated 重复填充
//                tileMode: TileMode.clamp,
//              )
          ///扫描
            gradient: SweepGradient(
              colors: [Colors.blue, Colors.yellow, Colors.deepPurple],
              center: Alignment.center,
            ),
            ///设置阴影
            boxShadow: [
              BoxShadow(
                //阴影的颜色
                color: Colors.black,
                //阴影的偏移量
                offset: Offset(10, 10),
                ///模糊的清晰度
                blurRadius: 20,
                ///层的大小
                spreadRadius: 10,
              ),
            ],
          ),

          ///当Container 的外层有大小限制进 Container取用的是外层设置的大小
          ///内二组件
          child: Container(
            color: Colors.blue,

            ///
            child: Container(
              ///Edge 边缘 Insets 插图
              ///EdgeInsets EdgeInsets.all(15), 设置上下左右
              margin: EdgeInsets.only(left: 30, top: 10, right: 20, bottom: 4),
              color: Colors.grey,

              constraints: BoxConstraints(maxHeight: 50,maxWidth: 50,minWidth: 10,minHeight: 10),

              ///内一组件
              child: SizedBox(
                width: 50,
                height: 50,
                child: Text("这里是body "),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
