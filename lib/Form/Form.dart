import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form", style: TextStyle(fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: Colors.pink,
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
      body: WillPopScope(
        onWillPop: () async {
          return await showAlert();
        },
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: TextFormField(
                      controller: id,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter ID!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ID',
                        hintText: 'ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Name!';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Surname';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        hintText: 'Gender',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? value) {},
                      items: ['Male', 'Female'].map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: TextFormField(
                      maxLength: 10,
                      controller: mobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Mobile';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        hintText: 'Mobile',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logged In Successful')),
                          );
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Invalid')));
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showAlert() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ],
      ),
    );
    return true;
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
