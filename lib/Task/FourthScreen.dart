import 'package:flutter/material.dart';

class Fourthscreen extends StatelessWidget {
  const Fourthscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 8),
          Text("Powered By Flutter", style: TextStyle(fontSize: 15.0)),
        ],
      ),
    );
  }
}
