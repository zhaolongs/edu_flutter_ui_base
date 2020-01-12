import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ColumnPagePageState();
  }
}

class ColumnPagePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Column 配制"),
      ),
      ///线性布局
        ///布局竖直方向上的Widget 呈线性的排列方式
        /// 默认 在 height 是填充 父布局
        /// 默认 在 width 是包裹 子Widget
        /// 当 Column 的父布局 width 有明确的宽度限制时 Column 本身的 width 也是填充父布局的
        /// Column 中子 Widget 是默认的 水平居中的
      body: SizedBox(width: 330,height: 540,
      child: Column(
        /// MainAxisSize.min 设置在没有父Widget高度限制时 设置为此项 Column 在竖直方向上包裹子 Widget
        /// 默认是  MainAxisSize.max
        mainAxisSize: MainAxisSize.min,
        ///在次方向上靠左对齐
        /// CrossAxisAlignment.end 水平方向的右边
        /// CrossAxisAlignment.center 水平方向的居中 默认
        /// CrossAxisAlignment.start 水平方向的左边
        crossAxisAlignment: CrossAxisAlignment.start,
        /// 在主方向上对齐设置
        /// MainAxisAlignment.end 竖直方向的下边
        /// MainAxisAlignment.center 竖直方向的中间
        /// MainAxisAlignment.start 竖直方向的上边
        mainAxisAlignment: MainAxisAlignment.start,
        ///文字的绘制方向
        ///TextDirection.ltr left to right 从左向右
        textDirection: TextDirection.ltr,

        ///权重适配
        children: <Widget>[
          ///当 flex 相等时 Expanded 平分高度
          Expanded(flex: 3, child: Container(color: Colors.blue,
            width: 220,
            height: 128,
            margin: EdgeInsets.only(top: 20, left: 12),),),
          Expanded(flex: 1, child:
          Container(color: Colors.blue,
            width: 220,
            height: 28,
            margin: EdgeInsets.only(top: 20, left: 12,),),),
        ],),
      ),
    );
  }
}
