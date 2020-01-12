import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///整理
///TextField texeStyle 输入文本样式 分析篇
class TextFeildHomePage7 extends StatefulWidget {
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


    TextStyle commonStyle = buildCommonStyle();


    return Scaffold(
      appBar: AppBar(
        title: Text("TextField 讲解"),
      ),
      body: Center(
        ///SizedBox 用来限制一个固定 width height 的空间
        child:Column(children: <Widget>[
          SizedBox(
            width: 400,
            height: 110,
            child: Container(
              color: Colors.white24,
              padding: EdgeInsets.all(10),
              ///Alignment 用来对齐 Widget
              alignment: Alignment(0, 0),
              ///文本输入框
              child: TextField(
                ///设置输入文本的样式
                style: commonStyle,
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 20,),width: 100,
            child: Text("这是显示文本组件Text page haha", style: commonStyle,),)
        ],),
      ),
    );
  }

  TextStyle buildCommonStyle() {
    return TextStyle(
      textBaseline: TextBaseline.alphabetic,
      ///设置文字的颜色
      color: Colors.deepPurple,
      ///设置文字的大小
      fontSize: 32.0,
      ///用设置 Text 的线
      ///   TextDecoration.none 没有
      ///   TextDecoration.underline 下划线
      ///   TextDecoration.overline  上划线
      ///   TextDecoration.lineThrough 删除线
      decoration: TextDecoration.none,
      /// 设置下划线的颜色
      decorationColor: Colors.green,
      /// 设置下划线的样式
      ///   TextDecorationStyle.dashed 设置为虚线
      ///   TextDecorationStyle.solid 设置为实线
      ///   TextDecorationStyle.double 两条实线
      ///   TextDecorationStyle.wavy  波浪线
      decorationStyle: TextDecorationStyle.wavy,
      ///设置文字为粗体
      ///   FontWeight.bold 粗体
      fontWeight: FontWeight.w600,
      ///设置 斜体
      fontStyle: FontStyle.normal,
      ///用来设置 单字之间的距离
      letterSpacing: 1.0,
      ///用来设置 单词之间的距离
      wordSpacing: 2.0,
      ///控制行高 倍数（默认行高的倍数）乘以fontSize做为行高
      height: 1.2,
      ///文本的背景颜色
      backgroundColor: Colors.grey,
      ///Decoration背景设定
//                shadows:
    );
  }
}
