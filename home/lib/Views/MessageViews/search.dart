import 'package:citizenpower/Layouts/GenericLayouts.dart';
import 'package:citizenpower/databaseServices/constants.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'conversation_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
  TextEditingController searchTextEditingController =
      new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethods
        .getUserbyUsername(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTile(
                userName: searchSnapshot.documents[index].data["name"],
                userEmail: searchSnapshot.documents[index].data["email"],
              );
            })
        : Container();
  }

  @override
  void initState() {
    initiateSearch();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout("Search"),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(color: Colors.black38),
                        decoration: new InputDecoration(
                          hintText: "Search username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF)
                            ]),
                            borderRadius: BorderRadius.circular(40)),
                        padding: EdgeInsets.all(20),
                        child: Image.asset("assets/download.png")),
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}

createChatroomAndStartConversation({BuildContext context, String userName}) {
  if (userName != Constants.myName) {
    String chatRoomId = getChatRoomId(userName, Constants.myName);
    List<String> users = [userName, Constants.myName];
    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatroomId": chatRoomId
    };
    ProfileDatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversationScreen()));
  } else {
    print("You cannot send message to yourself");
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName, this.userEmail});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.black38),
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.black38),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
              onTap: () {
                createChatroomAndStartConversation(userName: userName);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Text(
                  "Message",
                  style: TextStyle(color: Colors.black38),
                ),
              ))
        ],
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
