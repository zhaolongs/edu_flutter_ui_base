import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 页面中间弹框
void showCenterToast(String message,{ToastGravity toastGravity=ToastGravity.CENTER}) {
  /// 根据消息长度决定自动消失时间
  double multiplier = .5;
  int timeInSecForIos = (multiplier * (message.length * 0.06 + 0.5)).round();
  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colors.black87,
    gravity: toastGravity,
    /// 只针对iOS生效的消失时间
    timeInSecForIos: timeInSecForIos,
  );
}
