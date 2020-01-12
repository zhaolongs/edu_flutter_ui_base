import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RowHomePageState();
  }
}

class RowHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row配制"),
      ),

      /// Row 用于线性布局 在水平方向上排列子Widget
      /// Row 的主方向是水平方向
      /// 默认情况下 没父布局的高宽限制的时候 在主方向（水平方向上是填充父布局的）在次方向（竖直方向）包裹
      ///
      body: SizedBox(
        height: 400,
        width: 400,
        child: Row(
          ///MainAxisSize.min 设置主方向上的内容包裹
          ///默认是max 填充的
          mainAxisSize: MainAxisSize.max,
          ///关于对齐方面 Row 中的所有的子Widget 在次方向（竖直方向上居中对齐）
          crossAxisAlignment: CrossAxisAlignment.center,
          ///方向
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Expanded(flex: 2,child:  Container(color: Colors.blue,width: 100,height: 120,),),
           Expanded(flex: 1,child:  Container(color: Colors.blue,width: 28,height: 120,margin: EdgeInsets.only(left: 20),),)
          ],
        ),
      ),
    );
  }
}
