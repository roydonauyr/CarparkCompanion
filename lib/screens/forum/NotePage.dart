import 'package:flutter/material.dart';

final List<String> noteDescription = [];
final List<String> noteHeading = [];
final List<String> noteUser = [];
TextEditingController noteHeadingController = new TextEditingController();
TextEditingController noteUserController = new TextEditingController();
TextEditingController noteDescriptionController = new TextEditingController();
FocusNode textSecondFocusNode = new FocusNode();

int notesHeaderMaxLenth = 50;
int notesDescriptionMaxLines = 10;
int notesUserMaxLines = 10;
int? notesDescriptionMaxLenth;
String deletedNoteHeading = "";
String deletedNoteDescription = "";
String deletedNoteUser = "";

List<Color> noteColor = [
  Color.fromARGB(255, 180, 210, 243),
  Color.fromARGB(255, 139, 196, 223),
  Color.fromARGB(255, 126, 169, 201),
  Color.fromARGB(255, 101, 144, 223),
  Color.fromARGB(255, 109, 123, 201),
  Color.fromARGB(255, 76, 133, 167),
  Color.fromARGB(255, 59, 99, 185),
  Color.fromARGB(255, 44, 102, 209),
  Color.fromARGB(255, 20, 86, 161),
  Color.fromARGB(255, 13, 15, 124),
];
List<Color> noteMarginColor = [
  Color.fromARGB(255, 180, 210, 243),
  Color.fromARGB(255, 139, 196, 223),
  Color.fromARGB(255, 126, 169, 201),
  Color.fromARGB(255, 101, 144, 223),
  Color.fromARGB(255, 109, 123, 201),
  Color.fromARGB(255, 76, 133, 167),
  Color.fromARGB(255, 59, 99, 185),
  Color.fromARGB(255, 44, 102, 209),
  Color.fromARGB(255, 20, 86, 161),
  Color.fromARGB(255, 13, 15, 124),
];
