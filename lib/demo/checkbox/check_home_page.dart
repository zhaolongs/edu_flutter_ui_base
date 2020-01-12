
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckHomePageState();
  }
}

class CheckHomePageState extends State {
  bool check = false;
  bool checka = false;
  bool checkb = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(" 配制"),
      ),

      ///线性布局
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(20),
            color: Colors.grey[400],
            child: Row(
              children: <Widget>[
                Checkbox(
                  ///状态回调
                  onChanged: (value) {
                    setState(() {
                      check = value;
                    });
                  },

                  /// true Checkbox是选中状态
                  value: check,

                  ///选中的背景颜色
                  activeColor: Colors.red,
                ),
                Text("请同意用户协议")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            color: Colors.grey[400],
            child: CheckboxListTile(
              secondary: Image.asset("images/2.0/logo.jpg"),
              title: Text("这是测试选中"),
              subtitle: Text("这是二级标题"),
              /// true Checkbox 选中
              value: checka,
              ///Checkbox 状态改变的时候回调
              onChanged: (value){
                print("回调了$value");
                setState(() {
                  checka=value;
                });
            },),
          ),

      Container(
        height: 100,
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.only(left: 16),
        color: Colors.grey[400],
        ///手势监听
        child: GestureDetector(
          onTap: (){
            setState(() {
              checkb=!checkb;
            });
          },
          child: Row(
            children: <Widget>[
              Image.asset(checkb?"images/2.0/no_select_icon.png":"images/2.0/select_icon.png",width: 22,height: 22,),
              SizedBox(width: 12,),
              Text("请同意用户协议")
            ],
          ),
        ),

      ),

          Container(
            height: 100,
            margin: EdgeInsets.all(12),
            ///手势监听
            child: InkWell(
              onTap: (){
                setState(() {
                  checkb=!checkb;
                });
              },
              child: Row(
                children: <Widget>[
                  SizedBox(width: 12,),
                  Image.asset(checkb?"images/2.0/no_select_icon.png":"images/2.0/select_icon.png",width: 22,height: 22,),
                  SizedBox(width: 12,),
                  Text("请同意用户协议")
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}
