import 'package:citizenpower/Layouts/GenericLayouts.dart';
import 'package:citizenpower/TextStyles.dart';
import 'package:flutter/material.dart';

class SocialMenu extends StatefulWidget {
  @override
  _SocialMenuState createState() => _SocialMenuState();
}
//TODO: Find background pictures for buttons

Widget socialButton(String title, BuildContext context) {
  return Expanded(
    child: FlatButton(
      color: Colors.blueAccent,
      onPressed: () {},
      child: Text(
        "$title",
        style: buttonTextStyle1Large(),
      ),
    ),
  );
}

class _SocialMenuState extends State<SocialMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout("Social"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              socialButton("Events", context),
              SizedBox(
                height: 10,
              ),
              socialButton("Groups", context),
              SizedBox(
                height: 10,
              ),
              socialButton("Messages", context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
