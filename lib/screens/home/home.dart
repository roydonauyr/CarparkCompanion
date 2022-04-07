import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/markersGenerator.dart';
import '../../services/Favourites.dart';
import 'lotsRemberer.dart';
import 'forum.dart';

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
    MarkersGenerator(),
    FavouritePage(),
    LotsRemberer(),
    Forum(),
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
