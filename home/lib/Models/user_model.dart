import 'package:flutter/material.dart';
import 'massage_model.dart';
import '../Views/MessageViews/chatscreen.dart';
import '../Views/MessageViews/recent_chat.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;

  User({
    this.id,
    this.name,
    this.imageUrl,
  });
}
