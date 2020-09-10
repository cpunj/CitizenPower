import 'dart:io';

import 'package:citizenpower/models/post.dart';
import 'package:flutter/cupertino.dart';

import '../databaseServices/database.dart';
import '../databaseServices/database.dart';
import 'profile_controller.dart';

class PostController {
  Post newPost = Post();
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

  File postImage;
  //Uploads the post picture to Firebase Storage and returns the download link
  uploadPostPic(BuildContext context) {
    profileDatabaseMethods.uploadPic(context, postImage).then((val) {
      newPost.imageLink = val;
    });
  }

  //Uploads to post to the users profile
  uploadPost(BuildContext context, String postText, String uID) {
    uploadPostPic(context);
    newPost.postText = postText;
    profileDatabaseMethods.uploadPost(newPost, uID);
  }
}
