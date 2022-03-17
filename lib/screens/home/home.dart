import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:flutter/foundation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Favourites.dart';
import '../LotsRemberer.dart';
import '../helps.dart';
import '../landingMap.dart';
// import 'package:google_maps_flutter_example/lite_mode.dart';

// import 'animate_camera.dart';
// import 'map_click.dart';
// import 'map_coordinates.dart';
// import 'map_ui.dart';
// import 'marker_icons.dart';
// import 'move_camera.dart';
// import 'padding.dart';
// import 'page.dart';
// import 'place_circle.dart';
// import 'place_marker.dart';
// import 'place_polygon.dart';
// import 'place_polyline.dart';
// import 'scrolling_map.dart';
// import 'snapshot.dart';
// import 'tile_overlay.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

//   final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
//   const MapUiPage(),
//   const MapCoordinatesPage(),
//   const MapClickPage(),
//   const AnimateCameraPage(),
//   const MoveCameraPage(),
//   const PlaceMarkerPage(),
//   const MarkerIconsPage(),
//   const ScrollingMapPage(),
//   const PlacePolylinePage(),
//   const PlacePolygonPage(),
//   const PlaceCirclePage(),
//   const PaddingPage(),
//   const SnapshotPage(),
//   const LiteModePage(),
//   const TileOverlayPage(),
// ];
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<Widget> children = [
      helpPage(),
      favouritePage(),
      LotsRemberer(),
      helpPage(),
    ];

    void onTappedBar(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Carpark Home'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Log Out'),
          )
        ],
      ),
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Color.fromARGB(255, 3, 19, 32),
          unselectedItemColor: Colors.white,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favourites',
                backgroundColor: Color.fromARGB(255, 6, 35, 58)),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'Lot Remember',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Help',
            ),
          ]),
    );
  }
}
