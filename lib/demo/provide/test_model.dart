

///代码块2-8-2-2

import 'package:flutter/widgets.dart';

///ChangeNotifier 消息监听者与notifyListeners()结合实现消息通信
///类似iOS中的notify与Android中的广播
class TestModel extends ChangeNotifier{
  ///定义数据变量
  ///这里定义变量使用下划线开头，限制了当前变量只能在本TestModel类中进行访问使用
  ///所以提供了一个get方法来使外部来调用
  ///个人认为这种思想起源于Java中的面向对象
  String  _testTitle = "这是初始化数据";
  String get getTestTitle => _testTitle;

  ///修改文字
  void updateText(String message) {
    _testTitle = message;
    ///发送文本修改的消息通知
    notifyListeners();
  }
}