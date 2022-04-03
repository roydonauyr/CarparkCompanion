import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/Database/CoorConverter.dart';
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
  initCarparkObjects();
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

void initCarparkObjects() async {
  coorConverter coorTest = coorConverter();

  for (int i = 250; i < 350; i += 1) {
    String path = i.toString();

    //Id isnt working
    // DatabaseReference id =
    //     FirebaseDatabase.instance.ref(path + "/car_park_no)");

    // DatabaseEvent id_event = await id.once();
    // String _id = id_event.snapshot.value.toString();
    String _id = i.toString();

    //Address
    DatabaseReference address =
        FirebaseDatabase.instance.ref(path + "/address");

    DatabaseEvent address_event = await address.once();
    String _address = address_event.snapshot.value.toString();

    //Basement
    DatabaseReference carpark_basement =
        FirebaseDatabase.instance.ref(path + "/carpark_basement");

    DatabaseEvent carpark_basement_event = await carpark_basement.once();
    String _carpark_basement = carpark_basement_event.snapshot.value.toString();

    DatabaseReference carpark_decks =
        FirebaseDatabase.instance.ref(path + "/carpark_decks");
    DatabaseReference carpark_no =
        FirebaseDatabase.instance.ref(path + "/carpark_np");

    //Carpark Type
    DatabaseReference capark_type =
        FirebaseDatabase.instance.ref(path + "/carpark_type");

    DatabaseEvent capark_type_event = await capark_type.once();
    String _carpark_typetype = capark_type_event.snapshot.value.toString();

    DatabaseReference free_parking =
        FirebaseDatabase.instance.ref(path + "/free_parking");
    DatabaseReference gantry_height =
        FirebaseDatabase.instance.ref(path + "/gantry_height");
    DatabaseReference night_parking =
        FirebaseDatabase.instance.ref(path + "/night_parking");

    //Short term parking
    DatabaseReference short_term_parking =
        FirebaseDatabase.instance.ref(path + "/short_term_parking");

    //Type of parking
    DatabaseReference type_of_parking_system =
        FirebaseDatabase.instance.ref(path + "/type_of_parking_system");

    DatabaseEvent type_of_parking_system_event =
        await type_of_parking_system.once();
    String _type_of_parking_system =
        type_of_parking_system_event.snapshot.value.toString();

    DatabaseReference x_coord =
        FirebaseDatabase.instance.ref(path + "/x_coord");

    //getting into double
    DatabaseEvent x_cord_event = await x_coord.once();
    double x_coord_double =
        double.parse(x_cord_event.snapshot.value.toString());

    DatabaseReference y_coord =
        FirebaseDatabase.instance.ref(path + "/y_coord");

    //getting into double
    DatabaseEvent y_cord_event = await y_coord.once();
    double y_coord_double =
        double.parse(y_cord_event.snapshot.value.toString());

    carparkObjects.add(carparkDetail(
        _id,
        _address,
        // carpark_basement,
        // carpark_decks,
        // carpark_no,
        // capark_type,
        // free_parking,
        // gantry_height,
        // night_parking,
        // short_term_parking,
        // type_of_parking_system,
        x_coord_double,
        y_coord_double));
  }
}
