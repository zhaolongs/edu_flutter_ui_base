

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFeildHomePage extends StatefulWidget {
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
//      FocusScope.of(context).requestFocus(focusNode);
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
              decoration: InputDecoration(
                ///设置输入文本框的提示文字
                ///输入框获取焦点时 并且没有输入文字时
                hintText: "请输入用户名",
                ///设置输入文本框的提示文字的样式
                hintStyle: TextStyle(color: Colors.grey,textBaseline: TextBaseline.ideographic,),
                ///输入框内的提示 输入框没有获取焦点时显示
                labelText: "用户名",
                labelStyle: TextStyle(color: Colors.blue),
                ///显示在输入框下面的文字
                helperText: "这里是帮助提示语",
                helperStyle: TextStyle(color: Colors.green),

                ///显示在输入框下面的文字
                ///会覆盖了 helperText 内容
                errorText: "这里是错误文本提示",
                errorStyle: TextStyle(color: Colors.red),

                ///输入框获取焦点时才会显示出来 输入文本的前面
                prefixText: "prefix",
                prefixStyle: TextStyle(color: Colors.deepPurple),
                ///输入框获取焦点时才会显示出来 输入文本的后面
                suffixText: "suf ",
                suffixStyle: TextStyle(color: Colors.black),

                ///文本输入框右下角显示的文本
                ///文字计数器默认使用
                counterText: "count",
                counterStyle:TextStyle(color: Colors.deepPurple[800]),

                ///输入文字前的小图标
                prefixIcon: Icon(Icons.phone),
                ///输入文字后面的小图标
                suffixIcon: Icon(Icons.close),

                ///与 prefixText 不能同时设置
//                prefix: Text("A") ,
                /// 与 suffixText 不能同时设置
//                suffix:  Text("B") ,
                ///设置边框
                ///   InputBorder.none 无下划线
                ///   OutlineInputBorder 上下左右 都有边框
                ///   UnderlineInputBorder 只有下边框  默认使用的就是下边框
                border: OutlineInputBorder(
                  ///设置边框四个角的弧度
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ///用来配置边框的样式
                  borderSide: BorderSide(
                    ///设置边框的颜色
                    color: Colors.red,
                    ///设置边框的粗细
                    width: 2.0,
                  ),
                ),
                ///设置输入框可编辑时的边框样式
                enabledBorder: OutlineInputBorder(
                  ///设置边框四个角的弧度
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ///用来配置边框的样式
                  borderSide: BorderSide(
                    ///设置边框的颜色
                    color: Colors.blue,
                    ///设置边框的粗细
                    width: 2.0,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  ///设置边框四个角的弧度
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ///用来配置边框的样式
                  borderSide: BorderSide(
                    ///设置边框的颜色
                    color: Colors.red,
                    ///设置边框的粗细
                    width: 2.0,
                  ),
                ),
                ///用来配置输入框获取焦点时的颜色
                focusedBorder: OutlineInputBorder(
                  ///设置边框四个角的弧度
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ///用来配置边框的样式
                  borderSide: BorderSide(
                    ///设置边框的颜色
                    color: Colors.green,
                    ///设置边框的粗细
                    width: 2.0,
                  ),
                ),
              ),

              ///允许输入的文本样式规则
              inputFormatters:<TextInputFormatter> [
              ///只允许输入数字
                WhitelistingTextInputFormatter(RegExp(r'\d+')),
              ] ,
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
              ///输入框内输入文本 居中对齐
              //////设置文本的对齐方式
              //              ///TextAlign.center 居中
              //              ///TextAlign.left 靠左对齐
              //              ///TextAlign.right 靠右对齐
              //              ///TextAlign.justify 拉伸以结束的文本行以填充容器的宽度。即使用了decorationStyle才起效
              //              ///TextAlign.start  针对 文字方向来使用 textDirection
              //              ///          TextDirection.ltr  TextAlign.start 左对齐
              //              ///           extDirection.rtl  TextAlign.start 右对齐
              //              ///TextAlign.end
              //              ///          TextDirection.ltr  TextAlign.end 右对齐
              //              ///          TextDirection.rtl  TextAlign.end 左对齐
              textAlign: TextAlign.center,
              /// 用来设置文字的绘制方向的
              /// TextDirection.ltr left to  right 文字从左向右
              /// TextDirection.rtl right to left  文字从右向左
              textDirection: TextDirection.ltr,
              ///用来设置文字的样式
              style: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                ///设置文字的颜色
                color: Colors.deepPurple,
                ///设置文字的大小
                fontSize: 16.0,
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
                letterSpacing: 2.0,
                ///用来设置 单词之间的距离
                wordSpacing: 2.0,
                ///控制行高 倍数（默认行高的倍数）
                height: 1.2,
                ///文本的背景颜色
                backgroundColor: Colors.white24,
                ///Decoration背景设定
//                shadows:
              ),
            ),
          ),
        ),
      ),
    );
  }
}
