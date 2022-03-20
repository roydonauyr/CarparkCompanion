import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/alertDialog.dart';

class LotsRemberer extends StatefulWidget {
  const LotsRemberer({Key? key}) : super(key: key);

  @override
  _LotsRembererState createState() => _LotsRembererState();
}

class _LotsRembererState extends State<LotsRemberer> {
  TextEditingController _textFieldController = TextEditingController();

  //Lot remember details
  String codeDialog = "";
  String valueText = "";
  bool remembered = false;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter carpark details'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Carpark Name"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  remembered = true;
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("LotsRememberer"),
        ),
        body: Center(
            child: remembered
                ? Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.car_rental),
                              title: Text(valueText)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text("Remove"),
                                onPressed: () {
                                  remembered = false;
                                  setState(() {});
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _displayTextInputDialog(context);
                      },
                      child: Text('Lot Remember!'),
                    ),
                  )));
  }
}
