import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class GroupView extends StatefulWidget {
  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("                " "Groups"),
      ),
      body: SingleChildScrollView(),
    );
  }
}
