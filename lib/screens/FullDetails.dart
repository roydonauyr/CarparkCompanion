import 'dart:async';

import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_application_2/screens/Favourites.dart' as global;
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:get/get.dart';


class FullDetails extends StatefulWidget {
  // const FullDetails({ Key? key }) : super(key: key);
  late String _address;
  late bool favourite;

  FullDetails(String address) {
    this._address = address;
    if (global.favourited.contains(_address)){
      this.favourite = true;
    }else{
      this.favourite = false;
    }
  }

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {

  @override
  Widget build(BuildContext context) {
      print(widget.favourite);
      return Scaffold(
          appBar: AppBar(
            title: Text("Full Details"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
            actions: <Widget>[
                FavoriteButton(
                  isFavorite: widget.favourite,
                  valueChanged: (_isFavorite) {
                    if(_isFavorite){
                      print('Is Favorite : $_isFavorite');
                      setState(() {
                        global.myFavourites.add(widget._address);
                        global.favourited.add(widget._address);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavigatioBar()));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => global.favouritePage()));
                      });
                    }else{
                      print('Is Favorite : $_isFavorite');
                      setState(() {
                        global.myFavourites.remove(widget._address);
                        global.favourited.remove(widget._address);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavigatioBar()));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => global.favouritePage()));
                      });
                    }
                  }
                ),
            ],
          ),
          body: Center(
            child: Text(widget._address),
          ));
  //   } else {
  //     return Scaffold(
  //         appBar: AppBar(
  //           title: Text("Full Details"),
  //           backgroundColor: Color.fromARGB(255, 20, 27, 66),
  //           actions: <Widget>[
  //             ElevatedButton.icon(
  //               icon: const Icon(
  //                 Icons.favorite,
  //                 color: Colors.red,
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                 primary: Color.fromARGB(255, 20, 27, 66),
  //               ),
  //               // onPressed: () {
  //               //   setState(() {
  //               //     widget.favourite = !widget.favourite;
  //               //   });
  //               // },
  //               label: const Text(''),
  //             )
  //           ],
  //         ),
  //         body: Center(
  //           child: Text(widget._address),
  //         ));
  //   }
  // }
  }
}