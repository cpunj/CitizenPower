import 'package:citizenpower/constants.dart';
import 'package:citizenpower/controllers/event_controller.dart';
import 'package:citizenpower/controllers/profile_controller.dart';
import 'package:citizenpower/models/event.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Event event = Event();
EventController eventController = EventController();
ProfileController profileController = ProfileController();

class EventView extends StatefulWidget {
  final FirebaseUser user;
  const EventView({Key key, this.user}) : super(key: key);
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    /* if (eventController.eventSnapshot == null) {
      eventController.loadEvent(widget.user.uid).then((val) {
        //'then()' only runs once FS data for view has been downloaded
        setState(() {});
      });
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text(" All Events" "              Create New"),
        elevation: 1.1,
        actions: <Widget>[
          Container(
            color: brightOrange,
            child: CircleAvatar(
              backgroundColor: brightOrange,
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    createEvent(context, widget.user);
                  }),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text("abc"),
              subtitle: Text(""),
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
        child: Icon(Icons.location_searching),
        onPressed: () {
          Navigator.pushNamed(context, "/m");
        },
      ),
    );
  }
}
