import 'package:flutter/material.dart';





class LotsRemberer extends StatefulWidget {
  const LotsRemberer({ Key? key }) : super(key: key);

  @override
  _LotsRembererState createState() => _LotsRembererState();
}

class _LotsRembererState extends State<LotsRemberer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("LotsRememberer"),
      ),
      body: new Center(
        child: new Text("This is LR page"),
      ),
      
    );
  }
}