import 'dart:io';
import 'package:citizenpower/models/group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';
import '../profileViews/profile_page_edit.dart';

Group group = new Group();

class CreateNewGroup extends StatefulWidget {
  @override
  _CreateNewGroupEState createState() => _CreateNewGroupEState();
}

class _CreateNewGroupEState extends State<CreateNewGroup> {
  File eventImage;

  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      //Stores the file in the profile controller
      //And returns state build to show the selected picture
      setState(() {
        eventImage = image;
      });
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text("Create new Group"),
        elevation: 1.0,
      ),


      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
            children: [

            TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Group Name",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),

                ),
              ),
          SizedBox(
            height: 60,
          ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: "Group Desctiption",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )


                ),

              ),
              SizedBox(
                height: 60,

              ),
              Column(
                  children: [
                    (eventImage != null)?
                        GestureDetector(child: Image.file(eventImage), onTap:() {
                          getImage();
                        }):
              OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 150,vertical:30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)

              ),
              onPressed: () {
                getImage();
              },
              child: Text("Add group photo"),

         
    ),
    ],
              ),
              SizedBox(
                height: 20,

              ),
              Column(
                  children: [
                    Container(padding: EdgeInsets.only(bottom: 7),child: Text("Choose Privacy Level")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: () {},
                  child: Text("Public"),



    ),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: () {},
                    child: Text("Private"),



                  ),
                ],
              ),
    ]

        ),
        SizedBox(
          height: 20,

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

         }

      ),
                  ),

  ),
      ]
    ),
    ),

    );
}
}