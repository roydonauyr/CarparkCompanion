import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/screens/Favourites.dart';
import 'package:flutter_application_2/screens/LotsRemberer.dart';
import 'package:flutter_application_2/screens/helps.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/authenticate/sign_in.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/localUser.dart';


//Testing git push
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    // return StreamProvider<LocalUser?>.value(
    //   catchError: (_, __) => null,
    //   initialData: null,
    //   value: AuthService().user,
    //   child: MaterialApp(
    //     home: Wrapper(),
        

    //   ),
    // );
    var myBottomNavigatioBar = const MyBottomNavigatioBar();
    return MaterialApp
    (
      home: myBottomNavigatioBar,
    );
  }
}







class MyBottomNavigatioBar extends StatefulWidget 
{
  const MyBottomNavigatioBar({Key? key}) : super(key: key);


  @override
  _MyBottomNavigatioBarState createState() => _MyBottomNavigatioBarState();
}

class _MyBottomNavigatioBarState extends State<MyBottomNavigatioBar> 
{
  int _currentIndex = 0;
  final List<Widget> children = [
    Home(),
    favouritePage(),
    LotsRemberer(),
    helpPage(),
    
  ]; 

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
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
                      label: 'Favourites',backgroundColor: Color.fromARGB(255, 6, 35, 58)
                      ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.car_rental),
                      label: 'Lot Remember',
                      ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.help),
                      label: 'Help',
                      ),
                ]
      )
    );
  }
}