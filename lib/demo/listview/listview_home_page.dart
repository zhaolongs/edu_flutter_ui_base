import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State{


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      ///用来加载 列表式布局
      body:ListView(
        ///子Widget 的方向
        scrollDirection: Axis.vertical,
        ///包裹
        shrinkWrap: false,
        /// 回弹弹效果
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(color: Colors.grey,height: 164,width:400,margin: EdgeInsets.all(10),),
          Container(color: Colors.grey,height: 164,width:400,margin: EdgeInsets.all(10),),
          Container(color: Colors.grey,height: 164,width:400,margin: EdgeInsets.all(10),),
          Container(color: Colors.grey,height: 24,width:400,margin: EdgeInsets.all(10),),
          Container(color: Colors.grey,height: 164,width:400,margin: EdgeInsets.all(10),),
          Container(color: Colors.grey,height: 164,width:400,margin: EdgeInsets.all(10),),
        ],
      )
    );
  }

}
