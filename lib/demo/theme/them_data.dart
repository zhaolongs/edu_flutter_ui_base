import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/routes/first_page.dart';

import 'first_them_page.dart';

main() => runApp(themDataFunction4());

MaterialApp themDataFunction() {
  return MaterialApp(
    theme: ThemeData(),
    themeMode: ThemeMode.light,
    darkTheme: ThemeData(),
    home: FirstThemPage(),
  );
}

MaterialApp themDataFunction2() {
  return MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepPurple),
    themeMode: ThemeMode.light,
    darkTheme: ThemeData(brightness: Brightness.dark),
    home: FirstThemPage(),
  );
}

MaterialApp themDataFunction3() {
  return MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.deepPurple,
      accentColor: Colors.red,
      focusColor: Colors.deepPurple,
      hoverColor: Colors.deepPurple,
      highlightColor: Colors.deepPurple,
      splashColor: Colors.deepPurple,
      textTheme: TextTheme(),
      primaryTextTheme: TextTheme(),
      accentTextTheme: TextTheme()
    ),
    themeMode: ThemeMode.light,
    home: FirstThemPage(),
  );
}
MaterialApp themDataFunction4() {

  Divider
  return MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.deepPurple,
      accentColor: Colors.red,
      focusColor: Colors.deepPurple,
      hoverColor: Colors.deepPurple,
      highlightColor: Colors.deepPurple,
      splashColor: Colors.deepPurple,),
    themeMode: ThemeMode.light,
    home: FirstThemPage(),
  );
}
CupertinoApp themData3Function() {
  return CupertinoApp(
    theme: CupertinoThemeData(),
  );
}
