
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewBPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State {
  List list = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++) {
      list.add("iteme $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView b"),
      ),

      ///用来加载 列表式布局
      body: ListView.builder(
        ///用来构建 子条目
        /// index 是条目的角标
        itemBuilder: (BuildContext context, num index) {
          return Container(
            color: Colors.grey[300],
            height: 88,
            margin: EdgeInsets.all(5),
            child: Text(list[index]),
          );
        },
        ///数据的个数
        itemCount: list.length,
      ),
    );
  }
}
