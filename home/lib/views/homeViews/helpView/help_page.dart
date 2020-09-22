import 'package:flutter/material.dart';
import '../../../text_styles.dart';
import 'helpViewWidgets/faq_list.dart';

class HelpView extends StatefulWidget {
  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help",
          style: appBarStyle(),
        ),
      ),
      body: Center(
        child: FAQList(),
      ),
    );
  }
}
