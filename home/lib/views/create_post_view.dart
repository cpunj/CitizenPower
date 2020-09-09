import 'package:citizenpower/constants.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  final FirebaseUser user;

  const NewPost({Key key, this.user}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  int currentIndex = 2;

  _openGallary() {}

  _openCamera() {}

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("please Select one "),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallary"),
                    onTap: () {
                      _openGallary();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final maxLines = 12;
    return Scaffold(
      appBar: new AppBar(
        title: Text("Create New Post"),
        elevation: 1.0,
        actions: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.white30,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  size: 22,
                  color: Color.fromRGBO(195, 195, 195, 1),
                ),
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        height: maxLines * 20.0,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/Wilkie.jpeg"),
                ),
              ],
            ),
            Expanded(
              child: TextField(
                maxLines: maxLines,
                decoration:
                    InputDecoration(hintText: "whats on your mind today?"),
              ),
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.orangeAccent,
                    ),
                    label: Text("Photo")),
                const VerticalDivider(
                  width: 7,
                ),
                FlatButton.icon(
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.redAccent,
                    ),
                    label: Text("Videos")),
                const VerticalDivider(
                  width: 7,
                ),
                FlatButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                      color: darkGold,
                    ),
                    label: Text("Location")),
              ],
            ),
          ],
        ),
        color: Colors.grey[100],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context, widget.user, currentIndex);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
