import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage5 extends StatefulWidget {
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
      body: GridView.builder(
        /// 配制GridView的展示样式
        ///   SliverGridDelegateWithFixedCrossAxisCount 固定列数 GridView.count
        ///   SliverGridDelegateWithMaxCrossAxisExtent 不固定列数GridView.extent
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///列数控制
          crossAxisCount: 3,
          ///滑动方向为 竖直方向时 列与列之间的间隔
          crossAxisSpacing: 15,
          ///滑动方向为 竖直方向时 行与行之间的间隔
          mainAxisSpacing: 20,
          ///宽与高的比例
          childAspectRatio: 0.5,
        ),
        ///用来构建 子  Widget 的样式
        itemBuilder: (BuildContext context,int index){
          if(index==0){
            return Container(color: Colors.blue,child: Text("item $index",style: TextStyle(color: Colors.white),),);
          }
          return Container(color: Colors.grey,child: Text("item $index",style: TextStyle(color: Colors.red),),);
        },
      ),
    );
  }
}
