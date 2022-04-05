import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/screens/FullDetails.dart';
import 'package:flutter_application_2/screens/landingMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_2/main.dart' as globals;

class markersGenerator extends StatefulWidget {
  const markersGenerator({Key? key}) : super(key: key);
  void generate_low_marker_set(
      lat,
      long,
      address,
      id,
      vacancy,
      carpark_basement,
      carpark_decks,
      carpark_no,
      carpark_type,
      free_parking,
      gantry_height,
      night_parking,
      short_term_parking,
      type_of_parking_system,
      context) {
    print("adding " + lat.toString() + " " + long.toString());
    //list of markers
    globals.markers.add(Marker(
        markerId: MarkerId(id.toString()),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
            //popup info
            title: address,
            snippet: 'ID: ' + id.toString(),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView(
                      children: <Widget>[
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.location_pin),
                          contentPadding: EdgeInsets.all(7.0),
                          title:
                              Text(address, style: TextStyle(fontSize: 18.0)),
                        )),
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.credit_card),
                          contentPadding: EdgeInsets.all(7.0),
                          title: Text("ID : " + id.toString(),
                              style: TextStyle(fontSize: 18.0)),
                        )),
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.car_rental),
                          contentPadding: EdgeInsets.all(7.0),
                          title: Text("Availability: " + vacancy.toString(),
                              style: TextStyle(fontSize: 18.0)),
                        )),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 20, 27, 66),
                            minimumSize: Size(25, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                          child: Text("View full details",
                              style: TextStyle(fontSize: 20.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullDetails(
                                          id,
                                          address,
                                          carpark_basement,
                                          carpark_decks,
                                          carpark_no,
                                          carpark_type,
                                          free_parking,
                                          gantry_height,
                                          night_parking,
                                          short_term_parking,
                                          type_of_parking_system,
                                          lat,
                                          long,
                                        )));
                          },
                        )
                      ],
                    );
                  });
            })));
  }

  void generate_mid_marker_set(
      lat,
      long,
      address,
      id,
      vacancy,
      carpark_basement,
      carpark_decks,
      carpark_no,
      carpark_type,
      free_parking,
      gantry_height,
      night_parking,
      short_term_parking,
      type_of_parking_system,
      context) {
    print("adding " + lat.toString() + " " + long.toString());
    //list of markers
    globals.markers.add(Marker(
        markerId: MarkerId(id.toString()),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow: InfoWindow(
            //popup info
            title: address,
            snippet: 'ID: ' + id.toString(),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView(
                      children: <Widget>[
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.location_pin),
                          contentPadding: EdgeInsets.all(7.0),
                          title:
                              Text(address, style: TextStyle(fontSize: 18.0)),
                        )),
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.credit_card),
                          contentPadding: EdgeInsets.all(7.0),
                          title: Text("ID : " + id.toString(),
                              style: TextStyle(fontSize: 18.0)),
                        )),
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.car_rental),
                          contentPadding: EdgeInsets.all(7.0),
                          title: Text("Availability: " + vacancy.toString(),
                              style: TextStyle(fontSize: 18.0)),
                        )),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 20, 27, 66),
                            minimumSize: Size(25, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                          child: Text("View full details",
                              style: TextStyle(fontSize: 20.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullDetails(
                                          id,
                                          address,
                                          carpark_basement,
                                          carpark_decks,
                                          carpark_no,
                                          carpark_type,
                                          free_parking,
                                          gantry_height,
                                          night_parking,
                                          short_term_parking,
                                          type_of_parking_system,
                                          lat,
                                          long,
                                        )));
                          },
                        )
                      ],
                    );
                  });
            })));
  }

  void generate_high_marker_set(
      lat,
      long,
      address,
      id,
      vacancy,
      carpark_basement,
      carpark_decks,
      carpark_no,
      carpark_type,
      free_parking,
      gantry_height,
      night_parking,
      short_term_parking,
      type_of_parking_system,
      context) {
    print("adding " + lat.toString() + " " + long.toString());
    //list of markers
    globals.markers.add(Marker(
        markerId: MarkerId(id.toString()),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(
            //popup info
            title: address,
            snippet: 'ID: ' + id.toString(),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView(
                      children: <Widget>[
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.location_pin),
                          contentPadding: EdgeInsets.all(7.0),
                          title:
                              Text(address, style: TextStyle(fontSize: 18.0)),
                        )),
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.credit_card),
                          contentPadding: EdgeInsets.all(7.0),
                          title: Text("ID : " + id.toString(),
                              style: TextStyle(fontSize: 18.0)),
                        )),
                        Card(
                            child: ListTile(
                          leading: const Icon(Icons.car_rental),
                          contentPadding: EdgeInsets.all(7.0),
                          title: Text("Availability: " + vacancy.toString(),
                              style: TextStyle(fontSize: 18.0)),
                        )),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 20, 27, 66),
                            minimumSize: Size(25, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                          child: Text("View full details",
                              style: TextStyle(fontSize: 20.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullDetails(
                                          id,
                                          address,
                                          carpark_basement,
                                          carpark_decks,
                                          carpark_no,
                                          carpark_type,
                                          free_parking,
                                          gantry_height,
                                          night_parking,
                                          short_term_parking,
                                          type_of_parking_system,
                                          lat,
                                          long,
                                        )));
                          },
                        )
                      ],
                    );
                  });
            })));
  }

  void generate_colored_markers(carparkDetail objects, BuildContext context) {
    if (objects.vacancy >= 1 && objects.vacancy < 33) {
      generate_low_marker_set(
          objects.lat,
          objects.long,
          objects.address,
          objects.id,
          objects.vacancy,
          objects.carpark_basement,
          objects.carpark_decks,
          objects.carpark_no,
          objects.carpark_type,
          objects.free_parking,
          objects.gantry_height,
          objects.night_parking,
          objects.short_term_parking,
          objects.type_of_parking_system,
          context);
    } else if (objects.vacancy >= 33 && objects.vacancy < 66) {
      generate_mid_marker_set(
          objects.lat,
          objects.long,
          objects.address,
          objects.id,
          objects.vacancy,
          objects.carpark_basement,
          objects.carpark_decks,
          objects.carpark_no,
          objects.carpark_type,
          objects.free_parking,
          objects.gantry_height,
          objects.night_parking,
          objects.short_term_parking,
          objects.type_of_parking_system,
          context);
    } else {
      generate_high_marker_set(
          objects.lat,
          objects.long,
          objects.address,
          objects.id,
          objects.vacancy,
          objects.carpark_basement,
          objects.carpark_decks,
          objects.carpark_no,
          objects.carpark_type,
          objects.free_parking,
          objects.gantry_height,
          objects.night_parking,
          objects.short_term_parking,
          objects.type_of_parking_system,
          context);
    }
  }

  @override
  State<markersGenerator> createState() => _markersGeneratorState();
}

class _markersGeneratorState extends State<markersGenerator> {
  @override
  Widget build(BuildContext context) {
    if (globals.filterState == false) {
      int x = 0;
      for (carparkDetail objects in globals.carparkObjects) {
        widget.generate_colored_markers(objects, context);
        x++;
      }

      globals.markersFiltered = globals.markers;
      print("Markers created: " + x.toString());
      return landingMap();
    } else {
      return landingMap();
    }
  }
}