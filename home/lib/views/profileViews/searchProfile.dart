import 'package:citizenpower/databaseServices/constants.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:citizenpower/databaseServices/helperfunctions.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

String _myName;

class _SearchScreenState extends State<SearchView> {
  ProfileDatabaseMethods databaseMethods = new ProfileDatabaseMethods();
  TextEditingController searchTextEditingController =
      new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    if (searchTextEditingController != null) {
      databaseMethods
          .getProfilebyUsername(searchTextEditingController.text)
          .then((val) {
        setState(() {
          searchSnapshot = val;
        });
      });
    }
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
    getUserInfo();
    initiateSearch();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout("Search Profiles"),
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

class SearchTile extends StatelessWidget {
  final FirebaseUser user;
  final String userName;
  final String userEmail;
  SearchTile({this.userName, this.userEmail, this.user});
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
                goProfileView(context, user, userName);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Text(
                  "View Profile",
                  style: TextStyle(color: Colors.black38),
                ),
              ))
        ],
      ),
    );
  }
}
