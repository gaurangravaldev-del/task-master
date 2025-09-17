import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Countergame extends StatefulWidget {
  const Countergame({super.key});

  @override
  State<Countergame> createState() => _CountergameState();
}

class _CountergameState extends State<Countergame> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Game'), centerTitle: true),
      body: Center(child: Column(children: [Text('Count is: $counter')])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Timer(Duration(seconds: 10), () {
            setState(() {
              counter++;
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
