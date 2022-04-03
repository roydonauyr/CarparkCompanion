// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/CoorConverter.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/main.dart' as globals;
import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/screens/FullDetails.dart';
import 'package:flutter_application_2/screens/HalfDetails.dart';
import 'package:location/location.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:flutter_application_2/main.dart';
import 'authenticate/login_or_register.dart';

//for firebase
import "package:firebase_database/firebase_database.dart";
import 'package:firebase_core/firebase_core.dart';

class landingMap extends StatefulWidget {
  const landingMap({Key? key}) : super(key: key);

  @override
  _landingMap createState() => _landingMap();
}

class _landingMap extends State<landingMap> {
  final AuthService _auth = AuthService();

  Set<Marker> markers2 = new Set();
  List<carparkDetail> carparkObjects2 = <carparkDetail>[];

  //Location is to obtain live location of user
  Location _location = new Location();
  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController _cntlr) {
    var _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    void generate_marker_set(lat, long, address, id, vacancy) {
      print("adding " + lat.toString() + " " + long.toString());
      //list of markers
      globals.markers.add(Marker(
          markerId: MarkerId(id.toString()),
          position: LatLng(lat, long),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
              //popup info
              title: address,
              snippet: 'Availability: ' + vacancy.toString(),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber[50],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(address),
                              Text(vacancy.toString()),
                              ElevatedButton(
                                child: Text(address),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FullDetails(address)));
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
              })));
    }

    void initMarkers() async {
      coorConverter coorTest = coorConverter();

      for (int i = 50; i < 90; i += 10) {
        String path = i.toString();
        DatabaseReference _id =
            FirebaseDatabase.instance.ref(path + "/car_park_number)");

        //Address
        DatabaseReference address =
            FirebaseDatabase.instance.ref(path + "/address");

        DatabaseEvent address_event = await address.once();
        String _address = address_event.snapshot.value.toString();

        //Basement
        DatabaseReference carpark_basement =
            FirebaseDatabase.instance.ref(path + "/carpark_basement");

        DatabaseEvent carpark_basement_event = await carpark_basement.once();
        String _carpark_basement =
            carpark_basement_event.snapshot.value.toString();

        DatabaseReference carpark_decks =
            FirebaseDatabase.instance.ref(path + "/carpark_decks");
        DatabaseReference carpark_no =
            FirebaseDatabase.instance.ref(path + "/carpark_np");
        DatabaseReference capark_type =
            FirebaseDatabase.instance.ref(path + "/carpark_type");
        DatabaseReference free_parking =
            FirebaseDatabase.instance.ref(path + "/free_parking");
        DatabaseReference gantry_height =
            FirebaseDatabase.instance.ref(path + "/gantry_height");
        DatabaseReference night_parking =
            FirebaseDatabase.instance.ref(path + "/night_parking");
        DatabaseReference short_term_parking =
            FirebaseDatabase.instance.ref(path + "/short_term_parking");
        DatabaseReference type_of_parking_system =
            FirebaseDatabase.instance.ref(path + "/type_of_parking_system");
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

        // carparkObjects2.add(carparkDetail(
        //     _id,
        //     _address,
        //     // carpark_basement,
        //     // carpark_decks,
        //     // carpark_no,
        //     // capark_type,
        //     // free_parking,
        //     // gantry_height,
        //     // night_parking,
        //     // short_term_parking,
        //     // type_of_parking_system,
        //     x_coord_double,
        //     y_coord_double));
        var lat = coorTest.computeLatLon(y_coord_double, x_coord_double)[0];
        var long = coorTest.computeLatLon(y_coord_double, x_coord_double)[1];
        var vacancy = 10;
        generate_marker_set(lat, long, _address, _id, vacancy);
        print("Generated marker " +
            i.toString() +
            "with lat of: " +
            lat.toString());
        print(_address);
      }
    }

    initMarkers();
    Geolocation? geolocation;
    //User is to check if the user is logged in
    final user = Provider.of<LocalUser?>(context);

    //Firebase initialisation
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref("results/records");

    //To make code more efficient, can create 2 classes, 1 for login, 1 for not logged in

    if (user == null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Map"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
            elevation: 0.0,
            actions: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.person),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginOrRegsiter()));
                },
                label: const Text('Log In'),
              )
            ],
          ),
          body: Container(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              SearchMapPlaceWidget(
                  bgColor: Color.fromARGB(255, 246, 245, 244),
                  hasClearButton: true,
                  placeType: PlaceType.address,
                  placeholder: 'Enter the location',
                  textColor: Color.fromARGB(255, 14, 13, 13),
                  apiKey: 'AIzaSyAUvR8wEIPEudD_xfJ6BpGx02vKoohOn5M',
                  onSelected: (Place place) async {
                    geolocation = await place.geolocation;
                    mapController.animateCamera(
                        CameraUpdate.newLatLng(geolocation?.coordinates));
                    mapController.animateCamera(
                        CameraUpdate.newLatLngBounds(geolocation?.bounds, 0));
                  }),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  height: 490.0,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController googleMapController) {
                      setState(() {
                        mapController = googleMapController;
                      });
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(1.348572682702342, 103.68310251054965),
                      zoom: 15.0,
                    ),
                    /*onMapCreated: _onMapCreated,*/
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    markers: globals.markers,
                  ),
                ),
              ),
            ],
          ))));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Map"),
          backgroundColor: Color.fromARGB(255, 20, 27, 66),
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 20, 27, 66),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              label: const Text('Log Out'),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(1.348572682702342, 103.68310251054965),
                zoom: 12,
              ),
              /*onMapCreated: _onMapCreated,*/
              myLocationEnabled: true,
            ),
          ],
        ),
      );
    }
  }
}
