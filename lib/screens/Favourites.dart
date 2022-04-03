import 'dart:async';
//import 'package:flutter_application_2/Database/Favorites.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/Account.dart';



// class favouritePage extends StatefulWidget {
//   const favouritePage({ Key? key }) : super(key: key);

//   @override
//   _favouritePageState createState() => _favouritePageState();
// }

// class _favouritePageState extends State<favouritePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("Favourite"),
//         backgroundColor: Color.fromARGB(255, 20, 27, 66),
//       ),
//       body: new Center(
//         child: new Text("This is fav page"),
//       ),
      
//     );
//   }
// }

class favouritePage extends StatefulWidget {
  const favouritePage({ Key? key }) : super(key: key);

  @override
  _WriteFav createState() => _WriteFav();
}

class _WriteFav extends State<favouritePage>{
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context){
    int user = Account.getUserID();
    final userID = database.child('userID' + user.toString() + '/');

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [ 
              ElevatedButton(onPressed: () async {
                try {
                  await userID
                  //need to change this part such that details entered is based on carpark selected
                    .set({'Carpark Name': 'Carpark C', 
                'Car_park_type': 'Open space'});
                print("Fav added");}
                catch (e){
                    print('Error in adding! $e');
                }
                
              },
              child: Text('Add Favorties'))
            ],
          ),

        )
      )
    );
  }

}

// class ReadFavs extends StatefulWidget {
//   const ReadFavs({ Key? key }) : super(key: key);

//   @override
//   _ReadFavs createState() => _ReadFavs();
// }


// class _ReadFavs extends State<ReadFavs>{
//   String _displayText = 'Results go here';
//   final _database = FirebaseDatabase.instance.reference();
//   late StreamSubscription _favStream;

//   @override 
//   void initState(){
//     super.initState();
//     _activateListeners();

//     _database.child("userID").onValue;
//   }

//   void _performSingleFetch() {
//       _database.child('dailySpecial').once().then((snapshot) {
//         final data = new Map<String, dynamic>.from(snapshot.value);
//         final favs = Favorites.fromRTDB (data);
//         setState((){
//           _displayText = favs.carparkName();
//         });
//       });
//   }

//   void _activateListeners(){
//     _favStream =
//       _database.child('userID').onValue.listen((event) {
//     final data = new Map<String, dynamic>.from(event.snapshot.value);
//     final favs = Favorites.fromRTDB(data);

//     setState(() {
//       _displayText = favs.fancyDescription();
//     });
//   });
// }

//   @override
//   Widget build(BuildContext context){

//     return Scaffold(
//      appBar: AppBar(
//        title: Text('Read Favs'),
//      ),
//      body: Center(
//        child: Padding(
//          padding: const EdgeInsets.only(top: 15.0),
//          child: Column(children: [
//            Text(
//              _displayText,
//              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
//              textAlign: TextAlign.center,
//              ),
//              SizedBox(height: 50,),
//              StreamBuilder(stream: _database.child('userID').orderByKey(),limitToLast(10)
//              ,builder: (context, snapshot) {
//                final tilesList= <ListTile>[];
//                 if (snapshot.hasData) {
//                   final my0rders = Map<String, dynamic>.froml
//                       (snapshot.data! as Event).snapshot.value); // Map.from
//                   my0rders. forEach((key, value) {
//                 final nextOrder = Map<String, dynamic>.from(value) :
//                 final orderTile = ListTile(
//                       leading: Icon/(Icons. local_cafel,
//                       title: Text (nextOrder['description']),
//                       subtitle: Text (nextOrder['customer'])); // ListTile
//                 tilesList.add(orderTile);
//                 });
//              }
//              return Expanded(
//                child: ListView(
//                  childen: titlesList,
//                ),
//              );

//          ],)
//        )
//      ), 
//     )
//   }
// }