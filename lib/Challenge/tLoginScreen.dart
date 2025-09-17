import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/Challenge/QuizScreen.dart';

class Tloginscreen extends StatefulWidget {
  const Tloginscreen({super.key});

  @override
  State<Tloginscreen> createState() => _TloginscreenState();
}

class _TloginscreenState extends State<Tloginscreen> {
  late String email1, pswd1;
  TextEditingController email = TextEditingController();
  TextEditingController pswd = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  var newLogin;

  @override
  void initState() {
    // TODO: implement initState
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(hintText: 'Enter Email ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Email ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: pswd,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Enter Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Email ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    email1 = email.text.toString();
                    pswd1 = pswd.text.toString();
                    sharedPreferences.setBool('cred', false);
                    sharedPreferences.setString('emailAdd', email1);
                    sharedPreferences.setString('pswd', pswd1);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Quizscreen()),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newLogin = (sharedPreferences.getBool('cred') ?? true);
    if (newLogin == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Quizscreen()),
      );
    }
  }
}
