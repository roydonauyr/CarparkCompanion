import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:flutter/foundation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
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
            body: Stack(
              children: const <Widget> [
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