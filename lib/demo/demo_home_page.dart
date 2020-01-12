import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoHomePagePageState();
  }
}

/// 加载网络图片
class DemoHomePagePageState extends State {
  String imageUrl =
      "https://timgsa.baidu.com/timg?demo.image&quality=80&size=b9999_10000&sec=1578583093&di=0bf687d9589dc5c6c0778de9576ee077&imgtype=jpg&er=1&src=http%3A%2F%2Ffile.mumayi.com%2Fforum%2F201403%2F28%2F111010vhgc45hkh41f1mfd.jpg";
  bool valueb = false;
  bool valuea = false;

  bool valuec = false;
  bool valued = false;

  bool valuee = false;

  bool valuef = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(" 配制"),
      ),

      ///线性布局
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200,
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(20),
                color: Colors.grey[400],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.valuea,
                          onChanged: (bool value) {
                            setState(() {
                              this.valuea = value;
                            });
                          },
                        ),
                        Text("A选项"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.valueb,
                          activeColor: Colors.red,
                          checkColor: Colors.blue,
                          onChanged: (bool value) {
                            setState(() {
                              this.valueb = value;
                            });
                          },
                        ),
                        Text("B选项"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 400,
                height: 100,
                child: CheckboxListTile(
                  secondary: const Icon(Icons.alarm_on),
                  title: const Text('每天6：10 响铃'),
                  subtitle: Text('12小时58分钟后响铃'),
                  value: this.valued,
                  onChanged: (bool value) {
                    setState(() {
                      this.valued = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 400,
                height: 100,
                child: CheckboxListTile(
                  secondary: const Icon(Icons.alarm_on),
                  title: const Text('每天6：10 响铃'),
                  subtitle: Text('12小时58分钟后响铃'),
                  value: this.valuec,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuec = value;
                    });
                  },
                ),
              ),
              Container(
                height: 44,
                width: 400,
                padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      valuef=!valuef;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        valuef
                            ? "images/2.0/select_icon.png"
                            : "images/2.0/no_select_icon.png",
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(width: 14,),
                      Text("是否选中A选项")
                    ],
                  ),
                ),
              ),
              Container(
                height: 44,
                width: 400,
                padding: EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      valuee=!valuee;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        valuee
                            ? "images/2.0/select_icon.png"
                            : "images/2.0/no_select_icon.png",
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(width: 14,),
                      Text("是否选中A选项")
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
