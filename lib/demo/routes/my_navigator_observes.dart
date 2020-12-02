import 'package:flutter/cupertino.dart';

class MyNavigatorObservers extends NavigatorObserver {
  /// 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);

    print("didPush目标的路由名称是 " + route.settings.name.toString());
    print("didPush目标的路由是否是InitialRoute配置的初始化路由 " + route.settings.isInitialRoute.toString());
    print("didPush目标的路由携带的参数 " + route.settings.arguments.toString());

    if (previousRoute != null) {
      print("上一个路由的名称是 " +
          previousRoute.settings.name.toString());
    }else{
      ///当为第一个初始化页面时 previousRoute是为null的
    }

  }

  /// 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print("didPop 目标的路由名称是 " + route.settings.name.toString());
    print("didPop 目标的路由是否是InitialRoute配置的初始化路由 ");
    print("didPop 目标的路由携带的参数 " + route.settings.arguments.toString());

    if (previousRoute != null) {
      print("didPop 上一个路由的名称是 " +
          previousRoute.settings.name.toString());
    }else{
      ///当为第一个初始化页面时 previousRoute是为null的
    }

  }

  /// 当调用Navigator.Remove时回调
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }
}
