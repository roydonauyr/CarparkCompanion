import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/services/markersGenerator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../services/Favourites.dart';
import 'LotsRemberer.dart';
import 'helps.dart';
import 'landingMap.dart';
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
  @override
  Widget build(BuildContext context) {
    var myBottomNavigatioBar = const MyBottomNavigatioBar();
    return MaterialApp(
      home: myBottomNavigatioBar,
    );
  }
}

class MyBottomNavigatioBar extends StatefulWidget {
  const MyBottomNavigatioBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigatioBarState createState() => _MyBottomNavigatioBarState();
}

class _MyBottomNavigatioBarState extends State<MyBottomNavigatioBar> {
  int _currentIndex = 0;
  final List<Widget> children = [
    markersGenerator(),
    favouritePage(),
    LotsRemberer(),
    helpPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: children,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
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
                icon: Icon(Icons.forum),
                label: 'Forum',
              ),
            ]));
  }
}
