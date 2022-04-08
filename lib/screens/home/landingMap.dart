import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart' as globals;
import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/screens/filters/filter.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

import 'package:flutter_application_2/main.dart';
import '../authenticate/login_or_register.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

double _value = 1000;

class LandingMap extends StatefulWidget {
  const LandingMap({Key? key}) : super(key: key);
  static late Map<String, Map<String, bool>> switchesMap = {
    'car_park_type': {
      'SURFACE CAR PARK': false,
      'MULTI-STOREY CAR PARK': false
    },
    'type_of_parking_system': {
      'ELECTRONIC PARKING': false,
      'COUPON PARKING': false
    },
    'night_parking': {'YES': false, 'NO': false},
    'free_parking': {'YES': false, 'NO': false},
    'short_term_parking': {'YES': false, 'NO': false}
  };

  static void setSwitchesNull() {
    switchesMap = {
      'car_park_type': {
        'SURFACE CAR PARK': false,
        'MULTI-STOREY CAR PARK': false
      },
      'type_of_parking_system': {
        'ELECTRONIC PARKING': false,
        'COUPON PARKING': false
      },
      'night_parking': {'YES': false, 'NO': false},
      'free_parking': {'YES': false, 'NO': false},
      'short_term_parking': {'YES': false, 'NO': false}
    };
  }

  @override
  _LandingMap createState() => _LandingMap();

  static GetSwitchesMap() {
    return switchesMap;
  }

  // final Position initialPosition;
  // landingMap(this.initialPosition);
}

class _LandingMap extends State<LandingMap> {
  static Map<String, Map<String, bool>> switches = {
    'car_park_type': {
      'SURFACE CAR PARK': false,
      'MULTI-STOREY CAR PARK': false
    },
    'type_of_parking_system': {
      'ELECTRONIC PARKING': false,
      'COUPON PARKING': false
    },
    'night_parking': {'YES': false, 'NO': false},
    'free_parking': {'YES': false, 'NO': false},
    'short_term_parking': {'YES': false, 'NO': false}
  };

  static void setSwitchesMap(Map<String, Map<String, bool>> s) {
    switches = s;
  }

  int id = 0;
  late Position _currentPosition;
  final AuthService _auth = AuthService();

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
    Geolocation? geolocation;
    setSwitchesMap(Filter.GetSwitchesFilter());

    final user = Provider.of<LocalUser?>(context);

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
                          builder: (context) => LoginOrRegsiter()));
                },
                label: const Text('Log In'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add_box_rounded),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  print(point.latitude.toString());
                  print(point.longitude.toString());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filter()));
                },
                label: const Text('Filters'),
              )
            ],
          ),
          body: Container(
              child: SingleChildScrollView(
                  child: Stack(
            children: <Widget>[
              Column(
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
                        point = geolocation?.coordinates;
                        CameraPosition newCameraPosition = CameraPosition(
                            target: geolocation?.coordinates, zoom: 15.0);
                        mapController.animateCamera(
                            CameraUpdate.newCameraPosition(newCameraPosition));
                        globals.circles.clear();
                        globals.circles.add(Circle(
                            circleId: CircleId("1"),
                            center: geolocation?.coordinates,
                            strokeWidth: 2,
                            strokeColor: Color.fromARGB(255, 171, 209, 239)
                                .withOpacity(0.5),
                            fillColor: Color.fromARGB(255, 171, 209, 239)
                                .withOpacity(0.5),
                            radius: 1000));
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        });
                      },
                      location: LatLng(1.348572682702342, 103.68310251054965),
                      radius: 2000),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      height: 490.0,
                      child: GoogleMap(
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          new Factory<OneSequenceGestureRecognizer>(
                            () => new EagerGestureRecognizer(),
                          ),
                        ].toSet(),
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          setState(() {
                            mapController = googleMapController;
                          });
                        },
                        initialCameraPosition: CameraPosition(
                          target: point,
                          zoom: 15.0,
                        ),
                        /*onMapCreated: _onMapCreated,*/
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        markers: globals.markersFiltered,
                        circles: globals.circles,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: SfSlider.vertical(
                    min: 0.0,
                    max: 1000.0,
                    value: _value,
                    interval: 20,
                    showTicks: false,
                    showLabels: false,
                    enableTooltip: true,
                    minorTicksPerInterval: 100,
                    onChanged: (dynamic value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  height: 550,
                  width: 40,
                  child: RawMaterialButton(
                    onPressed: () {
                      globals.circles.clear();
                      globals.circles.add(Circle(
                          circleId: CircleId("1"),
                          center: LatLng(1.348572682702342, 103.68310251054965),
                          strokeWidth: 2,
                          strokeColor: Color.fromARGB(255, 171, 209, 239)
                              .withOpacity(0.5),
                          fillColor: Color.fromARGB(255, 171, 209, 239)
                              .withOpacity(0.5),
                          radius: 1000));
                      point = LatLng(1.348572682702342, 103.68310251054965);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    fillColor: Color.fromARGB(255, 20, 27, 66),
                    elevation: 2.0,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.gps_fixed_sharp,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(0),
                  )),
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
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add_box_rounded),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filter()));
                },
                label: const Text('Filters'),
              )
            ],
          ),
          body: Container(
              child: SingleChildScrollView(
                  child: Stack(
            children: <Widget>[
              Column(
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
                        // mapController.animateCamera(
                        //     CameraUpdate.newLatLng(geolocation?.coordinates));
                        // mapController.animateCamera(
                        // //     CameraUpdate.newLatLngBounds(geolocation?.bounds, 0));
                        // print("Chosen location: " + geolocation.toString());
                        point = geolocation?.coordinates;
                        CameraPosition newCameraPosition = CameraPosition(
                            target: geolocation?.coordinates, zoom: 15.0);
                        mapController.animateCamera(
                            CameraUpdate.newCameraPosition(newCameraPosition));
                        globals.circles.clear();
                        globals.circles.add(Circle(
                            circleId: CircleId("1"),
                            center: geolocation?.coordinates,
                            strokeWidth: 2,
                            strokeColor: Color.fromARGB(255, 171, 209, 239)
                                .withOpacity(0.5),
                            fillColor: Color.fromARGB(255, 171, 209, 239)
                                .withOpacity(0.5),
                            radius: 1000));
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        });
                      },
                      location: LatLng(1.348572682702342, 103.68310251054965),
                      radius: 2000),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      height: 490.0,
                      child: GoogleMap(
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          new Factory<OneSequenceGestureRecognizer>(
                            () => new EagerGestureRecognizer(),
                          ),
                        ].toSet(),
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          setState(() {
                            mapController = googleMapController;
                          });
                        },
                        initialCameraPosition: CameraPosition(
                          target: point,
                          zoom: 15.0,
                        ),
                        /*onMapCreated: _onMapCreated,*/
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        markers: globals.markersFiltered,
                        circles: globals.circles,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  height: 550,
                  width: 40,
                  child: RawMaterialButton(
                    onPressed: () {
                      globals.circles.clear();
                      globals.circles.add(Circle(
                          circleId: CircleId("1"),
                          center: LatLng(1.348572682702342, 103.68310251054965),
                          strokeWidth: 2,
                          strokeColor: Color.fromARGB(255, 171, 209, 239)
                              .withOpacity(0.5),
                          fillColor: Color.fromARGB(255, 171, 209, 239)
                              .withOpacity(0.5),
                          radius: 1000));
                      point = LatLng(1.348572682702342, 103.68310251054965);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    fillColor: Color.fromARGB(255, 20, 27, 66),
                    elevation: 2.0,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.gps_fixed_sharp,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(0),
                  ))
            ],
          ))));
    }
  }
}
