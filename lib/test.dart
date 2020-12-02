import 'package:flutter/material.dart';

import 'demo/language/language_data2.dart';


///代码块2-8-2-3 
import 'package:provider/provider.dart';
void main() {
  //程序入口函数 
  runApp( 
      ///将Provider配制在程序的最顶层       ChangeNotifierProvider<TestModel>.value(         ///value就是监听的数据模型对象         value: TestModel(),         ///这里最好是根widget         child: MyApp(),       )   ); }
}


///代码块 2-7-4-1
///2.7.4 accentColor 属性分析

void fu() {
  ///2.7.4 accentColor 属性分析
  MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.red),
    themeMode: ThemeMode.light,
    home: FirstThemPage(),
  );
}

