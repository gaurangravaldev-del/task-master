
import 'package:flutter/material.dart';


import 'countergame.dart';
import 'game1.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  int selectedIndex = 0;
  int currentIndex = 0;
  //static List _screen = [Text('Tab 1'), Text('Tab 1')];
  final List<Widget> navScreen = [Game1(), Countergame()];

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Tab 1',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Tab 2',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: navScreen[currentIndex],
    );
  }

}
