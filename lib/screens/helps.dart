import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/screens/Favourites.dart';
import 'package:flutter_application_2/screens/forum/NotePage.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'authenticate/login_or_register.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class helpPage extends StatefulWidget {
  const helpPage({Key? key}) : super(key: key);

  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    notesDescriptionMaxLenth =
        notesDescriptionMaxLines * notesDescriptionMaxLines;
  }

  @override
  void dispose() {
    noteDescriptionController.dispose();
    noteHeadingController.dispose();
    noteUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    if (user == null) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text("Forum"),
          backgroundColor: Color.fromARGB(255, 20, 27, 66),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginOrRegsiter()));
                },
                child: Text('Login'),
              ),
            )
          ],
        )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromARGB(255, 20, 27, 66) ,
          elevation: 0,
          title: const Text(   "Forum",
                            ),
        ),
        body: noteHeading.length > 0
            ? buildNotes()
            : Center(child: Text("No Entries!")),
        floatingActionButton: FloatingActionButton(
          mini: false,
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            _settingModalBottomSheet(context);
          },
          child: Icon(Icons.create),
        ),
      );
    }
  }

  Widget buildNotes() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: new ListView.builder(
        itemCount: noteHeading.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.5),
            child: new Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                setState(() {
                  deletedNoteHeading = noteHeading[index];
                  deletedNoteDescription = noteDescription[index];
                  deletedNoteUser = noteUser[index];
                  noteHeading.removeAt(index);
                  noteDescription.removeAt(index);
                  noteUser.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      backgroundColor: Colors.purple,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Forum Deleted",
                            style: TextStyle(),
                          ),
                          deletedNoteHeading != ""
                              ? GestureDetector(
                                  onTap: () {
                                    print("undo");
                                    setState(() {
                                      if (deletedNoteHeading != "") {
                                        noteHeading.add(deletedNoteHeading);
                                        noteDescription.add(deletedNoteDescription);
                                        noteUser.add(deletedNoteUser);
                                      }
                                      deletedNoteHeading = "";
                                      deletedNoteDescription = "";
                                      deletedNoteUser="";
                                    });
                                  },
                                  child: new Text(
                                    "Undo",
                                    style: TextStyle(),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  );
                });
              },
              background: ClipRRect(
                borderRadius: BorderRadius.circular(5.5),
                child: Container(
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              secondaryBackground: ClipRRect(
                borderRadius: BorderRadius.circular(5.5),
                child: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              child: noteList(index),
            ),
          );
        },
      ),
    );
  }

  Widget noteList(int index) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5.5),
        child: InkWell(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: noteColor[(index % noteColor.length).floor()],
              borderRadius: BorderRadius.circular(5.5),
            ),
            height: 100,
            child: Center(
              child: Row(
                children: [
                  new Container(
                    color: noteMarginColor[
                        (index % noteMarginColor.length).floor()],
                    width: 3.5,
                    height: double.infinity,
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Text(
                              "Carpark: "+noteHeading[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.00,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                          Flexible(
                            child: Text(
                              "Written By: "+ noteUser[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.00,
                                color: Colors.black,
                                
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                          Flexible(
                            child: Container(
                              height: double.infinity,
                              child: AutoSizeText(
                                "Description: ${(noteDescription[index])}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.00,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => newComment(index),
                ));
          },
        ));
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 50,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250, top: 50),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Forum",
                            style: TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              {
                                setState(() {
                                  noteHeading.add(noteHeadingController.text);
                                  noteDescription.add(noteDescriptionController.text);
                                  noteUser.add(noteUserController.text);
                                  noteHeadingController.clear();
                                  noteDescriptionController.clear();
                                  noteUserController.clear();
                                });
                                Navigator.pop(context);
                              }
                              print("Notes.dart LineNo:239");
                              print(noteHeadingController.text);
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 20.00,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.blueAccent,
                        thickness: 2.5,
                      ),
                      TextFormField(
                        maxLength: notesHeaderMaxLenth,
                        controller: noteHeadingController,
                        decoration: InputDecoration(
                          hintText: "Carpark Name",
                          hintStyle: TextStyle(
                            fontSize: 15.00,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
                        },
                      ),
                      TextFormField(
                        maxLength: notesUserMaxLines,
                        controller: noteUserController,
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          hintStyle: TextStyle(
                            fontSize: 15.00,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 5 * 24.0,
                          child: TextFormField(
                            focusNode: textSecondFocusNode,
                            maxLines: notesDescriptionMaxLines,
                            maxLength: notesDescriptionMaxLenth,
                            controller: noteDescriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                fontSize: 15.00,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget notesHeader() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      left: 2.5,
      right: 2.5,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forum",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 25.00,
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          color: Colors.blueAccent,
          thickness: 2.5,
        ),
      ],
    ),
  );
}

class newComment extends StatefulWidget {
  int index;
   newComment(this.index, {Key? key});
   

  @override
  _newCommentState createState() => _newCommentState(this.index);
}

class _newCommentState extends State<newComment> {
  int index;

  _newCommentState (this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 20, 27, 66),
          elevation: 0.0,
          title: Text(
                              "Carpark: "+noteHeading[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.00,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
        ),
        body: ListView(
            children: [
              Card(
                  elevation: 5.0,
                  color: Color.fromARGB(255, 177, 195, 216),
                  child: ListTile(
                    leading: Icon(Icons.location_pin, size: 28.0),
                    title: Text(
                      noteHeading[index],
                      textAlign: TextAlign.justify,
                    ),
                  )),
              Card(
                  elevation: 5.0,
                  child: ListTile(
                      leading: Icon(Icons.car_rental, size: 30.0),
                      title: Text(" "),
                      subtitle: Text(
                          "Written By: "+ noteUser[index] +
                              '\n\n' +
                              "Description: ${(noteDescription[index])}" +
                              '\n',
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black,fontSize: 15.0)))),
              
            ],
            shrinkWrap: true,
          )
        ,);
  }
}

// void _editScreen(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return Container(
//             height: MediaQuery.of(context).size.height * .60,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   Row(children: <Widget>[
//                     Text("enter forum details", style: TextStyle(fontSize: 30)),
//                     Spacer(),
//                     IconButton(
//                         icon: Icon(
//                           Icons.cancel,
//                           color: Colors.orange,
//                           size: 25,
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         })
//                   ]),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const TextField(
//                         keyboardType: TextInputType.name,
//                         decoration: InputDecoration(labelText: 'Carpark Name'),
//                       ),
//                       const TextField(
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(labelText: '???'),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {}, child: const Text('Submit'))
//                     ],
//                   ),
//                 ],
//               ),
//             ));
//       });
// }

void _editScreen(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 50,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext bc) {
      var _formKey2;
      return Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: _formKey2,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 250, top: 50),
                child: new Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit Forum",
                          style: TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            {
                              setState2(() {
                                noteHeading.add(noteHeadingController.text);
                                noteDescription.add(noteDescriptionController.text);
                                noteUser.add(noteUserController.text);
                                noteHeadingController.clear();
                                noteDescriptionController.clear();
                                noteUserController.clear();
                              });
                              Navigator.pop(context);
                            }
                            print("Notes.dart LineNo:239");
                            print(noteHeadingController.text);
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 20.00,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.blueAccent,
                      thickness: 2.5,
                    ),
                    TextFormField(
                      maxLength: notesHeaderMaxLenth,
                      controller: noteHeadingController,
                      decoration: InputDecoration(
                        hintText: "Forum Heading",
                        hintStyle: TextStyle(
                          fontSize: 15.00,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(Icons.text_fields),
                      ),
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context)
                            .requestFocus(textSecondFocusNode);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        margin: EdgeInsets.all(1),
                        height: 5 * 24.0,
                        child: TextFormField(
                          focusNode: textSecondFocusNode,
                          maxLines: notesDescriptionMaxLines,
                          maxLength: notesDescriptionMaxLenth,
                          controller: noteDescriptionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                            hintStyle: TextStyle(
                              fontSize: 15.00,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void setState2(Null Function() param0) {}
