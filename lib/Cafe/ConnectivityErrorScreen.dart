import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Connectivityerrorscreen extends StatelessWidget {
  const Connectivityerrorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/No_Connection.json'),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Text(
                '\t\t \tOOPS! \nNo Internet',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
