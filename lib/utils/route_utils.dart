import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 路由工具类
///
class RouteUtils {
  ///跳转页面
  static void pushPage(BuildContext context, Widget page) {
    if (page == null) {
      return;
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => page));
  }

  ///替换跳转页面
  static void pushRePage(BuildContext context, Widget page) {
    if (page == null) {
      return;
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => page));
  }

  ///关闭当前显示的页面
  static void popPage(BuildContext context,){
    Navigator.pop(context);
  }
}
