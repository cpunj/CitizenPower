import 'package:citizenpower/Layouts/GenericLayouts.dart';
import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ElectorateView extends StatefulWidget {
  //Transferring user between widgets
  const ElectorateView({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _ElectorateViewState createState() => _ElectorateViewState();
}

class _ElectorateViewState extends State<ElectorateView> {
  //Sets bottom nav bar to correct highlight
  int currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //D
      appBar: topAppBarLayout('Clark\'s Leaders'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          //Electorate Image Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                //Pushes to ImageView() for user to inspect electorate map
                //ImageView requires image reference
                onTap: () {
                  goImageView(context, 'assets/TasFinalImage.png');
                },
                child: Card(
                  elevation: 4,
                  child: Image.asset(
                    'assets/TasFinalImage.png',
                    height: 200,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward),
              GestureDetector(
                //Pushes to ImageView() for user to inspect electorate map
                //ImageView requires image reference
                onTap: () {
                  goImageView(context, 'assets/ClarkFinal.png');
                },
                child: Card(
                  elevation: 4,
                  child: Image.asset(
                    'assets/ClarkFinal.png',
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context, widget.user, currentIndex);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
