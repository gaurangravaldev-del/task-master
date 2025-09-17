import 'package:flutter/material.dart';
import 'package:task/Cafe/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String uEMail = "admin@gmail.com", uPassword = "12345";

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  hintText: 'Enter Email',
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Valid Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: 'Enter Password',
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (uEMail == email.text.toString() &&
                        uPassword == password.text.toString()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logged In Successful')),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid Email & Password')),
                      );
                    }
                  }
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
