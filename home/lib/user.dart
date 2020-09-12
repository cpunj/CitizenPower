import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String id;
  final String photoUrl;
  final String name;
  final String displayName;
  final String bio;
  final Map followers;
  final Map following;

  const User(
      {this.name,
      this.id,
      this.photoUrl,
      this.email,
      this.displayName,
      this.bio,
      this.followers,
      this.following});

  factory User.fromDocument(DocumentSnapshot document) {
    return User(
      email: document['email'],
      name: document['username'],
      photoUrl: document['photoUrl'],
      id: document.documentID,
      displayName: document['displayName'],
      bio: document['bio'],
      followers: document['followers'],
      following: document['following'],
    );
  }
}
