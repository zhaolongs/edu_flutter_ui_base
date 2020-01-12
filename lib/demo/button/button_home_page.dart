import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonHomePagePageState();
  }
}

class ButtonHomePagePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("demo.button 配制"),
      ),
      ///线性布局
      body: Column(children: <Widget>[

        MaterialButton(
          ///按钮的背景
          color: Colors.blue,

          child: Text("按钮"),
          ///点击回调函数
          onPressed: (){
            print("按钮点击");
          },
          ///按钮按下时回调 value = true
          ///按钮抬起时回调 value = false
          ///要先于 onPressed
          onHighlightChanged: (value){
            print("按钮点击 Hight $value");
          },
          ///定义按钮的基色，以及按钮的最小尺寸
          ///ButtonTextTheme.accent 按钮显示的文本 ThemeData.accentColor(MaterialApp组件中的theme属性配制的)
          ///ButtonTextTheme. normal 按钮显示的文本 黑色或者白色 具体取决于ThemeData.brightness Brightness.dark
          ///ButtonTextTheme.primary 按钮的显示的文本 ThemeData.primaryColr
          textTheme: ButtonTextTheme.primary,
          ///配制按钮上文本的颜色
          textColor: Colors.deepOrange,
          ///未设置点击时的背景颜色
          disabledColor:Colors.yellow ,
          ///按钮点击下的颜色
          highlightColor:Colors.deepPurple,
          ///水波方的颜色
          splashColor: Colors.green,
          ///按钮的阴影
          elevation: 10,
          ///按钮按下时的阴影高度
          highlightElevation: 20,
          ///未设置点击时的阴影高度
          disabledElevation: 5.0,
          ///用来设置按钮的边框的样式
          /// Border.all(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid) 四个边框
          /// Border(bottom: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid)) 可以分别设置边框
          /// 用来设置底部边框的
          /// UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),borderRadius: BorderRadius.circular(10))
          /// 用来设置圆角矩形边框
          ///   RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(20)))
            ///   用来设置圆形边框
            ///   CircleBorder(side: BorderSide(width: 2,color:Colors.red )),
          ///   椭圆形边框 StadiumBorder(side: BorderSide(width: 2,color: Colors.red))
          ///   设置 多边形 BeveledRectangleBorder(side: BorderSide(width: 2,color: Colors.red),borderRadius: BorderRadius.all(Radius.circular(20)))
          ///
          shape: Border.all(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),
          height: 44.0,
          minWidth: 140,
        ),

        FlatButton(child: Text("FlatButton"),onPressed: (){},onLongPress: (){},),
        RaisedButton(child: Text("RaisedButton"),onPressed: (){},),
        OutlineButton(child: Text("OutlineButton"),onPressed: (){},),
        IconButton(icon: Icon(Icons.home),onPressed: (){},),


      ],)
    );
  }
}
