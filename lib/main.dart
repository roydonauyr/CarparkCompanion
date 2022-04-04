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

Set<Marker> markers = new Set();
List<carparkDetail> carparkObjects = <carparkDetail>[];
bool fullDetail = false;

//Testing git push
void main() async {
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
  for (int i = 1; i < 2000; i += 200) {
    String path = i.toString();

    //Id
    DatabaseReference id =
        FirebaseDatabase.instance.ref(path + "/car_park_number");

    DatabaseEvent id_event = await id.once();
    String _id = id_event.snapshot.value.toString();

    //Address
    DatabaseReference address =
        FirebaseDatabase.instance.ref(path + "/address");

    DatabaseEvent address_event = await address.once();
    String _address = address_event.snapshot.value.toString();

    //Basement
    DatabaseReference carpark_basement =
        FirebaseDatabase.instance.ref(path + "/car_park_basement");

    DatabaseEvent carpark_basement_event = await carpark_basement.once();
    String _carpark_basement = carpark_basement_event.snapshot.value.toString();

    //Carpark Decks
    DatabaseReference carpark_decks =
        FirebaseDatabase.instance.ref(path + "/car_park_decks");

    DatabaseEvent carpark_decks_event = await carpark_decks.once();
    String _carpark_decks = carpark_decks_event.snapshot.value.toString();

    //Carpark Number
    DatabaseReference carpark_no =
        FirebaseDatabase.instance.ref(path + "/car_park_no");

    DatabaseEvent carpark_no_event = await carpark_no.once();
    String _carpark_no = carpark_no_event.snapshot.value.toString();

    //Carpark Type
    DatabaseReference carpark_type =
        FirebaseDatabase.instance.ref(path + "/car_park_type");

    DatabaseEvent capark_type_event = await carpark_type.once();
    String _carpark_type = capark_type_event.snapshot.value.toString();

    //Free Parking
    DatabaseReference free_parking =
        FirebaseDatabase.instance.ref(path + "/free_parking");

    DatabaseEvent free_parking_event = await free_parking.once();
    String _free_parking = free_parking_event.snapshot.value.toString();

    //Gantry Height
    DatabaseReference gantry_height =
        FirebaseDatabase.instance.ref(path + "/gantry_height");

    DatabaseEvent gantry_height_event = await gantry_height.once();
    String _gantry_height = gantry_height_event.snapshot.value.toString();

    //Night Parking
    DatabaseReference night_parking =
        FirebaseDatabase.instance.ref(path + "/night_parking");

    DatabaseEvent night_parking_event = await night_parking.once();
    String _night_parking = night_parking_event.snapshot.value.toString();

    //Short term parking
    DatabaseReference short_term_parking =
        FirebaseDatabase.instance.ref(path + "/short_term_parking");

    DatabaseEvent short_term_parking_event = await short_term_parking.once();
    String _short_term_parking =
        short_term_parking_event.snapshot.value.toString();

    //Type of parking
    DatabaseReference type_of_parking_system =
        FirebaseDatabase.instance.ref(path + "/type_of_parking_system");

    DatabaseEvent type_of_parking_system_event =
        await type_of_parking_system.once();
    String _type_of_parking_system =
        type_of_parking_system_event.snapshot.value.toString();

    //x coord
    DatabaseReference x_coord =
        FirebaseDatabase.instance.ref(path + "/x_coord");

    //getting into double
    DatabaseEvent x_cord_event = await x_coord.once();
    double x_coord_double =
        double.parse(x_cord_event.snapshot.value.toString());

    //y coord
    DatabaseReference y_coord =
        FirebaseDatabase.instance.ref(path + "/y_coord");

    //getting into double
    DatabaseEvent y_cord_event = await y_coord.once();
    double y_coord_double =
        double.parse(y_cord_event.snapshot.value.toString());

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
