import 'package:desgin_practice/counter_app.dart';
import 'package:desgin_practice/input_dart_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Gridview_example.dart';
import 'Homepagefile.dart';
import 'Listview_example.dart';
import 'ToDoExample.dart';

class Menupage extends StatelessWidget {
  const Menupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Practice',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _listbutton(context),
            _gridbutton(context),
            _InputDartExample(context),
          ],
        ),
      ),
    );
  }

  Padding _InputDartExample(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            //pushReplacement if no back wanted
            context,
            MaterialPageRoute(
              builder: (context) => InputDartExample(),
            ),
          );
        },
        child: Text(
          'Input Dart',
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

  Padding _gridbutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            //pushReplacement if no back wanted
            context,
            MaterialPageRoute(
              builder: (context) => GridViewExample(),
            ),
          );
        },
        child: Text(
          'GridView',
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

  Padding _listbutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            //pushReplacement if no back wanted
            context,
            MaterialPageRoute(
              builder: (context) => ListViewExample(),
            ),
          );
        },
        child: Text(
          'ListView',
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
