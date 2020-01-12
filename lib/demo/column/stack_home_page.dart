import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RowHomePageState();
  }
}

class RowHomePageState extends State {
  @override
  Widget build(BuildContext context) {


    num sWidth =MediaQuery.of(context).size.width;
    num sHeight =MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stack 配制"),
      ),

      /// Stack 默认是包裹子 Widget
      body: Container(
        width: sWidth,
        height: sHeight,
        child: Stack(
          ///排列所有的子 Widget
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.grey,
            ),
            Positioned(
              bottom: 150,
              right: 10,
              child: Container(
                width: 200,
                height: 120,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
