import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/forumItem.dart';

class forumItemWidget extends StatelessWidget {
  final forumItem item;
  final Animation animation;
  final VoidCallback onClicked;

  const forumItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaleTransition(
    scale: animation,
    child: Container(margin: EdgeInsets.all(8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
    color: Colors.white,),
  child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        leading: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.black,
        ),
        title: Text(item.title, style: TextStyle(fontSize: 20)),
        trailing: IconButton(
          icon: Icon(Icons.check_circle, color: Colors.black),
          onPressed: onClicked,
        ),
      );
}
