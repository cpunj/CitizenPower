import 'package:citizenpower/constants.dart';
import 'package:citizenpower/controllers/post_controller.dart';
import 'package:citizenpower/controllers/profile_controller.dart';
import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/genericWidgets/generic_layouts.dart';
import 'package:citizenpower/models/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Stores the data the user is uploading in their post
PostController postController = PostController();
ProfileController profileController = ProfileController();

class NewPost extends StatefulWidget {
  final FirebaseUser user;
  const NewPost({Key key, this.user}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  //GIve the postController the text the user has entered
  final postTextController = TextEditingController();

  int currentIndex = 2;

  //runs pickImage function for user to select the image they want in their post
  //External data so marked as async
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //Stores the file in the profile controller
    //And reruns state build to show the selected picture
    setState(() {
      postController.postImage = image;
    });
  }

  //Can be made if deemed necessary
  //_openCamera() {}

  //Dialog displayed when user selects the option to add a picture to their post
  _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text("Please select one"),
              //Contained the buttons that run the gallery option
              //Gesture detector does not seem to work in AlertDialog
              actions: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: FlatButton(
                    child: Text(
                      "Camera",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  onPressed: () {
                    getImage();
                  },
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    //Load the profile of the current user to stores in within a profile
    //This data is used to give posts the information about the user who posted it
    ///Might need to change this implementation to the my_profile.dart style to prevent errors
    profileController.loadProfile(widget.user.uid);

    final maxLines = 12;
    return Scaffold(
      appBar: new AppBar(
        title: Text("Create New Post"),
        elevation: 1.0,
        actions: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.white30,
              child: IconButton(
                //When user has finished post creating, pressing this uploads the post to their profile
                //in Firebase
                onPressed: () {
                  postController.uploadPost(
                      context,
                      postTextController.text,
                      widget.user.uid,
                      profileController.getName(),
                      profileController.getPic());
                },
                icon: Icon(
                  Icons.send,
                  size: 22,
                  color: Color.fromRGBO(195, 195, 195, 1),
                ),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 8),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    //TODO: Should show the currently logged in user's profile picture
                    backgroundImage: AssetImage("assets/Wilkie.jpeg"),
                  ),
                ],
              ),
              TextField(
                maxLines: maxLines,
                minLines: 5,
                decoration:
                    InputDecoration(hintText: "whats on your mind today?"),
                controller: postTextController,
              ),
              //Has the user given an image? Show it in the new post view
              postController.postImage != null
                  ? Container(
                      padding: EdgeInsets.only(top: 5.0),
                      //Limits the size of the given image
                      height: 200,
                      child: Image.file(postController.postImage))
                  //Simplest way to do if statements in Dart
                  : Container(
                      height: 0,
                    ),
              const Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              Row(
                children: <Widget>[
                  FlatButton.icon(
                      //Shows the dialog box for a user to select a picture from their files
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      icon: const Icon(
                        Icons.photo,
                        color: Colors.orangeAccent,
                      ),
                      label: Text("Photo")),
                  const VerticalDivider(
                    width: 7,
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.redAccent,
                      ),
                      label: Text("Videos")),
                  const VerticalDivider(
                    width: 7,
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        color: darkGold,
                      ),
                      label: Text("Location")),
                ],
              ),
            ],
          ),
        ),
        color: Colors.grey[100],
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
