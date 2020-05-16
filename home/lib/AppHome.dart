import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';


class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}


class _AppHomeState extends State<AppHome> {
  @override
  _onTap(int index){ //This acts as a navigator for the Nav Bar

    if (index == 0) {
      BuildContext context;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AppHome()),
      );
    } else if (index == 1) {
      //Need to implement home page, AppHome()
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(

            )
        ),
      );

    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Electorate()),
      );
    } else if (index == 3) {
      /*
       Navigator.push(

         context,
         MaterialPageRoute(
             builder: (context) => Electorate()),
       ); */
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Setting()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dashboard ",
          style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.more_vert),
          ),
        ],


      ) ,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,


          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle),
              title: Text('Electorate'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('Event'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          onTap: (index){
            setState(() {
              _onTap(index);
            });
         }
        //onTap: _onTap,
      ),


    );
  }
}