import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(100, (i) => 'item ${i + 1}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          'Grid view ex',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1.0, //(width/height)
        ),
        itemBuilder: (context, i) => Card(
          child: Center(
            child: Text(
              items[i],
            ),
          ),
        ),
        itemCount: items.length,
      ),
    );
  }
}
