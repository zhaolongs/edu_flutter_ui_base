

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItemPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return HomeItemPageState();
  }

}

class HomeItemPageState extends State<HomeItemPage>{
  @override
  Widget build(BuildContext context) {

    return  Builder(
      builder: (BuildContext context) {
        return Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("打开左滑菜单"),
                onPressed: () {
                  ///打开左滑菜单
                  Scaffold.of(context).openDrawer();
                },
              ),
              FlatButton(
                child: Text("打开右滑菜单"),
                onPressed: () {
                  ///打开右滑菜单
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        );
      },
    );
  }

}