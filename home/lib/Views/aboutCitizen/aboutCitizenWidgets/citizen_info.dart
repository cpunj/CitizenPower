import 'package:flutter/material.dart';

import '../../../text_styles.dart';
import 'contact_info.dart';

class CitizenInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "OUR VISION",
            style: headerStyle1(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Our vision is to create societies that uphold human rights, using the arts as a vehicle for social change and transformation providing individuals with the tools to tackle human rights challenges in their communities.",
            style: infoTextStyle1(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "OUR VALUES ",
            style: headerStyle1(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "At Citizen Tasmanian we believe in actively embodying diversity and inclusion. We are proud to have"
            "a leadership team consisting of individuals from different cultural backgrounds and a mix of genders. However, we acknowledge that true diversity requires the inclusion of voices from all walks of life and we are committed to creating a space where all people have equitable access to opportunities within our organisation",
            style: infoTextStyle1(),
            textAlign: TextAlign.center,
          ),
          ContactInfo(),
        ],
      ),
    );
  }
}
