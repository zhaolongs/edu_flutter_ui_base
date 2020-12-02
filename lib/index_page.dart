import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base/base_page.dart';
import 'guid_page.dart';
///应用程序的启动页面
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

///启动页面
///本地数据缓存
class IndexPageState extends BasePage<IndexPage> {
  ///是否是第一次使用  false  null 是第一次 跳转引导 页面
  bool misFirst;

  ///是否显示背景图
  bool mIsShowbg = false;

  ///倒计时工具类
  TimerUtil mTimerUtil;

  num mTick = 0;

  @override
  void initState() {
    super.initState();

    ///
    /// [mInterval] 设置的是时间间隔
    /// mTotalTime 设置倒计时总时间
    mTimerUtil = new TimerUtil(mInterval: 100, mTotalTime: 5000);

    ///计时回调
    mTimerUtil.setOnTimerTickCallback((int tick) {
      setState(() {
        mTick = tick / 1000;
        print("mTick $mTick");
        if (mTick == 0) {
//          RouteUtils.pushRePage(context, HomePage());
          ///跳转首页面
//          Navigator.of(context).pushReplacement(
//              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
//          pushRePage(HomePage());
          pushHomePage();
        }
      });
    });

    ///加载数据缓存
    readCacheData();
  }

  var tset=0;





  void test( va, ca){

    int c = va;

    Map<String,String > map = Map();

  }

  ///异步读取数据 async
  void readCacheData() async {
    ///读取数据
    ///NSUserDefaults (on iOS) and SharedPreferences (on Android)
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ///是否是第一次使用
    bool isFirst = prefs.getBool("flutter_x_is_first");
    if (isFirst == null || isFirst == false) {
      ///第一次使用
      /// 去引导 页面
      /// 保存使用标识
      prefs.setBool("flutter_x_is_first", true);
      ///跳转引导页面
      pushRePage(GuidePage());
    } else {
      ///非第一次使用
      /// 显示倒计时
      /// 启动倒计时、
      mTimerUtil.startCountDown();
    }

    misFirst = isFirst;
    mIsShowbg = true;
    setState(() {});
    print("读取缓存 数据  $isFirst");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildWecomeBg(),
          buildTimerProgerss(),
          buildLoadingProgerss(),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "images/2.0/logo.jpg",
                    width: 28.0,
                    height: 28.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 14.0,
                ),
                Text("flutter-x 欢迎您")
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///构建背景
  buildWecomeBg() {
    if (mIsShowbg) {
      return Image.asset("images/2.0/welcome_bg.jpeg");
    } else {
      return Container();
    }
  }

  ///构建倒计时的圆形进度
  buildTimerProgerss() {
    num cirValue = 0.0;
    if (mTick == 5) {
      cirValue = 0.0;
    } else {
      cirValue = (5.0 - mTick) / 5.0;
    }
    return Positioned(
      right: 20,
      bottom: 20,
      child:InkWell(
        onTap: (){
          ///关闭倒计时
          if(mTimerUtil.isActive()){
            mTimerUtil.cancel();
          }
          ///点击跳过
          pushHomePage();
        },
        child:  SizedBox(
          width: 55.0,
          height: 55.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  ///0.0 - 1.0
                  /// 5-0
                  /// mTick==5.0?0.0:5.0/(5.0-mTick)
                  value: cirValue,
                ),
              ),
              Center(
                child: Text("${mTick.toInt()}s"),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///构建加载中间进度
  buildLoadingProgerss() {
    if (mIsShowbg) {
      return Container();
    } else {
      return Positioned(
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}
