import 'dart:io';

import 'package:citizenpower/models/post.dart';
import 'package:flutter/cupertino.dart';

import '../databaseServices/database.dart';
import '../databaseServices/database.dart';
import 'profile_controller.dart';

class PostController {
  //Stores a post for upload or used for view
  Post newPost = Post();
  //Contains query/add methods
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();
  //Stores the file that will be uploaded to FS Storage
  File postImage;
  //Uploads the post picture to Firebase Storage and returns the download link
  uploadPostPic(BuildContext context) {
    profileDatabaseMethods.uploadPic(context, postImage).then((val) {
      newPost.imageLink = val;
    });
  }

  //Uploads to post to the users profile
  uploadPost(BuildContext context, String postText, String uID, String name,
      String profilePicLink) {
    //Uploads pic to storage
    uploadPostPic(context);
    //Sets post text from view
    newPost.postText = postText;
    newPost.name = name;
    newPost.profilePicLink = profilePicLink;
    //Uploads post with text and file download url
    profileDatabaseMethods.uploadPost(newPost, uID);
  }
}
