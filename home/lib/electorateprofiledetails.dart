import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ElectorateDetails extends StatelessWidget {
  const ElectorateDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      title: new Text("Electorate details view "),
    ));
  }
}
