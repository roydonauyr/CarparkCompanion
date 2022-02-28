import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';

class Register extends StatefulWidget {
  //To toggle between the register and sign in page
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //For firebase authentication
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  //Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: Text('Register an account for Carpark Companion'),
          actions: <Widget>[
            TextButton.icon(
                icon: Icon(Icons.person, color: Colors.black),
                onPressed: () {
                  widget.toggleView();
                },
                label: const Text("Sign In"),
                style: TextButton.styleFrom(primary: Colors.black))
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //Email
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                //Password
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (val) =>
                      val!.length < 6 ? 'Enter password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = "Invalid Email/Password");
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )),
    );
  }
}
