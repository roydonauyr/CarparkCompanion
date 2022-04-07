import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/details/FullDetails.dart';
import 'package:provider/provider.dart';

import '../models/localUser.dart';
import '../screens/authenticate/login_or_register.dart';
import '../screens/home/home.dart';

List<FullDetails> myFavourites = <FullDetails>[];
List<String> favourited = <String>[];

class FavouritePage extends StatefulWidget {
  FavouritePage({Key? key}) : super(key: key);
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    if (user == null) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text("Favourites"),
          backgroundColor: Color.fromARGB(255, 20, 27, 66),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 20, 27, 66)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginOrRegsiter()));
                },
                child: Text('Login'),
              ),
            )
          ],
        )),
      );
    } else {
      return Scaffold(
          appBar: new AppBar(
            title: new Text("Favourite"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
          ),
          body: ListView.builder(
            itemCount: myFavourites.length,
            itemBuilder: (BuildContext context, int index) {
              FullDetails favourite = myFavourites[index];
              bool isFavourite = favourited.contains(favourite.address);
              return ListView(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullDetails(
                                    favourite.id,
                                    favourite.address,
                                    favourite.carpark_basement,
                                    favourite.carpark_decks,
                                    favourite.carpark_no,
                                    favourite.carpark_type,
                                    favourite.free_parking,
                                    favourite.gantry_height,
                                    favourite.night_parking,
                                    favourite.short_term_parking,
                                    favourite.type_of_parking_system,
                                    favourite.x_coord,
                                    favourite.y_coord)));
                      });
                    },
                    child: Card(
                        elevation: 10.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          leading: Icon(Icons.location_pin,
                              size: 28.0,
                              color: Color.fromARGB(255, 14, 82, 138)),
                          title: Row(children: [
                            Text(
                              favourite.address,
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.1,
                              style: TextStyle(fontSize: 13),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(62, 2, 2, 2),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white, elevation: 0),
                                onPressed: () {
                                  setState(() {
                                    if (isFavourite) {
                                      favourited.remove(favourite.address);
                                      myFavourites.remove(favourite);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    }
                                  });
                                },
                                child: Icon(
                                  isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavourite ? Colors.red : null,
                                ),
                              ),
                            ),
                          ]),
                        )),
                  ),
                ],
                shrinkWrap: true,
              );
            },
          ));
    }
  }
}
