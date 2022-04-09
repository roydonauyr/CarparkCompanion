import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/authenticate/register.dart';
import 'package:flutter_application_2/screens/authenticate/sign_in.dart';

///Authenticate class to check if user is logged into the application
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  ///if true, show sign in, else register
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
