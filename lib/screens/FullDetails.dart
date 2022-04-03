import 'package:flutter/material.dart';

class FullDetails extends StatelessWidget {
  late String _address;
  FullDetails(String address) {
    this._address = address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(this._address),
    ));
  }
}
