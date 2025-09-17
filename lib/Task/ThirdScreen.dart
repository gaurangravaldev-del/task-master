import 'package:flutter/material.dart';

class Thirdscreen extends StatefulWidget {
  const Thirdscreen({super.key});

  @override
  State<Thirdscreen> createState() => _ThirdscreenState();
}

class _ThirdscreenState extends State<Thirdscreen> {
  bool _isSelected = true;
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Current Mood: ", style: TextStyle(fontSize: 18)),
          Text(
            _isSelected ? "😊 Happy" : "😔 Sad",
            style: TextStyle(fontSize: 24),
          ),

          SizedBox(height: 8.0),
          ToggleButtons(
            children: [Text("😊 Happy"), Text("😔 Sad")],
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                if (index == 0) {
                  _isSelected = true;
                  isSelected = [true, false];
                } else {
                  _isSelected = false;
                  isSelected = [false, true];
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
