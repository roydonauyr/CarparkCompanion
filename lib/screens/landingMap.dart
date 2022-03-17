// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/screens/Favourites.dart';
import 'package:flutter_application_2/screens/wrapper.dart';
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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);

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
}
