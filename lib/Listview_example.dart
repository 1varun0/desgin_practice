import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> items = List.generate(100, (i) => 'Item ${i + 1}');

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          "ListView Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        // children: (items.map((a) =>Text(a))) .toList(),   //we are mapping elements of the item list to text widget.Then converting the widget into list, children takes list.

        // itemCount: 100,
        // itemBuilder: (context,i) => Padding(
        //   padding: const EdgeInsets.all(4.0),
        //   child: ListTile(
        //     tileColor: i.isEven?Colors.grey.shade300:Colors.grey.shade500,
        //     title: Text('Item ${i+1}'),
        //     subtitle: Text('This is subtitle ${i+1}'),

        itemCount: items.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            tileColor: i.isEven ? Colors.grey.shade300 : Colors.grey.shade500,
            title: Text('Item ${i + 1}'),
            subtitle: Text('This is subtitle ${i + 1}'),
          ),
        ),
      ),
    );
  }
}
