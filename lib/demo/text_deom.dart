



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/text_deom2.dart';


main()=>runApp(MaterialApp(home: TestDemo(),));

class TestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return _TestDemoState();
  }

}


class _TestDemoState extends State<TestDemo> {


  Function(int index,String message) callback;

  @override
  void initState() {
    super.initState();

    callback =(int index,String message ){
      print("$index ${message}");
    };

    callback = initCallbackFunction;
  }


  initCallbackFunction(int index,String message ){

    print("$index ${message}");
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(),
     body: FlatButton(child: Text("测试"),onPressed:(){
       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
         return TestDemo2(callback);
       }));
     },),
   );
  }

}