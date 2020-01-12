import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewPageState();
  }
}

class GridViewPageState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///获取屏幕尺寸信息
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    /// 375
    print(
        "widht is $width  and  height is $height  devicePixelRatio is $devicePixelRatio");

    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),

      ///SliverGridDelegateWithFixedCrossAxisCount
      ///创建不固定列数的 GridView
      body: GridView.extent(
        ///配制 子 Widget 的最大宽度
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.5,
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
