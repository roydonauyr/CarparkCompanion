import 'package:flutter/material.dart';

class FullDetails extends StatefulWidget {
  // const FullDetails({ Key? key }) : super(key: key);
  late String _id;
  late String _address;
  late String _carpark_basement;
  late String _carpark_decks;
  late String _carpark_no;
  late String _carpark_type;
  late String _free_parking;
  late String _gantry_height;
  late String _night_parking;
  late String _short_term_parking;
  late String _type_of_parking_system;
  late double x_coord;
  late double y_coord;

  FullDetails(
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
    this._id = id;
    this._address = address;
    this._carpark_basement = carpark_basement;
    this._carpark_decks = carpark_decks;
    this._carpark_no = carpark_no;
    this._carpark_type = carpark_type;
    this._free_parking = free_parking;
    this._gantry_height = gantry_height;
    this._night_parking = night_parking;
    this._short_term_parking = short_term_parking;
    this._type_of_parking_system = type_of_parking_system;
    this.x_coord = x_cord;
    this.y_coord = y_cord;
  }

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    if (favourite == false) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Full Details"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
            actions: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                  });
                },
                label: const Text(''),
              )
            ],
          ),
          body: ListView(
            children: [
              Card(
                  elevation: 5.0,
                  color: Color.fromARGB(255, 177, 195, 216),
                  child: ListTile(
                    leading: Icon(Icons.location_pin, size: 28.0),
                    title: Text(
                      widget._address,
                      textAlign: TextAlign.justify,
                    ),
                  )),
              Card(
                  elevation: 5.0,
                  child: ListTile(
                      leading: Icon(Icons.car_rental, size: 30.0),
                      title: Text('\nCarpark Information\n\n'),
                      subtitle: Text(
                          'Carpark Type: ' +
                              widget._carpark_type +
                              '\n\n' +
                              'Carpark Basement: ' +
                              widget._carpark_basement +
                              '\n\n' +
                              'Gantry Height: ' +
                              widget._gantry_height +
                              '\n',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15.0)))),
              Card(
                  elevation: 5.0,
                  child: ListTile(
                      leading: Icon(Icons.local_parking, size: 28.0),
                      title: Text('\nParking Information\n\n'),
                      subtitle: Text(
                          'Free Parking: ' +
                              widget._free_parking +
                              '\n\n' +
                              'Short Term Parking: ' +
                              widget._short_term_parking +
                              '\n\n' +
                              'Night Parking: ' +
                              widget._night_parking +
                              '\n\n' +
                              'Parking System: ' +
                              widget._type_of_parking_system +
                              '\n',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15.0))))
            ],
            shrinkWrap: true,
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Full Details"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
            actions: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                  });
                },
                label: const Text(''),
              )
            ],
          ),
          body: Center(
            child: Text(widget._id + widget._carpark_decks),
          ));
    }
  }
}
