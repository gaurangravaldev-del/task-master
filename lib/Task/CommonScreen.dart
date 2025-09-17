import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:task/Task/FirstScreen.dart';
import 'package:task/Task/FourthScreen.dart';
import 'package:task/Task/SecondScreen.dart';
import 'package:task/Task/ThirdScreen.dart';

class Commonscreen extends StatelessWidget {
  const Commonscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleTapToExit(
      snackBar: const SnackBar(content: Text("Double Tap to exit!")),
      child: Scaffold(
        appBar: AppBar(title: Text("Test"), backgroundColor: Colors.grey),
        body: Column(
          children: [
            SizedBox(height: 15),
            FirstScreen(),
            SizedBox(height: 15),
            Secondscreen(),
            SizedBox(height: 15),
            Thirdscreen(),
            SizedBox(height: 15),
            Fourthscreen(),
          ],
        ),
      ),
    );
  }
}
