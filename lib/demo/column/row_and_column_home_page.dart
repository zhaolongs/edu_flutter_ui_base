import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowAndColumnHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RowHomePageState();
  }
}

class RowHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Column 混合配制"),
      ),
      body: Column(
        children: <Widget>[
          Container(height: 48,child: Row(children: <Widget>[
            Expanded(flex: 1,child: Text("热点1",textAlign: TextAlign.center,),),
            Expanded(flex: 1,child:Text("热点2",textAlign: TextAlign.center),),
            Expanded(flex: 1,child:Text("热点3",textAlign: TextAlign.center),),
            Expanded(flex: 1,child: Text("热点4",textAlign: TextAlign.center),),
          ],),),
          Container(color: Colors.grey,height: 1,),
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
