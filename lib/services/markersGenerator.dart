import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'package:flutter_application_2/screens/details/FullDetails.dart';
import 'package:flutter_application_2/screens/home/landingMap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_2/main.dart' as globals;
import 'package:flutter_application_2/screens/lotRemember/LotsRememberer.dart';

///MarkersGenerator helps to add Markers to global markers list to be displayed
///on google map
class MarkersGenerator extends StatefulWidget {
  MarkersGenerator({Key? key}) : super(key: key);

  ///Add red markers: this refers to markers with low carpark vacancies
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
            snippet: 'Availability: ' + vacancy.toString(),
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
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 20, 27, 66),
                              minimumSize: Size(25, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            child: Text("Lot Rememberer",
                                style: TextStyle(fontSize: 20.0)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LotsRememberer(address.toString())));
                            })
                      ],
                    );
                  });
            })));
  }

  ///Add orange markers: this refers to carparks with medium carpark vacancies
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
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(
            //popup info
            title: address,
            snippet: 'Availability: ' + vacancy.toString(),
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
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 20, 27, 66),
                              minimumSize: Size(25, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            child: Text("Lot Rememberer",
                                style: TextStyle(fontSize: 20.0)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LotsRememberer(address.toString())));
                            })
                      ],
                    );
                  });
            })));
  }

  ///Add green markers: this refers to carparks with high vacancy
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
            snippet: 'Availability: ' + vacancy.toString(),
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
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 20, 27, 66),
                              minimumSize: Size(25, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            child: Text("Lot Rememberer",
                                style: TextStyle(fontSize: 20.0)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LotsRememberer(address.toString())));
                            })
                      ],
                    );
                  });
            })));
  }

  ///Wrapper function to call 3 different generate markers *above*
  void generate_colored_markers(CarparkDetail objects, BuildContext context) {
    if (objects.vacancy >= 0 && objects.vacancy < 33) {
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

  ///Generate position marker
  void generate_point_marker() {
    globals.markers.add(Marker(
        markerId: MarkerId("point"),
        position: globals.point,
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        infoWindow: InfoWindow(title: "Your location")));
  }

  @override
  State<MarkersGenerator> createState() => _MarkersGeneratorState();
}

/// Constructing MarkersGenerator calls this child state
class _MarkersGeneratorState extends State<MarkersGenerator> {
  @override
  Widget build(BuildContext context) {
    /// the very first boot: ensure that all states are clean
    if (globals.freshStart == true) {
      globals.freshStart = false;
      globals.markersFiltered.clear();
      globals.markers.clear();
      print("Number of carparks found: " + globals.carparkObjects.length.toString());
      return LandingMap();
    }
    /// if carpark searched button is pressed, distState would be true
    /// if so, search for carparks with in radius
    else if (globals.distState == true) {
      globals.markers.clear();
      //globals.markersFiltered.clear();
      for (CarparkDetail carpark in globals.filteredCarparkObjects) {
        widget.generate_colored_markers(carpark, context);
      }
      globals.markersFiltered = globals.markers;
      globals.distState = false;
      print("filter-distance");
      return LandingMap();
    }
    /// ELSE: all states should become clean (i.e. no markers on map)
    else {
      print("normal");
      globals.markers.clear();
      globals.markersFiltered.clear();

      return LandingMap();
    }
  }
}
