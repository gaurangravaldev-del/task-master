import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/Cafe/ConnectivityErrorScreen.dart';
import 'package:task/Cafe/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.mobile)) {
        Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          ),
        );
      } else if (result.contains(ConnectivityResult.wifi)) {
        Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          ),
        );
      } else {
        Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Connectivityerrorscreen()),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Lottie.asset('assets/gif.json')),
      ),
    );
  }
}
