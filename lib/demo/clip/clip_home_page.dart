import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClipHomePageState();
  }
}

class ClipHomePageState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipHomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: 300,
              alignment: Alignment.center,
              color: Colors.grey,

              ///用来将子Widget 裁剪成椭圆圆形
              /// 默认裁剪成圆形
              child: ClipOval(
                ///用来定义裁剪路径
//                clipper: ,
                /// Clip.none 表示不裁剪  在这里不能使用
                /// Clip.hardEdge 裁剪时 不抗锯齿
                /// Clip.antiAlias 裁剪时 抗锯齿
                /// Clip.antiAliasWithSaveLayer
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Container(
              width: width,
              height: 300,
              alignment: Alignment.center,
              color: Colors.grey,

              ///用来将子Widget 裁剪成椭圆圆形
              /// 默认裁剪成矩形
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ///用来定义裁剪路径
//                clipper: ,
                /// Clip.none 表示不裁剪  在这里不能使用
                /// Clip.hardEdge 裁剪时 不抗锯齿
                /// Clip.antiAlias 裁剪时 抗锯齿
                /// Clip.antiAliasWithSaveLayer
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Container(
              width: width,
              height: 300,
              alignment: Alignment.center,
              color: Colors.grey,

              ///用来将子Widget 裁剪成椭圆圆形
              /// 默认裁剪成矩形
              child: ClipPath(
                ///用来定义裁剪路径
                clipper: CustomPathClip(),
                /// Clip.none 表示不裁剪  在这里不能使用
                /// Clip.hardEdge 裁剪时 不抗锯齿
                /// Clip.antiAlias 裁剪时 抗锯齿
                /// Clip.antiAliasWithSaveLayer
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomPathClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path = new Path();

    ///将起点移动到点
    path.moveTo(100, 0);
    ///画直线
    path.lineTo(150, 100);
    path.lineTo(50, 100);
    ///闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
