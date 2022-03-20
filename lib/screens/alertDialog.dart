import 'package:flutter/material.dart';

class LotRemembererForm extends StatefulWidget {
  const LotRemembererForm({Key? key}) : super(key: key);

  @override
  State<LotRemembererForm> createState() => _LotRemembererFormState();
}

class _LotRemembererFormState extends State<LotRemembererForm> {
  TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
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

  String codeDialog = "";
  String valueText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (codeDialog == "123456") ? Colors.green : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Alert Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: Text('Press For Alert'),
        ),
      ),
    );
  }
}
