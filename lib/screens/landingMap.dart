// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/localUser.dart';
import 'package:location/location.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'authenticate/login_or_register.dart';

class landingMap extends StatefulWidget {
  const landingMap({Key? key}) : super(key: key);

  @override
  _landingMap createState() => _landingMap();
}

class _landingMap extends State<landingMap> {
  final AuthService _auth = AuthService();

  //Location is to obtain live location of user
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

  @override
  Widget build(BuildContext context) {
    //User is to check if the user is logged in
    final user = Provider.of<LocalUser?>(context);

    //To make code more efficient, can create 2 classes, 1 for login, 1 for not logged in
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Map"),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginOrRegsiter()));
              },
              label: const Text('Log In'),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(1.348572682702342, 103.68310251054965),
                zoom: 12,
              ),
              /*onMapCreated: _onMapCreated,*/
              myLocationEnabled: true,
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Map"),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: const Text('Log Out'),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(1.348572682702342, 103.68310251054965),
                zoom: 12,
              ),
              /*onMapCreated: _onMapCreated,*/
              myLocationEnabled: true,
            ),
          ],
        ),
      );
    }
  }
}
