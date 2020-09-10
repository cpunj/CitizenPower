import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<String> _comments = [];

  String submitted;

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    // ignore: missing_return
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comments.length) {
        return _buildCommentItem(_comments[index]);
      }
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text(comment),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Comments"),
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
          child: Column(
            children: <Widget>[
              Expanded(
                child: _buildCommentList(),
              ),
              Container(
                child: TextField(
                  onSubmitted: (String submitted) {
                    _addComment(submitted);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      hintText: "Write a comment... "),
                ),
              ),
            ],
          ),
        ));
  }
}
