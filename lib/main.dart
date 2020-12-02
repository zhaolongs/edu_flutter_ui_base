import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index_page.dart';

///程序入口
void main() => runApp(RootApp());

class RootApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RottAppState();
  }
}

class RottAppState extends State<RootApp> {
  ///根布局的初始化
  @override
  void initState() {
    super.initState();

    ///创建 JPush
    JPush jpush = new JPush();

    ///配置应用 Key
    jpush.setup(
      appKey: "",
      channel: "theChannel",
      production: false,

      /// 设置是否打印 debug 日志
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));
  }

  @override
  Widget build(BuildContext context) {
    ///来构建
    return MaterialApp(
      theme: ThemeData(
        buttonTheme:
      ),
      ///应用程序默认显示的页面
      home: IndexPage(),
      localizationsDelegates: [
        ///初始化默认的 Material 组件本地化
        GlobalMaterialLocalizations.delegate,
        ///初始化默认的 通用 Widget 组件本地化
        GlobalWidgetsLocalizations.delegate,

        ///下拉刷新
        RefreshLocalizations.delegate,

      ],

      ///当前区域，如果为null则使用系统区域一般用于语言切换
      ///传入两个参数，语言代码，国家代码
      ///这里配制为中国
      locale: Locale('zh', 'CN'),

      ///定义当前应用程序所支持的语言环境
      supportedLocales: [
        const Locale('en', 'US'), // English 英文
        const Locale('he', 'IL'), // Hebrew 西班牙
        const Locale('zh', 'CN'), // 中文，
      ],
    );
  }
}
