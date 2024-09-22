import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}


class InputDartExample extends StatefulWidget {
  const InputDartExample({super.key});

  @override
  State<InputDartExample> createState() => _InputDartExampleState();
}

class _InputDartExampleState extends State<InputDartExample> {
  final name = TextEditingController();
  bool checked = false;
  Gender g = Gender.male;
  final countries = ['India', 'Nepal', 'Russia', 'USA', 'Australia', 'Brazil'];
  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              label: Text(
                'Enter your name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                print(name.text);
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = value!;
                    });
                  }),
              Text('Flutter'),
            ],
          ),
          Row(
            children: [
              Radio<Gender>(
                  value: Gender.male,
                  groupValue: g,
                  onChanged: (value) {
                    setState(() {
                      g = value!;
                    });
                  }),
              Text('Male'),
              Radio<Gender>(
                  value: Gender.female,
                  groupValue: g,
                  onChanged: (value) {
                    setState(() {
                      g = value!;
                    });
                  }),
              Text('female'),
            ],
          ),
          DropdownButton<String>(
              hint: Text('Select your country'),
              value: country,
              items: countries
                  .map((a) => DropdownMenuItem<String>(
                        value: a,
                        child: Text(a),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  country=value;
                });
              }),
        ],
      ),
    );
  }
}
