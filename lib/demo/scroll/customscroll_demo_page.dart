import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State with SingleTickerProviderStateMixin {
  String imageUrl =
      "http://file02.16sucai.com/d/file/2015/0408/779334da99e40adb587d0ba715eca102.jpg";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///SingleChildScrollView
        ///NestedScrollView
        ///CustomScrollView
        /// 处理滑动
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.pink,
          pinned: true,
          snap: false,
          floating: true,
          leading: Icon(Icons.home),
          actions: <Widget>[Icon(Icons.menu)],
          title: Text("这里是标题"),
          expandedHeight: 180,
          flexibleSpace: FlexibleSpaceBar(
            background: Row(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, num index) {
            return Container(
              height: 44,
              margin: EdgeInsets.only(bottom: 10),
              child: Text("item- $index"),
            );
          }, childCount: 100),
        )
      ],
    ));
  }
}
