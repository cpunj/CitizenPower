import 'dart:io';

import 'package:citizenpower/models/post.dart';
import 'package:flutter/cupertino.dart';

import '../databaseServices/database.dart';

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
    //TODO: uploadPost needs to wait for uploadPostPic to complete, currently a null picLink is uploaded at 1st attempt
    profileDatabaseMethods.uploadPost(newPost, uID);
  }
}
