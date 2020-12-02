



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDemo2 extends StatefulWidget {

  Function(int index, String message) callback;


  TestDemo2(this.callback);

  @override
  State<StatefulWidget> createState() {
   return _TestDemoState();
  }

}


class _TestDemoState extends State<TestDemo2> {

  @override
  void initState() {
    super.initState();

  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  FlatButton(child: Text("回调"),onPressed: (){
        widget.callback(1,"这是测试数据");
      },),
    );
  }


  void test () async{
     test2();
     test2();
  }
  void test2() async{

  }
}