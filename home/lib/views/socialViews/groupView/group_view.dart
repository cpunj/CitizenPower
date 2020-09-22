import 'package:citizenpower/constants.dart';
import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/genericWidgets/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/databaseServices/database.dart';

import 'package:flutter/widgets.dart';

ProfileDatabaseMethods databaseMethods = ProfileDatabaseMethods();

class GroupView extends StatefulWidget {
  const GroupView({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  int currentIndex = 3;
  QuerySnapshot groupListSnapshot;

  getGroupList() {
    if (groupListSnapshot == null) {
      databaseMethods.getGroupList().then((val) {
        setState(() {
          groupListSnapshot = val;

          print(groupListSnapshot.documents.length);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (groupListSnapshot == null) {
      getGroupList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
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
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                goCreateGroup(context, widget.user);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            groupListItem(context, widget.user, groupListSnapshot),
          ],
        ),
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

Widget groupListItem(
    BuildContext context, FirebaseUser user, QuerySnapshot groupListSnapshot) {
  return groupListSnapshot != null
      ? ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: groupListSnapshot.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print(groupListSnapshot.documents[index].data["name"]);
                      goGroupView(
                          context,
                          user,
                          groupListSnapshot.documents[index].documentID,
                          groupListSnapshot,
                          index);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(groupListSnapshot
                            .documents[index].data["imageLink"]),
                        radius: 25,
                      ),
                      title: Text(
                        groupListSnapshot.documents[index].data["name"],
                      ),
                      subtitle: Text(groupListSnapshot
                          .documents[index].data["description"]),
                      trailing: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          print(
                              groupListSnapshot.documents[index].data["name"] +
                                  " settings clicked");
                        },
                      ),
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 0.5,
                  ),
                ],
              ),
              decoration: BoxDecoration(),
            );
          })
      : Container();
}
