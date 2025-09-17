import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Likes: $value"),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              setState(() {
                value++;
              });
            },
            child: Text("Click Me!!"),
          ),
        ],
      ),
    );
  }
}
