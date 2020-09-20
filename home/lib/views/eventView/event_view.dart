import 'package:citizenpower/constants.dart';
import 'package:citizenpower/views/eventView/finding_events.dart';
import 'package:flutter/material.dart';

class EventView extends StatefulWidget {
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" All Events" "              Create New"),
        elevation: 1.1,
        actions: <Widget>[
          Container(
            color: brightOrange,
            child: CircleAvatar(
              backgroundColor: brightOrange,
              child: IconButton(icon: Icon(Icons.add), onPressed: () {
                Navigator.pushNamed(context, "/k");


              }),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text("The Games Night"),
              subtitle: Text("Location: Hobart CBD"
                  "                                                                   "
                  "  10 min left  "),
              onTap: () {
                Navigator.of(context).pushNamed("/j");
              },
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
          Container(
            child: ListTile(
              title: Text("Citizen Night"),
              subtitle: Text("Location: 10 Elizabeth st , Hobart CBD "
                  "                                                                   "
                  "  1 day left  "),
              onTap: () {
                Navigator.of(context).pushNamed("/j");
              },
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
          Container(
            child: ListTile(
              title: Text("UTAS Open Day"),
              subtitle: Text("Location: University of Tasmania, Sandy bay "
                  "                                                                  "
                  "  1 day left  "),
              onTap: () {
                Navigator.of(context).pushNamed("/j");
              },
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(

        child:

        Icon(Icons.location_searching),
        onPressed: () {
           Navigator.pushNamed(context, "/m");

        },
      ),
    );
  }
}
