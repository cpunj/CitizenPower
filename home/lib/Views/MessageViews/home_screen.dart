import 'package:citizenpower/Views/MessageViews/recent_chat.dart';
import 'package:citizenpower/Views/SocialMenu.dart';
import 'package:citizenpower/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/Views/MessageViews/search.dart';
import 'catagory.dart';
import 'recent_chat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 5, top: 4, bottom: 4),
          child: CircleAvatar(
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SocialMenu(user: widget.user)));
                }),
            backgroundColor: brightOrange,
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1.0,
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white30,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.photo_camera,
                size: 22,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.white10,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 22,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 29,
            backgroundImage: AssetImage("assets/Wilkie.jpeg"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.search),
      onPressed:(){
        Navigator.push(context,
        MaterialPageRoute(
          builder:(context) => SearchScreen()
        ));
      },),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  /*
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search, color: Colors.white),
                            hintText: "search",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )

                   */

                  RecentChats()

                  //hey jack
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
