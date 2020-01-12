import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLocalHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageHomePagePageState();
  }
}

/// 加载本图片
class ImageHomePagePageState extends State {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Image 配制"),
      ),

      ///线性布局
      body: Column(
        children: <Widget>[
          ///AssetImage 用来加载 项目中的图片
          Image(image:AssetImage("images/2.0/logo.jpg"),),
          Image.asset("images/2.0/logo.jpg"),

        ],
      ),
    );
  }
}
