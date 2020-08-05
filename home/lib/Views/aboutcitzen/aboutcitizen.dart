import 'package:citizenpower/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutCitizenInfo extends StatefulWidget {
  @override
  _AboutCitizenInfoState createState() => _AboutCitizenInfoState();
}

class _AboutCitizenInfoState extends State<AboutCitizenInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Abount citizen",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "OUR VISION",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: darkGold,
                letterSpacing: 0.5,
                wordSpacing: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Our vision is to create societies that uphold human rights, using the arts as a vehicle for social change and transformation providing individuals with the tools to tackle human rights challenges in their communities.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "OUR VALUES ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: darkGold,
                letterSpacing: 0.6,
                wordSpacing: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "At Citizen Tasmanian we believe in actively embodying diversity and inclusion. We are proud to have"
              "a leadership team consisting of individuals from different cultural backgrounds and a mix of genders. However, we acknowledge that true diversity requires the inclusion of voices from all walks of life and we are committed to creating a space where all people have equitable access to opportunities within our organisation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Contact us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: darkGold,
                letterSpacing: 0.6,
                wordSpacing: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Address :"
                    " 4 Battery Square, Battery Point Tas 7004 Australia ."
                    "                                                   "
                    "Phone: 0450546136"
                    "                        "
                    "                                                    "
                    "Email: contact@citizentas.org",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: darkGold,
                    onPressed: () {},
                    child: Text(
                      "DONATE US",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
