import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/CoorConverter.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'models/localUser.dart';

// import 'package:flutter_application_2/models/timer.dart';
// import 'package:flutter_application_2/services/apiLTA.dart';
// import 'dart:async';

// import 'package:flutter_application_2/screens/filter.dart';

Set<Marker> markers = new Set();
bool filterState = false;
Set<Marker> markersFiltered = new Set();
List<carparkDetail> carparkObjects = <carparkDetail>[];
bool fullDetail = false;

void setMarkers(Set<Marker> marked){
  markers = marked;
}

//Testing git push
void main() async {
  // APItimer;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initCarparkObjects();
  // initCarparkObjects();

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

Future<void> initCarparkObjects() async {
  coorConverter coorTest = coorConverter();

  int x = 0;
  for (int i = 0; i < 20; i ++) {
    String path = i.toString();

    DatabaseReference object = FirebaseDatabase.instance.ref(path + "/details");

    DatabaseEvent object_event = await object.once();
    String object_string = object_event.snapshot.value.toString();
    final splitted = object_string.split("_");

    String _id = splitted[0];
    String _carpark_no = splitted[1];
    String _address = splitted[2];
    String _x_coord = splitted[3];
    String _y_coord = splitted[4];
    String _carpark_type = splitted[5];
    String _type_of_parking_system = splitted[6];
    String _short_term_parking = splitted[7];
    String _free_parking = splitted[8];
    String _night_parking = splitted[9];
    String _carpark_decks = splitted[10];
    String _gantry_height = (splitted[11]);
    String _carpark_basement = (splitted[12]);
    double x_coord_double = double.parse(_x_coord);
    double y_coord_double = double.parse(_y_coord);
    //print(splitted);
    
    carparkObjects.add(carparkDetail(
        _id,
        _address,
        _carpark_basement,
        _carpark_decks,
        _carpark_no,
        _carpark_type,
        _free_parking,
        _gantry_height,
        _night_parking,
        _short_term_parking,
        _type_of_parking_system,
        x_coord_double,
        y_coord_double));
  }
}