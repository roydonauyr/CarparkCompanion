import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/screens/Favourites.dart';
import 'package:flutter_application_2/screens/LotsRemberer.dart';
import 'package:flutter_application_2/screens/helps.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/authenticate/sign_in.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/localUser.dart';

Set<Marker> markers = new Set();
List<carparkDetail> carparkObjects = <carparkDetail>[];
bool fullDetail = false;

//Testing git push
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final carparkDetailManager = carparkDetail();
  // await carparkDetailManager.generate_marker_set();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Home(),
      ),
    );

    // var myBottomNavigatioBar = const MyBottomNavigatioBar();
    // return MaterialApp
    // (
    //   home: myBottomNavigatioBar,
    // );
  }
}
