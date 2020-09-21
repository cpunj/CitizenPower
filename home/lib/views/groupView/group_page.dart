import 'package:citizenpower/views/groupView/picture.dart';
import 'package:citizenpower/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../homeDashboardView/app_home.dart';
import '../postViews/commentViews/comments_page.dart';

class GroupPage extends StatefulWidget {
  const GroupPage(
      {Key key,
      @required this.user,
      this.groupID,
      this.groupSnapshot,
      this.index})
      : super(key: key);
  final FirebaseUser user;
  final String groupID;
  final QuerySnapshot groupSnapshot;
  final int index;

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
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
    final maxLines = 10;
    return Scaffold(
      appBar: AppBar(
          title:
              Text(widget.groupSnapshot.documents[widget.index].data["name"]),
          elevation: 1.0,
          actions: <Widget>[
            CircleAvatar(
              radius: 17,
              backgroundColor: brightOrange,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            CircleAvatar(
              radius: 17,
              backgroundColor: brightOrange,
              child: IconButton(
                icon: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                    image: NetworkImage(widget.groupSnapshot
                        .documents[widget.index].data["imageLink"]),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
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
                      decoration: InputDecoration(
                          hintText: "whats on your mind today?"),
                    ),
                  ),
                  const Divider(
                    height: 10.0,
                    thickness: 0.2,
                  ),
                  SafeArea(
                    child: Row(
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
                          width: 2,
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
                          width: 2,
                        ),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.send,
                              color: darkGold,
                            ),
                            label: Text("Post")),
                      ],
                    ),
                  )
                ],
              ),
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/Wilkie.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "" " Ejaz Ahmed",
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "1 hour ago",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania. ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.1,
                              letterSpacing: .6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/Wilkie.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            makeLike(),
                            Transform.translate(
                              offset: Offset(0, 10),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "400 comments",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "238 shares",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            makeSupportButton(),
                            makeCommentButton(),
                            makeShareButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/Wilkie.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "" " Ejaz Ahmed",
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "1 hour ago",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey there, My name is Ejaz Ahmed , I am currently studying at university of Tasmania. ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.1,
                              letterSpacing: .6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/Wilkie.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            makeLike(),
                            Transform.translate(
                              offset: Offset(0, 10),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "400 comments",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "238 shares",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            makeSupportButton(),
                            makeCommentButton(),
                            makeShareButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class makeCommentButton extends StatefulWidget {
  @override
  _makeCommentButtonState createState() => _makeCommentButtonState();
}

// ignore: camel_case_types
class _makeCommentButtonState extends State<makeCommentButton> {
  _commentButtonPressed() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CommentsScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chat, color: Colors.grey, size: 18),
              onPressed: () => _commentButtonPressed(),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Comment",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

Widget makeShareButton() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[200]),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.grey,
              size: 18,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Share",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget makeLike() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: Center(
      child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
    ),
  );
}
