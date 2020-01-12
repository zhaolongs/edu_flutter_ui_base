
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///整理
///TextField TextEditingController 分析篇
class TextFeildHomePage6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFeildHomePageState();
  }
}

class TextFeildHomePageState extends State {

  ///用于文本输入框
  TextEditingController controller = new TextEditingController();
  ///用来控制  TextField 焦点的获取与关闭
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    ///预设输入框的内容
    String preText = "";

    ///控制 初始化的时候鼠标保持在文字最后
    controller = TextEditingController.fromValue(
      ///用来设置初始化时显示
      TextEditingValue(
        ///用来设置文本 controller.demo.text = "0000"
        text: preText,
        ///设置光标的位置
        selection: TextSelection.fromPosition(
          ///用来设置文本的位置
          TextPosition(
              affinity: TextAffinity.downstream,
              /// 光标向后移动的长度
              offset: preText.length),),),
    );

    /// 添加兼听 当TextFeild 中内容发生变化时 回调 焦点变动 也会触发
    /// onChanged 当TextFeild文本发生改变时才会回调
    controller.addListener((){
      ///获取输入的内容
      String currentStr = controller.text;
      print(" controller 兼听 $currentStr");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField 讲解"),
        actions: <Widget>[
          FlatButton(child: Text("保存",style: TextStyle(color: Colors.white),),onPressed: (){
            ///获取文本输入框的内容
            String inputText  = controller.text;
            print("点击了保存 $inputText");
          },)
        ],
      ),
      body: Center(
        ///SizedBox 用来限制一个固定 width height 的空间
        child: SizedBox(
          width: 400,
          height: 110,
          child: Container(
            color: Colors.white24,
            padding:EdgeInsets.all(10) ,
            ///Alignment 用来对齐 Widget
            alignment: Alignment(0,0),
            ///文本输入框
            child: TextField(
              controller: controller,
              ///当TextField中输入的内容发生改变时回调
              onChanged: (value){
                print("TextField 中输入的内容 $value");
              },
              ),
            ),
          ),
        ),
    );
  }
}