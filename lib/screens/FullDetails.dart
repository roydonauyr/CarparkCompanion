import 'package:flutter/material.dart';

class FullDetails extends StatefulWidget {
  // const FullDetails({ Key? key }) : super(key: key);
  late String _address;
  FullDetails(String address) {
    this._address = address;
  }

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    if (favourite == false) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Full Details"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
            actions: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                  });
                },
                label: const Text(''),
              )
            ],
          ),
          body: Center(
            child: Text(widget._address),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Full Details"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
            actions: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 27, 66),
                ),
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                  });
                },
                label: const Text(''),
              )
            ],
          ),
          body: Center(
            child: Text(widget._address),
          ));
    }
  }
}
