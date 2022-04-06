import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/FullDetails.dart';

List<String> myFavourites = <String>[];
Set<String> favourited = Set<String>();


class favouritePage extends StatefulWidget {

  //final Stream<int> stream;
  favouritePage({Key? key}) : super(key: key);
  //favouritePage(this.stream);

  @override
  _favouritePageState createState() => _favouritePageState();

}

class _favouritePageState extends State<favouritePage> {

  @override
  Widget build(BuildContext context) {
    print("enter");
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Favourite"),
        backgroundColor: Color.fromARGB(255, 20, 27, 66),
      ),
      body: ListView.builder(
        itemCount: myFavourites.length,
        itemBuilder: (BuildContext context, int index){
          String favourite = myFavourites[index];
          bool isFavourite = favourited.contains(favourite);
          return Row(
            children: <Widget>[
              ElevatedButton(child: Text(favourite), onPressed: (){
                setState((){
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => FullDetails(id,
                                          address,
                                          carpark_basement,
                                          carpark_decks,
                                          carpark_no,
                                          carpark_type,
                                          free_parking,
                                          gantry_height,
                                          night_parking,
                                          short_term_parking,
                                          type_of_parking_system,
                                          lat,
                                          long,)));
                });
              }), 
              RaisedButton(
                  onPressed: (){
                    setState((){
                      if(isFavourite){
                        favourited.remove(favourite);
                        myFavourites.remove(favourite);
                      }
                    });
                  },
                  child: new Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? Colors.red : null,
                  ),
              ),
            ]
          );
        },
      ),
    );
  }
}

// ListTile(
//                 title: Text(favourite),
//                 trailing: Icon(
//                   isFavourite ? Icons.favorite : Icons.favorite_border,
//                   color: isFavourite ? Colors.red : null,
//                 ),
//                 onTap: (){
//                   setState((){
//                     if(isFavourite){
//                       favourited.remove(favourite);
//                       myFavourites.remove(favourite);
//                     }
//                   });
//                 },
//               ),
