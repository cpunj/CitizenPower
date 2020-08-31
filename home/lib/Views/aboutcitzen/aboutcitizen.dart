import 'package:citizenpower/Views/aboutcitzen/about_citizen_widgets/citizen_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/TextStyles.dart';

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
      body: Center(
        child: CitizenInfo(),
      ),
    );
  }
}
