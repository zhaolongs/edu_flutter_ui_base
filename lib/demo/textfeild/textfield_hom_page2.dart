

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


///整理
class TextFeildHomePage2 extends StatefulWidget {
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

    ///它能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
    WidgetsBinding.instance.addPostFrameCallback((_){
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
          FlatButton(child: Text("保存",style: TextStyle(color: Colors.white),),onPressed: (){
            ///获取文本输入框的内容
            String inputText  = controller.text;
            print("点击了保存 $inputText");
          },)
        ],
      ),
      body: Container(
        ///SizedBox 用来限制一个固定 width height 的空间
        child: SizedBox(
          width: 400,
          height: 100,
          child: Container(
            color: Colors.white24,
            padding:EdgeInsets.all(10) ,
            ///Alignment 用来对齐 Widget
            alignment: Alignment(0,0),
            ///文本输入框
            child:buildTextFeild2(),
          ),
        ),
      ),
    );
  }

  /// 1 最简单的使用
  Widget buildTextFeild1(){
    return TextField();
  }

  /// 2 常用属性配制
  Widget buildTextFeild2(){
    return  TextField(
      ///用来控制 TextField 获取焦点问题
      focusNode: focusNode,
      controller: controller,
      /**
       * TextCapitalization.sentences  这是最常见的大写化类型，每个句子的第一个字母被转换成大写。
       * TextCapitalization.characters  大写句子中的所有字符。
       * TextCapitalization.words 对每个单词首字母大写。
       */
      textCapitalization: TextCapitalization.sentences,
      ///光标的颜色
      cursorColor: Colors.red,
      ///设置光标的 四个角的弧度
      cursorRadius: Radius.circular(10),
      ///设置光标的宽度
      cursorWidth: 6,
      ///设置键盘的类型
      keyboardType: TextInputType.phone,
      ///键盘回车键的样式
      textInputAction: TextInputAction.next,
      ///设置输入框是否可编辑
      ///   true 可输入
      ///   false 不可输入
      enabled: true,
      ///自动获取焦点
//              autofocus:true,
      ///密码  maxLines =1
      obscureText: false,
      ///限制输入框内输入文本的长度的
      ///设置此项会让TextField右下角有一个输入数量的统计字符串
      maxLength: 30,
      ///限制输入框内输入文本的行数
      maxLines: 4,
      ///当输入框内的文本发生改变时回调的函数
      onChanged: (value){
        print("回调了 $value");
      },
      ///键盘上按了done
      onEditingComplete: () {

      },
    );
  }
}
