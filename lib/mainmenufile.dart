import 'package:desgin_practice/counter_app.dart';
import 'package:desgin_practice/input_dart_example.dart';
import 'package:desgin_practice/menufile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Gridview_example.dart';
import 'Homepagefile.dart';
import 'Listview_example.dart';
import 'Projectspagefile.dart';
import 'ToDoExample.dart';


class MainMenupage extends StatelessWidget {
  const MainMenupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _projectbutton(context),
            _practicebutton(context),
          ],
        ),
      ),
    );
  }

  Padding _practicebutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            //pushReplacement if no back wanted
            context,
            MaterialPageRoute(
              builder: (context) => Menupage(),
            ),
          );
        },
        child: Text(
          'Practice',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }

  Padding _projectbutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            //pushReplacement if no back wanted
            context,
            MaterialPageRoute(
              builder: (context) => ProjectsPage(),
            ),
          );
        },
        child: Text(
          'Projects',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}