/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as tAgo;

final commentsReference = Firestore.instance.collection("comments");
final activityFeedReference = Firestore.instance.collection("postItems");

// ignore: camel_case_types
class commentsPage extends StatefulWidget {
  final String PostId;
  final String PostOwnerId;
  final String PostImageUrl;

  commentsPage({this.PostId, this.PostImageUrl, this.PostOwnerId});

  @override
  _commentsPageState createState() => _commentsPageState(
      PostId: PostId, PostOwnerId: PostOwnerId, PostImageUrl: PostImageUrl);
}

// ignore: camel_case_types
class _commentsPageState extends State<commentsPage> {
  final String PostId;
  final String PostOwnerId;
  final String PostImageUrl;
  TextEditingController commentTextEditingController = TextEditingController();

  _commentsPageState({this.PostId, this.PostImageUrl, this.PostOwnerId});

  get timestamp => timestamp;

  displayComments() {
    return StreamBuilder(
      stream: commentsReference
          .document(PostId)
          .collection("comments")
          .orderBy("timestamp", descending: false)
          .snapshots(),
      builder: (context, dataSnapShot) {
        if (!dataSnapShot.hasData) {
          return CircularProgressIndicator();
        }
        List<Coment> comments = [];
        dataSnapShot.data.document.forEach((document) {
          comments.add(Coment.fromDocument(document));
        });
        return ListView(
          children: comments,
        );
      },
    );
  }

  saveComment() {
    commentsReference.document(PostId).collection("comments").add({
      "username": currentUserModel.displayName,
      "comment": commentTextEditingController.text,
      "timestamp": DateTime.now(),
      "url": currentUserModel.photoUrl,
      "userId": currentUserModel.id,
    });

    bool isNotPostOwner = PostOwnerId != currentUserModel.id;
    if (isNotPostOwner) {
      activityFeedReference.document(PostId).collection("comments").add({
        "type": "comment",
        "commentDate": timestamp,
        "PostId": PostId,
        "userId": currentUserModel.id,
        "username": currentUserModel.displayName,
        "userProfileImg": currentUserModel.photoUrl,
        "url": PostImageUrl,
      });
    }
    commentTextEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout("Comments"),
      body: Column(
        children: <Widget>[
          Expanded(child: displayComments()),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentTextEditingController,
              decoration: InputDecoration(
                  labelText: "Write a comment Here",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            trailing: OutlineButton(
              onPressed: saveComment,
              borderSide: BorderSide.none,
              child: Text(
                "publish",
                style: TextStyle(color: Colors.greenAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Coment extends StatelessWidget {
  final String username;
  final String userId;
  final String url;
  final String comment;
  final Timestamp timestamp;
  Coment({this.username, this.userId, this.comment, this.timestamp, this.url});
  factory Coment.fromDocument(DocumentSnapshot documentSnapshot) {
    return Coment(
      username: documentSnapshot["userName"],
      userId: documentSnapshot["userId"],
      url: documentSnapshot["url"],
      comment: documentSnapshot["comment"],
      timestamp: documentSnapshot["timestamp"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                username + ":" + comment,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(url),
              ),
              subtitle: Text(tAgo.format(timestamp.toDate())),
            )
          ],
        ),
      ),
    );
  }
}



 */
