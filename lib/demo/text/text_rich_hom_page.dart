import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextRichHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextRichHomePagePageState();
  }
}

class TextRichHomePagePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Rich 讲解"),
      ),
      body: Center(
        ///SizedBox 用来限制一个固定 width height 的空间
        child: SizedBox(
          width: 200,
          height: 200,
          child: Container(
            color: Colors.yellow,

            ///Alignment 用来对齐 Widget
            alignment: Alignment(0, 0),
            child: Text.rich(TextSpan(
              text: "这里是 TextSpan",
              style: TextStyle(color: Colors.deepPurple),
              children: [
                TextSpan(
                    text: "这是第二个", style: TextStyle(color: Colors.lightBlue)),
                TextSpan(
                   /// TextSpan 的文本内容
                    text: "这是第三个",
                    ///设置 TextSpan 的文本样式
                    style: TextStyle(color: Colors.green),
                    ///设置TextSpan的点击事件
                    recognizer: TapGestureRecognizer()..onTap = () {
                      print("点击了第三个");
                    }),
                TextSpan(text: "这是第四个", style: TextStyle(color: Colors.white)),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
