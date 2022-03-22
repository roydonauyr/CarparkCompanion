import 'package:flutter/material.dart';





class helpPage extends StatefulWidget {
  const helpPage({ Key? key }) : super(key: key);

  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Help"),
        backgroundColor: Color.fromARGB(255, 20, 27, 66),
      ),
      body: new Center(
        child: new Text("This is help page"),
      ),
      
    );
  }
}