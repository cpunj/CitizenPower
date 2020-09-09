import 'package:flutter/material.dart';

import '../../../text_styles.dart';
import '../../../constants.dart';
import 'donate_page.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "Contact us",
            style: headerStyle1(),
          ),
          Text(
            " 4 Battery Square, Battery Point, Tasmania 7004"
                "                                                   "
                "0450546136"
                "                        "
                "                                                    "
                "contact@citizentas.org",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: darkGold,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Donate()),
              );
            }, //to donate page
            child: Text(
              "Donate",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}