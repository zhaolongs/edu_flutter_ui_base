import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'language_config.dart';

///创建flutter 程序的入口函数
///
void main() => runApp(LanuageMainApp());

///创建一个全局的KEY 用来全局内调用语言切换
GlobalKey<ChangeLocalizationState> _globalKey = new GlobalKey();

///创建应用程序的根布局
class LanuageMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///通过 MaterialApp 组件 构建
    return MaterialApp(
      home: new Builder(builder: (context) {
        return new ChangeLocalization(LanuageHomePage(), key: _globalKey);
      },),

      localizationsDelegates: [
        ///初始化默认的 Material 组件本地化
        GlobalMaterialLocalizations.delegate,

        ///初始化默认的 通用 Widget 组件本地化
        GlobalWidgetsLocalizations.delegate,

        ///自定义的语言配制文件代理 初始化
        MyLocationsLanguageDelegates.delegate,
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

///创建一个 在应用内切换 语言环境的类
class ChangeLocalization extends StatefulWidget {
  final Widget child;

  ChangeLocalization(this.child, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ChangeLocalizationState();
  }
}

class ChangeLocalizationState extends State<ChangeLocalization> {
  ///当前的语言环境 中文
  Locale _locale = const Locale('zh', 'CH');

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    ///参数 一 使用到的语言环境
    ///参数 二 子Widget
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}

///创建默认的首页面
class LanuageHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LanuageHomePageState();
  }
}

class LanuageHomePageState extends State<LanuageHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 国际化配制"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child:  Text(MyLocationsLanguages.of(context).button1),
            onPressed: () {
              print("点击了简体中文本");
              switchLanguage(0);
            },
          ),
          FlatButton(
            child:  Text(MyLocationsLanguages.of(context).button2),
            onPressed: () {
              print("点击了英文");
              switchLanguage(1);
            },
          ),
          FlatButton(
            child: Text(MyLocationsLanguages.of(context).button3),
            onPressed: () {
              print("点击了西班牙");
              switchLanguage(2);
            },
          ),
        ],
      ),
    );
  }

  ///用来切换语言环境
  void switchLanguage(num index) {
    switch (index) {
      case 0:

        ///中文
        _globalKey.currentState.changeLocale(Locale('zh', 'CN'));
        break;
      case 1:

        ///英语
        _globalKey.currentState.changeLocale(Locale('en', 'US'));
        break;
      case 2:
        _globalKey.currentState.changeLocale(Locale('he', 'IL'));
        break;
    }
  }
}
