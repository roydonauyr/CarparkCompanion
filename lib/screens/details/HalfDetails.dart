import 'package:flutter/material.dart';

/// Contains only selected information to be displayed, leads to FullDetail Page
class halfDetail extends StatefulWidget {
  const halfDetail({Key? key}) : super(key: key);

  @override
  State<halfDetail> createState() => _halfDetailState();
}

/// State of half detail page
class _halfDetailState extends State<halfDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("new")));
  }
}
