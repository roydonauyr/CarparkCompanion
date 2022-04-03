import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/localUser.dart';
import 'package:flutter_application_2/screens/Favourites.dart';
import 'package:provider/provider.dart';

import 'authenticate/login_or_register.dart';

class helpPage extends StatefulWidget {
  const helpPage({Key? key}) : super(key: key);

  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  TextEditingController _textFieldController = TextEditingController();

  // final key = GlobalKey<AnimatedListState>();
  // final items = List.from(Data.forumList);

  final List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = ['carpark a', 'carpark b', 'carpark c'];
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
          appBar: new AppBar(
            title: new Text("Forum"),
            backgroundColor: Color.fromARGB(255, 20, 27, 66),
          ),
          body: Center(
              child: Stack(children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Card(
                  child: InkWell(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                      ),
                      title: Text(items[index]),
                      subtitle: Text("This is subtitle"),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const newComment()));
                    },
                  ),
                );
              },
              itemCount: items.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  _editScreen(context);
                },
                tooltip: 'Add',
                child: Icon(Icons.add),
              ),
            ),
          ])));
    }
  }
}

class newComment extends StatefulWidget {
  const newComment({Key? key}) : super(key: key);

  @override
  _newCommentState createState() => _newCommentState();
}

class _newCommentState extends State<newComment> {
  // List<String> _comments = ['test1', 'stupid', 'die'];

  // void _addComments(String val) {
  //   setState(() {
  //     _comments.add(val);
  //   });
  // }

  // Widget _buildCommentList() {
  //   return ListView.builder(
  //     itemBuilder: (context, index) {
  //       if (index < _comments.length) {
  //         return _buildCommentItem(_comments[index]);
  //       }
  //       return (_buildCommentList());
  //     },
  //     shrinkWrap: true,
  //     scrollDirection: Axis.vertical,
  //   );
  // }

  // Widget _buildCommentItem(String comment) {
  //   return ListTile(title: Text(comment));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: new AppBar(title: Text("Comments")),
  //       body: Column(children: <Widget>[
  //         Expanded(child: _buildCommentList()),
  //         TextField(
  //           onSubmitted: (String submittedStr) {
  //             _addComments(submittedStr);
  //           },
  //           decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(20.0),
  //               hintText: "Add comment"),
  //         )
  //       ]));
  // }

  @override
  Widget build(BuildContext context) {
    final comments = ['bad carpark', 'shitty'];

    return Scaffold(
      appBar: new AppBar(
        title: new Text("forum details page"),
        backgroundColor: Color.fromARGB(255, 20, 27, 66),
      ),
      body: Center(
          child: Stack(children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext, index) {
            return Card(
              child: InkWell(
                child: ListTile(
                  // leading: CircleAvatar(
                  //   backgroundColor: Colors.black,
                  // ),
                  title: Text(comments[index]),
                  subtitle: Text("This is subtitle"),
                ),
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const newComment()));
                // },
              ),
            );
          },
          itemCount: comments.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              _editScreen(context);
            },
            tooltip: 'Add',
            child: Icon(Icons.add),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20.0),
              hintText: 'Hint Text',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ])),
    );
  }
}

class forumPage extends StatefulWidget {
  const forumPage({Key? key}) : super(key: key);

  @override
  _newForumPage createState() => _newForumPage();
}

class _newForumPage extends State<forumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("enter forum details to add"),
        backgroundColor: Color.fromARGB(255, 20, 27, 66),
      ),
      body: new Center(
        child: new Text("This is forum detail page"),
      ),
    );
  }
}

void _editScreen(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text("enter forum details", style: TextStyle(fontSize: 30)),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.orange,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ]),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: 'Carpark Name'),
                      ),
                      const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: '???'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Submit'))
                    ],
                  ),
                ],
              ),
            ));
      });
}

Widget _card() {
  return Container(
      height: 80,
      margin: EdgeInsets.only(top: 5, left: 8, right: 8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orangeAccent[100],
      ));
}

// Widget buildInsertButton() => RaisedButton(
//       child: Text(
//         'Insert Item',
//         style: TextStyle(fontSize: 20),
//       ),
//       color: Colors.white,
//       onPressed: () => insertItem(3, Data.forumList.first),
//     );

// void insertItem(int index, forumItem item) {
//   items.insert(index, item);
//   key.currentState.insertItem(index);
// }

// Widget buildItem(item, int index, Animation<double> animation) =>
//     forumItemWidget(
//       item: item,
//       animation: animation,
//       onClicked: () {},
//     );
