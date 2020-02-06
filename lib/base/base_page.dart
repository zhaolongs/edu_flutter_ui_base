import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mdemo1/utils/route_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart' as extended;
import '../home_page.dart';

///基类
/// 1[pushPage]  打开页面方法
/// 2 [pushRePage]打开页面 并替换当前显示页面
/// 3 [popPage] 关闭当前页面
abstract class BasePage<T extends StatefulWidget> extends State<T> {
  ///打开页面
  void pushPage(Widget page) {
    RouteUtils.pushPage(context, page);
  }

  ///打开页面 并替换当前显示页面
  void pushRePage(Widget page) {
    RouteUtils.pushRePage(context, page);
  }

  ///关闭当前页面
  void popPage() {
    RouteUtils.popPage(context);
  }

  ///打开首页面
  void pushHomePage(){
    pushRePage(HomePage());
  }


  ///NestedScrollViewRefresh 设置下拉刷新
  Widget buildNestedScrollViewRefresh(extended.NestedScrollView scrollView,Function refreshCallback){
    return NestedScrollViewRefreshIndicator(child: scrollView,onRefresh:refreshCallback ,);
  }


  RefreshController refreshController = new RefreshController();
  final RefreshIndicator defaultHeader =
  defaultTargetPlatform == TargetPlatform.iOS
      ? ClassicHeader(height: 66,)
      : MaterialClassicHeader();

  Widget buildSmartRefresh(Widget childWidth) {
    return SmartRefresher(
      ///控制器
      controller: refreshController,
      ///上拉加载更多数据
      enablePullUp: true,
      ///下拉刷新数据
      enablePullDown: true,
      ///下拉刷新回调
      onRefresh: onRefresh,
      ///上拉加载更多回调
      onLoading: onLoading,
      child: childWidth,
      header: defaultHeader,

    );
  }


  onRefresh() async {
    Future.delayed(Duration(milliseconds: 3000), () {
      refreshController.refreshCompleted();
    });
  }

  onLoading() async {
    Future.delayed(Duration(milliseconds: 3000), () {
//      refreshController.loadComplete();
//    refreshController.loadFailed();
    refreshController.loadNoData();
    });
  }
}
