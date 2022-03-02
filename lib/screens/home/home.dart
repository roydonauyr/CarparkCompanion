import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
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
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star),
                      label: 'Favourites',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.car_rental),
                      label: 'Lot Remember',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.help),
                      label: 'Help',
                      backgroundColor: Colors.blue),
                ])));
  }
}
