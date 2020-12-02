import 'package:flutter/material.dart';
import 'package:mdemo1/demo/theme2/provide_config.dart';
import 'package:mdemo1/demo/theme2/them_config.dart';
import 'customscroll_demo_page.dart';





void main() => runApp(

    ProvideConfig.init(child: MyApp())

);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ProvideConfig.connect<ThemConfigModel>(
        builder: (context, child, ThemConfigModel model) {
      ///每次通知数据刷新时，builder将会重新构建这个小部件。
      return MaterialApp(
        title: '看看灰色应用',
        theme: model.defaultTheme,
        home: CustomScrollDemoPage(),
      );
    });
  }
}
