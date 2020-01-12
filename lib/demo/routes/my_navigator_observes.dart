import 'package:flutter/cupertino.dart';

class MyNavigatorObservers extends NavigatorObserver {
  /// 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print("didPush route settings is  " + route.settings.toString());
    print("didPush route settings.name is  " + route.settings.name.toString());

    if (previousRoute != null) {
      print("didPush previousRoute settings is  " +
          previousRoute.settings.toString());
      print("didPush previousRoute settings.name is  " +
          previousRoute.settings.name.toString());
    }
  }

  /// 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print("didPop route settings is  " + route.settings.toString());
    print("didPop route settings.name is  " + route.settings.name.toString());
    if (previousRoute != null) {
      print("didPop previousRoute settings is  " +
          previousRoute.settings.toString());
      print("didPop previousRoute settings.name is  " +
          previousRoute.settings.name.toString());
    }
  }

  /// 当调用Navigator.Remove时回调
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }
}
