import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  ///关闭当前页面
  ///[context]当前页面的Context
  ///[parameters]回传上一个页面的参数
  static pop(BuildContext context, {parameters}) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop(parameters);
    } else {
      ///最后一个页面不可pop
    }
  }

  ///[context]当前页面的Context
  ///[routeName]目标页面的路由名称
  ///[paramtes]向目标页面传的参数
  ///[callback]目标页面关闭时的回调函数
  static pushName(BuildContext context, String routeName,
      {paramtes, Function callback}) {
    Navigator.of(context)
        .pushNamed(routeName, arguments: paramtes)
        .then((value) {
      if (callback != null) {
        callback(value);
      }
    });
  }

  ///动态路由方法封装
  ///[context]当前页面的Context
  ///[routeName]目标页面的路由名称
  ///[paramtes]向目标页面传的参数
  ///[callback]目标页面关闭时的回调函数
  static pushPage(BuildContext context, Widget page,
      {String routeName, paramtes, Function callback}) {
    PageRoute pageRoute;
    ///是导入io包
    if(Platform.isIOS){
      ///ios平台使用支持滑动关闭页面的路由控制
      pageRoute =new CupertinoPageRoute(builder: (_) {
        return page;
      }, settings: RouteSettings(name: routeName, arguments: paramtes),);
    }else {
      ///Android等其他平台使用Material风格的路由控制
      pageRoute =new MaterialPageRoute(builder: (_) {
        return page;
      }, settings: RouteSettings(name: routeName, arguments: paramtes),);
    }
    ///压栈
    Navigator.of(context).push(pageRoute).then((
        value) {
      ///目标页面关闭时回调函数与回传参数
      if (callback != null) {
        callback(value);
      }
    });
  }


  static pushPageRelpact(BuildContext context, Widget page,
      {String routeName, paramtes, Function callback}) {
    PageRoute pageRoute;
    ///是导入io包
    if(Platform.isIOS){
      ///ios平台使用支持滑动关闭页面的路由控制
      pageRoute =new CupertinoPageRoute(builder: (_) {
        return page;
      }, settings: RouteSettings(name: routeName, arguments: paramtes),);
    }else {
      ///Android等其他平台使用Material风格的路由控制
      pageRoute =new MaterialPageRoute(builder: (_) {
        return page;
      }, settings: RouteSettings(name: routeName, arguments: paramtes),);
    }
    ///压栈
    Navigator.of(context).pushReplacement(pageRoute).then((
        value) {
      ///目标页面关闭时回调函数与回传参数
      if (callback != null) {
        callback(value);
      }
    });
  }
}
