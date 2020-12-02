

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



///3.4.3bottomNavigationBar结合独立的StatefulWidget使用 首页面
class ScffoldHomeItemPage extends StatefulWidget {
  ///页面标识
  int pageIndex;
   ///构造函数
  ScffoldHomeItemPage(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState();
  }
}
class ScffoldHomeItemState extends State<ScffoldHomeItemPage> {

  ///页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  ///页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}


///3.4.3bottomNavigationBar结合独立的StatefulWidget使用
class ScffoldHomeItemPage1 extends StatefulWidget {
  ///页面标识
  int pageIndex;
  ///构造函数
  ScffoldHomeItemPage1(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState1();
  }
}
class ScffoldHomeItemState1 extends State<ScffoldHomeItemPage1> {

  ///页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  ///页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}




///我的页面
class ScffoldHomeItemPage2 extends StatefulWidget {
  ///页面标识
  int pageIndex;
  ///构造函数
  ScffoldHomeItemPage2(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState2();
  }
}
class ScffoldHomeItemState2 extends State<ScffoldHomeItemPage2> {
  ///页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  ///页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}


