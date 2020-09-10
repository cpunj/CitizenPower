import 'package:citizenpower/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeadersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LeaderListState();
}

class _LeaderListState extends State<LeadersList> {
  List<String> _locations = [
    'A',
    'B',
    'C',
    'D',
    "E",
    "f",
    "G"
        "H",
  ]; // Option 2
  String _selectedLocation; // Option 2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text("List of Leaders"),
          backgroundColor: brightOrange,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                width: 380,
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      hint: Text(
                          'Please select any Leader'), // Not necessary for Option 1
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _locations.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                    color: darkGold, child: Text("GO"), onPressed: () {}),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                decoration: BoxDecoration(
                  color: brightOrange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(22.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "search Leaders",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {},
                        ))
                  ],
                ),
              ),
              Container(
                child: new Text("Recent stories"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
