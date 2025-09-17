import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Game1 extends StatefulWidget {
  const Game1({super.key});

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  TextEditingController txt1 = TextEditingController();
  Random random = Random();
  int randomNum = 0;
  int guessCount = 0;
  final int maxGuesses = 5;
  bool isGameOver = false;
  bool isGameWon = false;

  @override
  void initState() {
    getNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            children: [
              Text('$randomNum'),
              SizedBox(height: 15),
              TextFormField(
                controller: txt1,
                decoration: InputDecoration(
                  label: Text('Enter Number to Guess'),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: (!isGameOver && !isGameWon)
                    ? () {
                        onGeneratedNumber();
                      }
                    : null,
                child: Text('Guess'),
              ),
              SizedBox(height: 15),
              Text('Attempt: $guessCount / $maxGuesses'),
            ],
          ),
        ),
      ),
    );
  }

  getNumber() {
    randomNum = random.nextInt(100);
    guessCount = 0;
    isGameOver = false;
    isGameWon = false;
    txt1.clear();
    print("New Random Number: $randomNum");
  }

  onGeneratedNumber() {
    var num = int.parse(txt1.text.toString());
    setState(() {
      guessCount++;
      if (num == randomNum) {
        isGameWon = true;
        isGameOver = true;
        Fluttertoast.showToast(msg: 'You are win');
      } else if (num < randomNum) {
        Fluttertoast.showToast(msg: 'Guess High Number');
      } else if (num > randomNum) {
        Fluttertoast.showToast(msg: 'Guess Low Number');
      }

      if (guessCount >= maxGuesses && !isGameWon) {
        isGameOver = true;
      }
    });
  }
}
