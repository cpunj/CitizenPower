import 'dart:io';
import 'dart:ui';
import '../../models/group.dart';
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
  List<bool> isSelected;

  @override
  void initState(){
    isSelected = [false, true];
    super.initState();
  }



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
        title: Text("Create Group"),
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
                    labelText: "Group Description",
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
              padding: EdgeInsets.symmetric(horizontal: 80,vertical:30),
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
                            print('Public');
                          } else {
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
          height: 20,

        ),
              Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20.0),
                    color: darkGold,
                    child: new MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                      textColor: Colors.white,
                      child: new Text("Create", style: TextStyle(fontWeight: FontWeight.bold),),

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