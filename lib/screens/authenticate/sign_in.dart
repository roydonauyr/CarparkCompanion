import 'package:flutter_application_2/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //To toggle between the register and sign in page
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 40, 90),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 27, 66),
          elevation: 0.0,
          title: Text('Sign in to Carpark Companion'),
          actions: <Widget>[
            TextButton.icon(
                icon: Icon(Icons.person,
                    color: Color.fromARGB(255, 253, 250, 250)),
                onPressed: () {
                  widget.toggleView();
                },
                label: const Text("Register"),
                style: TextButton.styleFrom(
                    primary: Color.fromARGB(255, 248, 248, 248)))
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
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 136, 141, 141)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 49, 54, 104),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 136, 141, 141),
                      ),
                      //  border:const OutlineInputBorder()
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  style: TextStyle(color: Color.fromARGB(255, 240, 237, 237)),
                ),
                //Password
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 136, 141, 141)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 49, 54, 104),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 136, 141, 141),
                        ),
                        //  border:const OutlineInputBorder()
                      ),
                    ),
                    validator: (val) =>
                        val!.length < 6 ? 'Enter password 6+ chars long' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    style:
                        TextStyle(color: Color.fromARGB(255, 240, 237, 237))),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 240, 236, 237)),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Color.fromARGB(255, 20, 27, 66)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result =
                          _auth.signInWithEmailAndPassword(email, password);
                      String invalid_user =
                          "The password is invalid or the user does not have a password.";
                      if (result == invalid_user) {
                        setState(() => error = "Invalid User");
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
