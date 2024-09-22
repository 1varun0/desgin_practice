import 'package:desgin_practice/menufile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Gridview_example.dart';
import 'Listview_example.dart';
import 'mainmenufile.dart';
import 'menufile.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenupage(),
    );
  }
}

