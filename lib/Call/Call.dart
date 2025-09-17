import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallFuncions extends StatefulWidget {
  const CallFuncions({super.key});

  @override
  State<CallFuncions> createState() => _CallFuncionsState();
}

class _CallFuncionsState extends State<CallFuncions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact US",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            onPressed: () {
              call();
            },
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {
              sms();
            },
            icon: Icon(Icons.sms),
          ),
          IconButton(
            onPressed: () {
              print("Email Successfully!!!");
            },
            icon: Icon(Icons.email),
          ),
        ],
      ),
    );
  }

  Future<void> call() async {
    Uri _url = Uri.parse('tel: 8238658897');
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> sms() async {
    Uri _url = Uri.parse('sms: 8238658897?body=Hello');
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
