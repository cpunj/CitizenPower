import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/text_styles.dart';

import 'aboutCitizenWidgets/citizen_info.dart';

class AboutCitizenInfo extends StatefulWidget {
  @override
  _AboutCitizenInfoState createState() => _AboutCitizenInfoState();
}

class _AboutCitizenInfoState extends State<AboutCitizenInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Citizen Tasmania", style: appBarStyle()),
      ),
      body: SingleChildScrollView(
        child: CitizenInfo(),
      ),
    );
  }
}
