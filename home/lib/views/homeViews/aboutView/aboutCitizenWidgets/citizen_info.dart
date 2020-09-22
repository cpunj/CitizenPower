import 'package:flutter/material.dart';

import '../../../../text_styles.dart';
import 'contact_info.dart';

class CitizenInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints.expand(
              height: 192,
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/cz_top.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Why we exist?",
            style: textStyleBold(),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Australia is the only liberal democracy without a Bill of Rights. We exist to challenge the systems that deny citizens comprehensive human rights protection, build human rights friendly cultures and lead grassroots community action towards legislative change.",
            style: infoTextStyle1(),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          new Container(
            constraints: new BoxConstraints.expand(
              height: 192,
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/cz_mid.png'),
              ),
            ),
          ),
          Text(
            "Vision",
            style: textStyleBold(),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Our vision is to create societies that uphold human rights, using the arts as a vehicle for social change and transformation providing individuals with the tools to tackle human rights challenges in their communities.",
            style: infoTextStyle1(),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          new Container(
            constraints: new BoxConstraints.expand(
              height: 192,
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/cz_last.png'),
              ),
            ),
          ),
          Text(
            "Values",
            style: textStyleBold(),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "At Citizen Tasmanian we believe in actively embodying diversity and inclusion. We are proud to have a leadership team consisting of individuals from different cultural backgrounds and a mix of genders. However, we acknowledge that true diversity requires the inclusion of voices from all walks of life and we are committed to creating a space where all people have equitable access to opportunities within our organisation",
            style: infoTextStyle1(),
            textAlign: TextAlign.left,
          ),
          new Container(
            constraints: new BoxConstraints.expand(
              height: 160,
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/cz_end.png'),
              ),
            ),
          ),
          ContactInfo(),
        ],
      ),
    );
  }
}
