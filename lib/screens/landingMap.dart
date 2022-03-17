import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class landingMap extends StatefulWidget {
  const landingMap({Key? key}) : super(key: key);

  @override
  _landingMap createState() => _landingMap();
}

class _landingMap extends State<landingMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Map"),
      ),
      body: Stack(
        children: const <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.77483, -122.41942),
              zoom: 12,
            ),
          ),
        ],
      ),
    );
  }
}
