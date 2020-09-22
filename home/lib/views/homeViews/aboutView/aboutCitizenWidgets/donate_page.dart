import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../text_styles.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  List<bool> isSelected = List.generate(3, (_) => false);
  int sex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Donate", style: appBarStyle()),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/donate.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: <Widget>[
                  ToggleButtons(
                    selectedColor: Colors.deepOrange,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(Icons.attach_money),
                        Text("   5     "),
                      ]),
                      Row(children: <Widget>[
                        Icon(Icons.attach_money),
                        Text("   10     "),
                      ]),
                      Row(children: <Widget>[
                        Icon(Icons.attach_money),
                        Text("   20     "),
                      ]),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = !isSelected[buttonIndex];
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected,
                  ),
                ]),
                Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Single"),
                      Radio(
                        value: 1,
                        activeColor: Colors.deepOrange,
                        groupValue: this.sex,
                        onChanged: (value) {
                          setState(() {
                            this.sex = value;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      Text("Monthly"),
                      Radio(
                        value: 2,
                        activeColor: Colors.deepOrange,
                        groupValue: this.sex,
                        onChanged: (value) {
                          setState(() {
                            this.sex = value;
                          });
                        },
                      )
                    ],
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                RaisedButton.icon(
                  icon: Icon(Icons.payment),
                  label: Text('Donate'),
                  onPressed: () {
                    launch('https://paypal.me/pools/c/8szEPKLNHp');
                  },
                  splashColor: Colors.deepOrange,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your donation can encourage us!",
                  style: infoTextStyle1(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thank you",
                  style: headerStyle1(),
                ),
              ]),
        ));
  }
}
