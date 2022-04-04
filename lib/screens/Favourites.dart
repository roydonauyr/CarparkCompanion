import 'package:flutter/material.dart';





class favouritePage extends StatefulWidget {
  const favouritePage({ Key? key }) : super(key: key);

  @override
  _favouritePageState createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Favourite"),
        backgroundColor: Color.fromARGB(255, 20, 27, 66),
      ),
      body: new Center(
        child: new Text("This is fav page"),
      ),
      
    );
  }
}