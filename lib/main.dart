import 'package:flutter/material.dart';
import './homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeMode _theme = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: _theme,
      debugShowCheckedModeBanner: false,
      title: 'STOPWATCH',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(_theme),
    );
  }
}
