import 'package:flutter/material.dart';
import 'package:mdemo1/demo/theme/provide_config.dart';
import 'package:mdemo1/demo/theme/them_config.dart';

///flutter 程序的入口函数
///执行runApp 方法 为应用程序创建了一个 root 根布局
void main() => runApp(ProvideConfig.init(child: MyThemApp()));

class MyThemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ProvideConfig.connect<ThemConfigModel>(builder: (context, child,ThemConfigModel model) {
      ///每次通知数据刷新时，builder将会重新构建这个小部件。
      return MaterialApp(
      theme: model.defaultTheme,
      home: MyHomePage(),
    );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("应用主题切换"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("亮色"),
              onPressed: () {
                print("点击了亮色");

                ProvideConfig.value<ThemConfigModel>(context).setThem(0);
              },
            ),
            FlatButton(
              child: Text("暗色"),
              onPressed: () {
                print("点击了暗色");
                ProvideConfig.value<ThemConfigModel>(context).setThem(1);
              },
            ),
            FlatButton(
              child: Text("紫色"),
              onPressed: () {
                print("点击了紫色");
                ProvideConfig.value<ThemConfigModel>(context).setThem(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
