import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/routes/scend_page.dart';

import 'error_page.dart';
import 'first_page.dart';
import 'my_navigator_observes.dart';

///精讲 路由的启动类
void main() => runApp(RoutesApp());

///定义根目录
class RoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
//      //ScendPage就是我们要打开的目标页面
//      return new ScendPage();
//    }),);
//
//    // 带返回值
//    Navigator.of(context).pushNamed('/router/second').then((value) {
//      // 这里的 value 就是 打开的 /router/second对应的页面关闭时回传的数据
//    });
    return
      MaterialApp(

        ///配制路由规则
        routes: {
          ///默认页面
          "/":(BuildContext context) => FirstPage(),
          "/first": (BuildContext context) => FirstPage(),
          "/scend": (BuildContext context) => ScendPage(),
        },

        ///配制显示默认页面的第二种方式
//      home: FirstPage(),
        ///配制显示默认页面的第三种方式
//        initialRoute: "/first",

        ///配制404 页面
        onGenerateRoute: (RouteSettings settings) {
          return new MaterialPageRoute(
              builder: (BuildContext contex) => ErrorPage());
        },

        ///兼听所有的页面路由
        navigatorObservers: <NavigatorObserver>[
          ///创建自定义路由兼听
          MyNavigatorObservers(),
        ],
      );
  }
}

