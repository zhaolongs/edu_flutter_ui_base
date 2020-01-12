import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GesturePagePageState();
  }
}

class GesturePagePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(" 配制"),
      ),

      ///线性布局
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("点击"),
            onPressed: () {
              print("点击了");
            },
            onLongPress: (){

            },
          ),

          ///处理手势
          /// 点按时  onTapDown ->onTapUp ->onTap
          /// 长按时 onTapDown ->onLongPress -->onLongPressUp
          GestureDetector(
            ///单点时 手指按时回调
            ///长按时 执行
            onTapDown: (de){
              print("onTapDown $de");
            },
            /// 手指抬起时回调
            onTapUp:(de){
              print("onTapUp $de");
            },
            ///单点事件
            onTap: (){
              print("onTap 点下按起");
            },
            ///长按时手 抬起执行
            onLongPressUp: (){
              print("onLongPressUp");
            },
            ///长按事件
            onLongPress: (){
              print("onLongPress");
            },
            ///双击
            onDoubleTap:() {
              print("双击");
            },


            onVerticalDragCancel: (){
              print("onVerticalDragCancel");
            },

            onVerticalDragDown: (de){
              print("onVerticalDragDown $de");
            },

            ///在竖直方向上滑动结束时
            onVerticalDragEnd: (de){
              print("onVerticalDragEnd $de");
            },

            ///在竖直方向手指开始滑动的时候回调 一次 de Offset(95.3, 267.7)
            onVerticalDragStart: (de){
              print("onVerticalDragStart $de");
            },
            ///滑动过程中回调的方法 Offset(0.0, 8.0)
            onVerticalDragUpdate: (de){
              print("onVerticalDragUpdate $de");
            },

            onHorizontalDragCancel: (){

            },

            onHorizontalDragDown: (de){

            },
            onHorizontalDragEnd: (de){

            },
            onHorizontalDragStart: (de){

            },

            onHorizontalDragUpdate: (de){

            },


            child: Container(
              color: Colors.grey,
              width: 380,
              height: 132,
              margin: EdgeInsets.all(10),
            ),
          ),

          ///处理点击事件
          Material(
            color: Colors.grey,
            child: InkWell(
              onTap: (){
                print("inkWell 点击事件");
              },
              ///Container 中的 子widget Alignment.center 居中
              /// Alignment(0,0)  Alignment.center 效果
              /// 子Widget 设置了 color 属性 背景 水波纹效果将会被覆盖
              child: Container(alignment: Alignment(0,0),width: 400,height: 44,child: Text("Inkwell 点击事件",style: TextStyle(color: Colors.blue),),),
            ),
          ),
          SizedBox(height: 20,),
          Ink(
            ///color: Colors.grey[300], 注意 color 与 decoration 只能设置使用一个
            ///用来设置形状
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.all(Radius.circular(22))
            ),
            child: InkWell(
              ///设置点击效果的圆角
              borderRadius: BorderRadius.all(Radius.circular(22)),
              ///设置水波纹的颜色
              splashColor: Colors.blue[700],
              ///设置按下去的颜色  高亮颜色
//              highlightColor:Colors.blue[600] ,
              ///水波纹扩散的半径
              radius: 1000,
              onTap: (){
                print("inkWell 点击事件");
              },
              ///Container 中的 子widget Alignment.center 居中
              /// Alignment(0,0)  Alignment.center 效果
              /// 子Widget 设置了 color 属性 背景 水波纹效果将会被覆盖
              child: Container(alignment: Alignment(0,0),width: 400,height: 44,child: Text("Inkwell 点击事件",style: TextStyle(color: Colors.white),),),
            ),
          )
        ],
      ),
    );
  }
}
