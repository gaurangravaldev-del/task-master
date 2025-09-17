import 'package:flutter/material.dart';
import 'package:task/SQFlite%20Demo/db.dart';
import 'package:task/SQFlite%20Demo/sqflite_demo.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  late MyDB db = MyDB();

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.Open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQFlite Demo'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: TextFormField(
                  controller: surname,
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    hintText: 'Surname',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: ElevatedButton(
                  onPressed: () {
                    String nm = name.text.toString();
                    String sr = surname.text.toString();
                    String e = email.text.toString();
                    String pass = password.text.toString();
        
                    db.db.rawInsert(
                      "insert into students (name,surname,email, pass) values (?,?,?,?)",
                      [nm, sr, e, pass],
                    );
                    name.clear();
                    surname.clear();
                    email.clear();
                    password.clear();

                    Navigator.pop(context);
                  },
                  child: Text('Insert'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
