
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///整理
///TextField 输入文本 textAlign
class TextFeildHomePage4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFeildHomePageState();
  }
}

class TextFeildHomePageState extends State {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField 讲解"),
      ),
      body: Container(
        ///SizedBox 用来限制一个固定 width height 的空间
        child: SizedBox(
          width: 400,
          height: 100,
          child: Container(
            color: Colors.white24,
            padding: EdgeInsets.all(10),
            ///Alignment 用来对齐 Widget
            alignment: Alignment(0, 0),
            ///文本输入框
            child: TextField(
              ///输入框内输入文本 居中对齐
              ///设置文本的对齐方式
              //   TextAlign.center 居中
              //   TextAlign.left 靠左对齐 TextField默认使用
              //   TextAlign.right 靠右对齐
              //   TextAlign.justify 拉伸以结束的文本行以填充容器的宽度。即使用了decorationStyle才起效
              //   TextAlign.start  针对 文字方向来使用 textDirection
              //        TextDirection.ltr  TextAlign.start 左对齐
              //        TextDirection.rtl  TextAlign.start 右对齐
              //   TextAlign.end
              //       TextDirection.ltr  TextAlign.end 右对齐
              //       TextDirection.rtl  TextAlign.end 左对齐
              textAlign: TextAlign.start,
              /// 用来设置文字的绘制方向的
              /// TextDirection.ltr left to  right 文字从左向右
              /// TextDirection.rtl right to left  文字从右向左
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
