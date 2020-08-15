import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
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
        child: TextField(
          maxLines: maxLines,
          decoration: InputDecoration(hintText: "whats on your mind today?"),
        ),
        color: Colors.grey[100],
      ),
    );
  }
}
