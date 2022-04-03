import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/CoorConverter.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screens/landingMap.dart' as globals;
import 'package:flutter_application_2/screens/HalfDetails.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class carparkDetail extends StatelessWidget {
  //Define attributes
  late String id;
  late String address;
  // late DatabaseReference carpark_basement;
  // late DatabaseReference carpark_decks;
  // late DatabaseReference carpark_no;
  // late DatabaseReference capark_type;
  // late DatabaseReference free_parking;
  // late DatabaseReference gantry_height;
  // late DatabaseReference night_parking;
  // late DatabaseReference short_term_parking;
  // late DatabaseReference type_of_parking_system;
  late double x_cord;
  late double y_cord;
  late double lat;
  late double long;
  late int vacancy;

  //Converting xy cordinates to latlong
  coorConverter coorTest = coorConverter();

  carparkDetail(
    String id,
    String address,
    // DatabaseReference carpark_basement,
    // DatabaseReference carpark_decks,
    // DatabaseReference carpark_no,
    // DatabaseReference capark_type,
    // DatabaseReference free_parking,
    // DatabaseReference gantry_height,
    // DatabaseReference night_parking,
    // DatabaseReference short_term_parking,
    // DatabaseReference type_of_parking_system,
    double x_cord,
    double y_cord,
  ) {
    this.id = id;
    this.address = address;
    // this.carpark_basement = carpark_basement;
    // this.carpark_decks = carpark_decks;
    // this.carpark_no = carpark_no;
    // this.capark_type = capark_type;
    // this.free_parking = free_parking;
    // this.gantry_height = gantry_height;
    // this.night_parking = night_parking;
    // this.type_of_parking_system = type_of_parking_system;
    this.lat = coorTest.computeLatLon(y_cord, x_cord)[0];
    this.long = coorTest.computeLatLon(y_cord, x_cord)[1];
    this.vacancy = 10;
    // generate_marker_set(lat, long, address, _id, vacancy);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("DF"));
  }
}
