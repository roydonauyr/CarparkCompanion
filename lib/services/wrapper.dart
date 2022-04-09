import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/screens/authenticate/authenticate.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Wrapper class for Authentication or Home
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
