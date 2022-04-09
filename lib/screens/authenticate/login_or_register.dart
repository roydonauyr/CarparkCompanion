import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/services/wrapper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/services/auth.dart';
import 'package:provider/provider.dart';

//LoginOrRegsiter class acts as a wrapper to call Register or SignIn class
class LoginOrRegsiter extends StatelessWidget {
  const LoginOrRegsiter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
