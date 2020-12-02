import 'package:flutter/material.dart';

///代码块2-8-2-2

import 'package:flutter/widgets.dart';

///ChangeNotifier 消息监听者与notifyListeners()结合实现消息通信
///类似iOS中的notify与Android中的广播
class TestThemModel extends ChangeNotifier {
  ///定义主题
  ThemeData defalutThemData = new ThemeData();

  ///修改文字
  void selectTheme(int themeIndex) {

    ///发送主题修改的消息通知
    notifyListeners();


  }
}





