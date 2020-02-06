import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/base/base_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///引导页面
class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GuidePageState();
  }
}

class GuidePageState extends BasePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 通过Swiper 组件来构建 引导
      body: new Swiper(
        ///构建页面
        itemBuilder: (BuildContext context, int index) {
          if (index == 2) {
            return Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Image.asset(
                    "images/2.0/s0${index + 1}.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 120,),
                      Text(
                        "山高水长",
                        style: TextStyle(color: Colors.white,fontSize: 22),
                      ),

                      SizedBox(height: 22,),
                      Text(
                        "flutterx 与您同行",
                        style: TextStyle(color: Colors.white,fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 0,
                  right: 0,
                  child: Center(
                    ///Material 构建 Material Design 风格样式
                    ///水波效果必须在 Material 风格下才有
                    child: Material(
                      ///设置背景的圆角
                      borderRadius: BorderRadius.all(Radius.circular(22)),

                      ///Ink InkWell 为了实现有 圆角水波纹点击效果
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            print("点击了进入");
                            pushHomePage();
                          },
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                          splashColor: Colors.grey,
                          child: Container(
                            width: 90,
                            height: 28,
                            alignment: Alignment.center,
                            child: Text("进入首页"),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return new Image.asset(
            "images/2.0/s0${index + 1}.jpeg",
            fit: BoxFit.fill,
          );
        },

        ///引导页面数
        itemCount: 3,

        ///圆点指示
        pagination: new SwiperPagination(),

        ///控制器
//       control: new SwiperControl(),
      ),
    );
  }
}
