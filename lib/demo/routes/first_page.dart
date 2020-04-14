import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/routes/scend_page.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击跳转第二个页面"),
          onPressed: () {
            pushOpen12(context);
          },
        ),
      ),
    );
  }
}

///静态路由push页面无参数
void pushOpen1(BuildContext context) {
  Navigator.of(context).pushNamed("/scend");
}

///静态路由push页面并传参数
///then获取目标页面回传的参数
void pushOpen2(BuildContext context) {
  Map<String, String> map = new Map();
  map["title"] = "ABCS321A";

  ///跳转第二个页面
  ///[arguments]传到第二个页面的参数
  Navigator.of(context).pushNamed("/scend", arguments: map).then((value) {
    Map<String, String> resultMap = value;
    print("页面二回传的数据是 ${resultMap['result']}");
  });
}

void pushOpen3(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
    return new ScendPage();
  }));
}

void pushOpen6(BuildContext context) {
  Map<String, String> map = new Map();
  map["title"] = "234";
  Navigator.of(context).push(new MaterialPageRoute(
      builder: (_) {
        return new ScendPage();
      },
      settings: RouteSettings(name: "/scend", arguments: map)));
}

void pushOpen7(BuildContext context) {
  Map<String, String> map = new Map();
  map["title"] = "234";
  Navigator.of(context)
      .push(
        new MaterialPageRoute(
          builder: (_) {
            return new ScendPage();
          },
          settings: RouteSettings(name: "/scend", arguments: map),
        ),
      )
      .then((value) {});
}

void pushOpen4(BuildContext context) {
  Navigator.of(context).push(new CupertinoPageRoute(builder: (_) {
    return new ScendPage();
  }));
}

void pushOpen5(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
      (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
    ///目标页面
    return new ScendPage();
  }, transitionsBuilder: (
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    /// 添加一个平移动画
    return new SlideTransition(
      ///平的位置
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }));
}

void pushOpen8(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
      (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
    ///目标页面
    return new ScendPage();
  }, transitionsBuilder: (
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    ///渐变过渡动画
    return FadeTransition(
      /// 透明度从 0.0-1.0
      opacity: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          //动画样式
          parent: animation,
          //动画曲线
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: child,
    );
  }));
}

void pushOpen9(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        ///目标页面
        return new ScendPage();
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        ///旋转过渡动画
        return RotationTransition(
          //设置动画的旋转中心
          alignment: Alignment.topLeft,

          ///旋转角度
          turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              //动画样式
              parent: animation,
              //动画曲线 先抖动再旋转
              curve: Curves.bounceIn,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 3000)));
}

void pushOpen10(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        ///目标页面
        return new ScendPage();
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        ///平移过渡动画
        return SlideTransition(
          /// 从位置(-1.0, 0.0) 平移到 (0.0, 0.0)
          position:
              Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(
              //动画样式
              parent: animation,
              //动画曲线
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 3000)));
}

void pushOpen11(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
      (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
    ///目标页面
    return new ScendPage();
  }, transitionsBuilder: (
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    ///缩放过渡动画
    return ScaleTransition(
      ///缩放中收
      alignment: Alignment.centerRight,

      /// 从 0.0-1.0
      scale: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          //动画样式
          parent: animation,
          //动画曲线
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: child,
    );
  }));
}

void pushOpen12(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
      (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
    ///目标页面
    return new ScendPage();
  }, transitionsBuilder: (
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    ///缩放过渡动画
    return SlideTransition(
      /// 从位置(-1.0, 0.0) 平移到 (0.0, 0.0)
      position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(
          //动画样式
          parent: animation,
          //动画曲线
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: FadeTransition(
        /// 透明度从 0.0-1.0
        opacity: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            //动画样式
            parent: animation,
            //动画曲线
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      ),
    );
  }));
}

void pushOpen13(BuildContext context){
  ///使用静态路由方式从A页面打开B页面
  Navigator.of(context).pushNamed("/B");
  ///在B页面中打开C页面
  Navigator.of(context).pushReplacementNamed("/C");
  ///使用动态路由方式从A页面打开B页面
  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
    return new ScendPage();
  }));
  ///在B页面中打开C页面
  Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
    return new ScendPage();
  }));

  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (_) {
    return new ScendPage();
  }), (route) => false);

  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }

  Navigator.of(context).maybePop();

//  Navigator.of(context).pushNamedAndRemoveUntil(newRouteName, (route) => false)
}

//
