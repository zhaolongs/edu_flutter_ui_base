import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwitchHomePageState();
  }
}

class SwitchHomePageState extends State {
  bool selecA = false;
  bool selecB = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(" 配制"),
      ),

      ///线性布局
      body: Column(
        children: <Widget>[

          ///开关
         SizedBox(width: 75,child:  Switch(
           ///开关开启时圆点的颜色
           activeColor: Colors.blue,
           ///开关开启时开关底座的颜色
           activeTrackColor: Colors.yellow,
           /// 开关开启时圆点的背景图片
           activeThumbImage: AssetImage("images/2.0/no_select_icon.png"),
           ///开关关闭状态时的 圆点的颜色
           inactiveThumbColor: Colors.deepPurple,
           ///开关关闭状态时 底座的颜色
           inactiveTrackColor: Colors.green,
           ///开关关闭状态时 圆点的背景
           inactiveThumbImage: AssetImage("images/2.0/select_icon.png"),
           ///当前开关的状态
           value: selecA,
           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
           ///当开关的状态发生改变时会调用
           onChanged: (value){

             setState(() {
               selecA = value;
             });

           },),),

          SwitchListTile(
            value: selecB,
            onChanged: (vlaue){
              setState(() {
                selecB=vlaue;
              });
            },
            title: Text("这是一级标题了"),
            subtitle: Text("这是二级标题了"),
            secondary: Image.asset("images/2.0/logo.jpg",width: 55,),
          ),
          Slider(
            value: 1,
            onChanged: (vlaue){
              setState(() {

              });
            },
          )
        ],
      ),
    );
  }
}
