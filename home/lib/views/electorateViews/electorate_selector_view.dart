import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../electorateViews/electorate_view.dart';
import '../../text_styles.dart';

class ElectorateSelectorView extends StatefulWidget {
  const ElectorateSelectorView({Key key, @required this.user})
      : super(key: key);
  final FirebaseUser user;

  @override
  _ElectorateSelectorViewState createState() => _ElectorateSelectorViewState();
}

class _ElectorateSelectorViewState extends State<ElectorateSelectorView> {
  final List<String> _states = ['ACT', 'NSW', 'NT', 'QLD', 'TAS', 'VIC', 'WA'];

  String _selectedState;
  bool _stateSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Electorate",
          style: appBarStyle(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "Select State",
              style: headerStyle1(),
            ),
            DropdownButton(
              hint: Text(
                'Select State',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              value: _selectedState,
              onChanged: (newValue) {
                setState(() {
                  _selectedState = newValue;
                  _stateSelected = true;
                });
              },
              items: _states.map((location) {
                return DropdownMenuItem(
                  child: new Text(
                    location,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  value: location,
                );
              }).toList(),
            ),
            SizedBox(
              width: 10,
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            (_selectedState != null)
                ? electorateListItem(_selectedState)
                : Container()
          ],
        ),
      ),
    );
  }
}

Widget electorateListItem(String stateSelected) {
  List<String> electorateList = electorateListPopulate(stateSelected);

  print(electorateList);

  return Container(
    //physics: ScrollPhysics(),

    child: Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Select Electorate", style: headerStyle1()),

              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: electorateList.length,
                  itemBuilder: (context, index) {

                    // TO DO: MAKE IT SO ON CLICK, NAVIGATES TO NEXT PAGE
                    return Container(
                      height: 60,
                      child: GestureDetector(

                        onTap: () {
                          print(electorateList[index]);
                          Navigator.of(context).pushNamed("/l");

                        },

                        child: Card(
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: <Widget>[
                                new Text(
                                  electorateList[index],
                                  style: profileNameStyle(),
                                ),
                              ],

                        )),
                      ),
                    );
                  })
            ]
        ),
      ),
    ),
  );
}

// This class will be parsed a State, and return the list of electorates
List<String> electorateListPopulate(String state) {
  List<String> stateElectorateList;

  if (state == "TAS") {
    stateElectorateList = [
      'Bass', 'Braddon', 'Clark', 'Franklin', 'Lyons',
    ];
  } else if (state == "ACT") {
    stateElectorateList = [
      'Brindabella',
      'Ginninderra',
      'Kurrajong',
      'Murrumbidgee',
      'Yerrabi'
    ];
  }

  return stateElectorateList;
}

//BELOW: Destination following the new two strings for state/electorate

