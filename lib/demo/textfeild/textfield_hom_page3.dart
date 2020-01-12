
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///整理
///TextField 焦点获取控制篇
class TextFeildHomePage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFeildHomePageState();
  }
}

class TextFeildHomePageState extends State {

  ///用来控制  TextField 焦点的获取与关闭
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();

    ///添加获取焦点与失去焦点的兼听
    focusNode.addListener((){
      ///当前兼听的 TextFeild 是否获取了输入焦点
      bool hasFocus = focusNode.hasFocus;
      ///当前 focusNode 是否添加了兼听
      bool hasListeners = focusNode.hasListeners;

      print("focusNode 兼听 hasFocus:$hasFocus  hasListeners:$hasListeners");
    });

    /// WidgetsBinding 它能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///获取输入框焦点
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField 讲解"),
        actions: <Widget>[
          FlatButton(child: Text("获取"),onPressed: (){
            FocusScope.of(context).requestFocus(focusNode);
          },),
          FlatButton(child: Text("失去"),onPressed: (){
            focusNode.unfocus();
          },),
        ],
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
//              autofocus: true,
            focusNode: focusNode,
            ),
          ),
        ),
      ),
    );
  }
}
