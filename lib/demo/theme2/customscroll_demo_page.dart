import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/theme2/provide_config.dart';
import 'package:mdemo1/demo/theme2/them_config.dart';

class CustomScrollDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State with SingleTickerProviderStateMixin {
  String imageUrl =
      "http://file02.16sucai.com/d/file/2015/0408/779334da99e40adb587d0ba715eca102.jpg";
  String itemImageUrl =
      "https://edu-image.nosdn.127.net/cd8e4994da284885943976d6ac289831.png?imageView&quality=100&crop=0_0_879_495&thumbnail=450y250";

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }


  Color currentColor = Colors.transparent;
  int selectColor = 0;

  @override
  Widget build(BuildContext context) {

    /**
     * 在ios开发中，在对图片进行手动处理的时候，可能用到图层混合，如改变图片的颜色。常常获取CGContext,然后设置其blendMode参数。
     * 在Android开发中 类似于 PorterDuffXferMode.
     * 在前端开发中，css3 mix-blend-mode 混合模式。
     * 在这里使用到了 BlendMode.color
     *      BlendMode.color 取src图像的色调和饱和度，以及dst图像的亮度。其效果是将dst图像与src图像着色。
     *      输出图像的不透明度计算方法与[srcOver]相同。在src图像中完全透明的区域从dst图像中获取它们的色调和饱和度。
     *      BlendMode.srcOver 将src与dst进行组合，如果src和dst有重叠的地方，则以src内容覆盖与dst重叠的地方。
     */
    return ColorFiltered(
      colorFilter: ColorFilter.mode(currentColor, BlendMode.color),
      child: Scaffold(

          ///SingleChildScrollView
          ///NestedScrollView
          ///CustomScrollView
          /// 处理滑动
          body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColor,
                pinned: true,
                snap: false,
                floating: true,
                leading: Icon(Icons.home),
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
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, num index) {
                  return Container(
                    height: 240,
                    color: Colors.black,
                    margin: EdgeInsets.only(bottom: 40),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text("玩转大前端 "),
                          Expanded(
                            child: Image.network(itemImageUrl),
                          )
                        ],
                      ),
                    ),
                  );
                }, childCount: 100),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(4)
              ),
              margin: EdgeInsets.only(right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        currentColor = Colors.transparent;
                      });
                    },
                    child: Text(
                      "正常",
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        currentColor = Colors.grey;
                      });
                    },
                    child: Text(
                      "灰色",
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      selectColor = selectColor==0?1:0;
                      ProvideConfig.value<ThemConfigModel>(context)
                          .setThem(selectColor);
                    },
                    child: Text(
                      "主题切换",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
