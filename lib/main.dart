import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 6, 30, 49),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Lot Remember',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ]));
  }
}
