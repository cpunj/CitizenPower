import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/models/event.dart';
import '../../constants.dart';

Event event = Event();


class CreateNewEvent extends StatefulWidget {
  @override
  _CreateNewEventState createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  List<bool> isSelected;

  @override
  void initState(){
    isSelected = [false, true];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Create new Event"),
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
            children: [


              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: "Event Name",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    )


                ),

              ),
              SizedBox(
                height: 50,

              ),

              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Description",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                  ),

                ),

              ),
              SizedBox(
                height: 50,

              ),

              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Enter Your location",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),


              ),
              SizedBox(
                height: 50,

              ),
              Column(
                  children: [
                    Container(padding: EdgeInsets.only(bottom: 7),child: Text("Choose Privacy Level")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        ToggleButtons(
                          selectedBorderColor: darkGold,
                          fillColor: darkGold,

                          selectedColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),


                          children: <Widget>[
                            Padding (
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical:20),
                              child: Text('Public',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical:20),
                              child: Text('Private',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],

                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < isSelected.length; i++){
                                isSelected[i] = i == index;
                              }
                              // Here, if the index == 0 then group preference is Public; or if index == 1 it's Private

                              if (index == 0){
                                // This needs to be integrated into database accessing (somehow)
                                //privacyController = true;
                                print('Public');

                              } else {
                                //privacyController = false;
                                print('Private');
                              }

                            });
                          },

                          isSelected: isSelected,



                        ),
                      ],
                    ),
                  ]

              ),
              SizedBox(
                height: 50,

              ),
              Center(
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20.0),
                  color: darkGold,
                  child: new MaterialButton(
                      textColor: Colors.white,
                      child: new Text("Create"),
                      onPressed: () {
//                      Navigator.pushNamed(context, event);
}

                  ),
),

              ),
            ]),

      ),
    );
  }
}







