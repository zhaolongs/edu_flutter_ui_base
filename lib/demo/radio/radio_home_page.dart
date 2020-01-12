import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RadioHomePageState();
  }
}

class RadioHomePageState extends State {
  num groupValue = 1;


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
          Container(
            height: 400,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(20),
            color: Colors.grey[400],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ///实现单选框的效果
                    Radio(
                      ///是一组单选框的记录
                      groupValue: groupValue,

                      ///唯一 当前Radio 的标识
                      value: 1,

                      ///选中时的颜色
                      activeColor: Colors.red,

                      ///单选框点击时的回调
                      onChanged: (value) {
                        groupValue = value;
                        setState(() {});
                      },
                    ),
                    Text("A 在水中")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: groupValue,
                      value: 2,

                      ///单选框点击时的回调
                      onChanged: (value) {
                        print("点击了$value");
                        groupValue = value;
                        setState(() {});
                      },
                    ),
                    Text("B 在水中")
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 1,
                  margin: EdgeInsets.only(bottom: 20),
                ),
                GestureDetector(
                  onTap: () {
                    selecA=true;
                    selecB=false;
                    setState(() {

                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        selecA?"images/2.0/no_select_icon.png":"images/2.0/select_icon.png",
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text("A 在水中")
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    selecB = true;
                    selecA = false;
                    setState(() {

                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        selecB?"images/2.0/no_select_icon.png":"images/2.0/select_icon.png",
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text("B 在水中")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
