import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/CoorConverter.dart';

/// Class containing details of carparks
class CarparkDetail extends StatelessWidget {
  //Define attributes
  late String id;
  late String address;
  late String carpark_basement;
  late String carpark_decks;
  late String carpark_no;
  late String carpark_type;
  late String free_parking;
  late String gantry_height;
  late String night_parking;
  late String short_term_parking;
  late String type_of_parking_system;
  late double lat;
  late double long;
  late int vacancy;

  //Converting xy cordinates to latlong
  CoorConverter coorTest = CoorConverter();

  CarparkDetail(
    String id,
    String address,
    String carpark_basement,
    String carpark_decks,
    String carpark_no,
    String carpark_type,
    String free_parking,
    String gantry_height,
    String night_parking,
    String short_term_parking,
    String type_of_parking_system,
    double x_cord,
    double y_cord,
  ) {
    this.id = id;
    this.address = address;
    this.carpark_basement = carpark_basement;
    this.carpark_decks = carpark_decks;
    this.carpark_no = carpark_no;
    this.carpark_type = carpark_type;
    this.free_parking = free_parking;
    this.gantry_height = gantry_height;
    this.night_parking = night_parking;
    this.short_term_parking = short_term_parking;
    this.type_of_parking_system = type_of_parking_system;
    this.lat = coorTest.computeLatLon(y_cord, x_cord)[0];
    this.long = coorTest.computeLatLon(y_cord, x_cord)[1];
    this.vacancy = Random().nextInt(100);
    // generate_marker_set(lat, long, address, _id, vacancy);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(""));
  }
}
