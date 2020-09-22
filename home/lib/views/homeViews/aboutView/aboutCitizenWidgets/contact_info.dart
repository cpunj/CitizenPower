import 'package:flutter/material.dart';

import '../../../../text_styles.dart';
import 'donate_page.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Contact us",
            style: headerStyle1(),
          ),
          Text(
            "Address: 4 Battery Square, Battery Point, Tasmania 7004"
            "                                                   "
            "Contact: 0450546136"
            "                        "
            "                                                    "
            "E-mail: contact@citizentas.org",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Color(0xFFF57F17),
            minWidth: 120.0,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new Donate()),
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
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
