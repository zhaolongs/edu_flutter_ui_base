import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  return MaterialApp(
    theme: ThemeData(),
    themeMode: ThemeMode.light,
    darkTheme: ThemeData(),
    home: Scaffold(
      body: Center(
        child: Text("灰色"),
      ),
    ),
  );
}
