import 'package:citizenpower/constants.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/databaseServices/helper_functions.dart';
import 'package:citizenpower/views/socialViews/messageViews/search.dart';
import 'package:citizenpower/views/socialViews/socialMenuView/social_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'conversation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
  Stream chatRoomsStream;
  Widget chatRoomList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return ChatRoomTile(
                      snapshot.data.documents[index].data["chatroomId"]
                          .toString()
                          .replaceAll("...", "")
                          .replaceAll(Constants.myName, ""),
                      snapshot.data.documents[index].data["chatRoomId"]);
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Constants.myName).then((value) {
      setState(() {
        chatRoomsStream = value;
      });
    });
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchScreen(user: widget.user)));
        },
      ),

      body: chatRoomList(),
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

      //hey jack
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  final String userEmail;
  final String chatRoomId;
  ChatRoomTile(this.userEmail, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationScreen(chatRoomId),
              ));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "${userEmail.substring(0, 1).toUpperCase()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(userEmail),
            ],
          ),
        ));
  }
}
